`timescale 1ns / 1ps
// we use 4 16-bit registers for access to SPI. Data is always read/written pages (256 bytes) at a time!
// This is flash memory - you have to ERASE before PROGRAM. ERASING is done once for each sector (64 kB).
// This means programming 64 kB takes ~180 milliseconds, and fully programming the TOF bitstream will
// take ~6 seconds or longer. Please note this is still STUPID FAST.
//
// 0: FIFO keyhole. Write data into FIFO to be written to SPI. Read data from FIFO from SPI.
//    When written into SPI, [15:8] is the second word in, [7:0] is the first word in.
//    Ditto for the reverse.
// 1: Argument or result from operation, [15:0].
// 2: Argument or result from operation, [31:16].
// 3: Operation/status register.
//
// Operations are the same as SPI operations, but only some are supported:
// 0x02 PAGE PROGRAM (takes ~0.12 ms typ, max 1.8 ms) (or 0x12 4-BYTE-ADDR PAGE PROGRAM)
// 0x03 READ (takes ~0.05 ms) (or 0x13 4-BYTE-ADDR READ)
// 0xD8 SECTOR ERASE (64 kB: (or 0xDC 4-BYTE-ADDR SECTOR ERASE)
// 0x9E READ ID
// 0xE3 WRITE NONVOLATILE LOCK BITS
// 0xE4 ERASE NONVOLATILE LOCK BITS
// 0xFF ICAP_REBOOT
//
// Note that the 4-byte-addr operations can be used for the 3-byte devices too, but
// the top byte of the argument must be 0xFF.
//
// [15:8] is a check byte: it's equal to [7:0] ^ ADDR[31:24] ^ ADDR[23:16] ^ ADDR[15:8] ^ ADDR[7:0]
// ALL THREE registers must be written for a command to be processed, even if there
// is no argument (read ID/enter/release from power down).
//
//
// Status register
// [0]: Command busy.
// [1]: Last command complete.
// [2]: Last command match error.
// [3]: Last command timed out.
//
// Reading the status register will take until the command completes
// UNLESS the data IN the read is set to 0xFFFF. (Holy crap, we're abusing the
// packet format).
//
// IF you write 0x6699 to the operation register FOUR TIMES (this is not
// a joke, 0x66 is RESET ENABLE and 0x99 is RESET MEMORY, don't blame me)
// the controller will interrupt itself, execute RESET ENABLE / RESET MEMORY
// and go back to normal behavior.
//
// Note: commands CAN and WILL take a macroscopic amount of time to complete.
// Resetting should NEVER be necessary unless something goes horribly wrong,
// because the code has an internal timeout on all operations: 10 ms on
// page program/write nonvolatile lock bits operations, and 2 ** seconds ** on 
// sector erase/erase nonvolatile lock bits operations.
//
// So nominally the basic sequence would be something like
// 6: write 0 to 1
// 7: write 0 to 2
// 8: write 0x9E9E to 3
// 9: read 3, check for error.
// 10: read 1 and 2 and confirm device ID.
// 11: write ADDR[15:0] to 1
// 12: write ADDR[23:16] to 2
// 13: write 0x[check]D8 (where [check] = D8^ADDR[23:16]^ADDR[15:8]^ADDR[7:0].)
// 14: read 3, check for error.
// 15: write 128x to 0
// 16: write ADDR[15:0] to 1
// 17: write ADDR[23:16] to  2
// 18: write 0x[check]02 (where [check] = 02^ADDR[23:16]^ADDR[15:8]^ADDR[7:0].)
// 19: read 3, check for error.
// then repeat from step 15 256x
// then repeat from step 11 for however many sectors.
module spi_bootload( input clk_i,
                     input rst_i,
                     // when en_i && wr_i, data on dat_i is written into the address adr_i
                     // when en_i && !wr_i, data from address adr_i is placed on dat_o,
                     //    and valid when dat_valid_o.
                     // if WAIT_RESPONSE = "TRUE", then dat_valid_o can come WAAAY later
                     // than en_i (it's pushed out when the PicoBlaze writes to it).
                     // otherwise it's valid 1 clock later, and it's just a shadow of the
                     // PicoBlaze register.
                     // WAIT_RESPONSE = "TRUE" is helpful if the interface is written
                     // to be able to arbitrarily wait. Then software just has to make sure
                     // that it doesn't send more control packets than can be buffered.
                     input en_i,
                     input [1:0] adr_i,
                     input       wr_i,
                     input [15:0] dat_i,
                     output [15:0] dat_o,
                     output dat_valid_o,

                     output spi_cs_b_o,
                     output spi_sclk_o,
                     output spi_mosi_o,
                     input spi_miso_i);

    parameter WAIT_RESPONSE = "TRUE";
    localparam [15:0] RESET_MATCH = 16'h6699;

    reg cs_b = 1;
    reg sclk = 0;
    reg mosi = 0;
    reg miso = 0;

    // this corresponds to 8 picoblaze registers,
    // located at 10-17    
    // the SPI data FIFO is 256x16, which is mass overkill, but
    // that's bigger than 0.5 BRAM anyway.
    wire [7:0] fifo_data_out;
    wire fifo_data_valid;
    wire [15:0] fifo_addr_data = { {7{1'b0}}, !fifo_data_valid, fifo_data_out };
    reg [15:0] arg0 = {16{1'b0}};
    reg [15:0] arg1 = {16{1'b0}};
    reg [15:0] cmd = {16{1'b0}};
    reg [3:0] cmd_pending = {8{1'b0}};    
    wire [15:0] cmd_status_out;
    wire [15:0] dat_mux[3:0];
    assign dat_mux[0] = fifo_addr_data;
    assign dat_mux[1] = arg0;
    assign dat_mux[2] = arg1;
    assign dat_mux[3] = cmd_status_out;
    
    // set by (en_i && !wr_i && (adr_i != 2'b11 || (WAIT_RESPONSE != "TRUE")  || (cmd_was_busy && !cmd_busy))
    // that is, immediate ack after any address if WAIT_RESPONSE != "TRUE",
    // else immediate ack to any address other than status,
    // and ack to status when cmd_busy falls. 
    reg dat_valid = 0;
    // captured read address
    reg [1:0] read_adr = 2'b00;
    // set by en_i && !wr_i and cleared by dat_valid
    reg read_pending = 0;
        
    reg cmd_was_busy = 0;
    reg cmd_busy = 0;
    reg cmd_complete = 0;
    reg cmd_error = 0;
    reg cmd_timeout = 0;
    wire [7:0] cmd_status = { {4{1'b0}}, cmd_timeout, cmd_error, cmd_complete, cmd_busy };
    assign cmd_status_out = { {8{1'b0}}, cmd_status_out };
    // capture adr_i unless read_pending, then capture read_adr
    reg [15:0] dat = {16{1'b0}};

    wire [7:0] interface_regs[7:0];
    localparam [2:0] IF_CMD_PENDING = 0;
    localparam [2:0] IF_CMD_STATUS = 1;
    localparam [2:0] IF_CMD = 2;
    localparam [2:0] IF_ARG0 = 4;
    localparam [2:0] IF_ARG1 = 6;
    assign interface_regs[IF_CMD_PENDING] = {{4{1'b0}}, cmd_pending};
    assign interface_regs[IF_CMD_STATUS] = cmd_status;
    assign interface_regs[IF_CMD] = cmd[7:0];
    assign interface_regs[IF_CMD+1] = cmd[15:8];
    assign interface_regs[IF_ARG0] = arg0[7:0];
    assign interface_regs[IF_ARG0+1] = arg0[15:8];
    assign interface_regs[IF_ARG1] = arg1[7:0];
    assign interface_regs[IF_ARG1+1] = arg1[15:8];
    
    reg [1:0] reset_counter = {2{1'b0}};
    wire [2:0] reset_counter_plus_one = reset_counter + 1;
    
    wire [11:0] address;
    wire [17:0] instruction;
    wire bram_enable;
    reg [7:0] in_port = {8{1'b0}};
    wire [7:0] out_port;
    wire [7:0] port_id;
    wire write_strobe;
    wire k_write_strobe;
    wire read_strobe;
    reg interrupt = 0;
    wire interrupt_ack;
    wire sleep = 0;
    reg reset = 0;
    // derived stuff
    // outputk functions use only bottom 4 bits
    wire [7:0] kport_id = { {4{1'b0}}, port_id[3:0] };
    // combined hybrid port (can be both output/outputk)
    wire [7:0] h_port_id = (k_write_strobe) ? kport_id : port_id;    
  
    wire [7:0] spi_in_port = { {5{1'b0}}, spi_miso_i,{2{1'b0}}};
    // simplify decoding. the interface gets 10-1F, and SPI gets 00-0F, FIFO gets 20-2F, reset gets 30-3F
    // but SPI only needs 4 registers: input/cs_select, clk/cs, data, and output.
    // so only decode the bottom two bits.
    localparam [7:0] pb_base_mask = 8'h30;

    // these all get ORed with pb_base_mask effectively
    localparam [7:0] spi_clk_port_mask =  8'h01; // 0011 0001 : decode bit 5/4 and bit 0 only (clk/cs and output, reg 1 & 3)
    localparam [7:0] spi_data_port_mask = 8'h02; // 0011 0010 : decode bit 5/4 and bit 1 only (data and output, reg 2 & 3)
    localparam [7:0] interface_port_mask = 8'h07;// 0011 0111 : decode bit 5/4 and 0/1/2    
    localparam [7:0] reset_port_mask = 8'h07;    // 0011 0111 : decode bit 5/4 and 0/1/2
    localparam [7:0] SPI_BASE = 8'h00;
    localparam [7:0] INTERFACE_BASE = 8'h10;
    localparam [7:0] FIFO_BASE = 8'h20;
    localparam [7:0] RESET_BASE = 8'h30;

    wire fifo_if_write = (en_i && wr_i && (adr_i == 2'b00));
    wire fifo_if_read = (en_i && !wr_i && (adr_i == 2'b00));
    wire fifo_if_reset = (en_i && wr_i && (adr_i == 2'b00) && dat_i[15]);

    reg fifo_write = 0;
    reg fifo_read = 0;
    reg [7:0] fifo_data = {8{1'b0}};
        
    // On the PicoBlaze side, we just blatantly assume that reads/writes will work.    
    wire fifo_pb_write = (write_strobe && ((port_id & pb_base_mask) == FIFO_BASE));
    wire fifo_pb_read = (read_strobe && ((port_id & pb_base_mask) == FIFO_BASE));

    // ICAP stuff. Store WBSTAR register.
    localparam [2:0] RESET_RST = 0;
    localparam [2:0] RESET_WBSTAR = 4;
    reg [31:0] wbstar = {32{1'b0}};
    reg icap_reboot = 0;
    wire [7:0] reset_regs[2:0];
    assign reset_regs[0] = {8{1'b0}};
    assign reset_regs[1] = reset_regs[0];
    assign reset_regs[2] = reset_regs[0];
    assign reset_regs[3] = reset_regs[0];
    assign reset_regs[4] = wbstar[0 +: 8];
    assign reset_regs[5] = wbstar[8 +: 8];
    assign reset_regs[6] = wbstar[16 +: 8];
    assign reset_regs[7] = wbstar[24 +: 8];

    wire [7:0] in_port_mux[3:0];
    assign in_port_mux[0] = spi_in_port;
    assign in_port_mux[1] = interface_regs[port_id[2:0]];
    assign in_port_mux[2] = fifo_data_out;
    assign in_port_mux[3] = reset_regs[port_id[2:0]];


    always @(posedge clk_i) begin
        in_port <= in_port_mux[ port_id[5:4] ];

        if (en_i && wr_i) begin
            if (adr_i == 2'b11 && dat_i == RESET_MATCH) reset_counter <= reset_counter_plus_one;
            else reset_counter <= {2{1'b0}};
        end

        if (interrupt_ack) interrupt <= 0;
        else if (en_i && wr_i && adr_i == 2'b11 && dat_i == RESET_MATCH && reset_counter_plus_one[2]) interrupt <= 1;            
    
        if ( (write_strobe || k_write_strobe) && ((h_port_id & (spi_clk_port_mask | pb_base_mask)) == (8'h01 | SPI_BASE))) begin
            sclk <= out_port[0];
            cs_b <= out_port[1];
        end
        if ( (write_strobe || k_write_strobe) && ((h_port_id & (spi_data_port_mask | pb_base_mask)) == (8'h02 | SPI_BASE))) begin
            mosi <= out_port[7];
        end
        
        dat_valid <= (en_i && !wr_i && (adr_i != 2'b11 || (WAIT_RESPONSE != "TRUE")  || (cmd_was_busy && !cmd_busy)));

        // normally dat_valid will autoclear read_pending next clock.
        if (dat_valid) read_pending <= 0;
        else if (en_i && !wr_i) read_pending <= 1;
        if (en_i && !wr_i && !read_pending) read_adr <= adr_i;
        
        // arg0 capture inbound
        if (en_i && wr_i && adr_i == 2'b01) arg0 <= dat_i;
        // picoblaze capture
        else if (write_strobe && ((port_id & pb_base_mask) == INTERFACE_BASE)) begin
            if (port_id & interface_port_mask == IF_ARG0) arg0[7:0] <= out_port;
            if (port_id & interface_port_mask == (IF_ARG0+1)) arg0[15:8] <= out_port;
        end
        // arg1 capture inbound
        if (en_i && wr_i && adr_i == 2'b10) arg1 <= dat_i;
        // picoblaze capture
        else if (write_strobe && ((port_id & pb_base_mask) == INTERFACE_BASE)) begin
            if (port_id & interface_port_mask == IF_ARG1) arg1[7:0] <= out_port;
            if (port_id & interface_port_mask == (IF_ARG0+1)) arg1[15:8] <= out_port;
        end
        // cmd capture inbound
        if (en_i && wr_i && adr_i == 2'b11) cmd <= dat_i;
        // picoblaze capture
        else if (write_strobe && ((port_id & pb_base_mask) == INTERFACE_BASE)) begin
            if (port_id & interface_port_mask == IF_CMD) cmd[7:0] <= out_port;
            if (port_id & interface_port_mask == (IF_CMD+1)) cmd[15:8] <= out_port;
        end

        // cmd_pending. PicoBlaze overrides the inbound stuff,
        // this is just to make it easily readable. The PB write should never
        // occur until AFTER all the others have been set
        // note the write value doesn't matter.
        if (reset || (write_strobe && ((port_id & (pb_base_mask | interface_port_mask)) == (IF_CMD_PENDING | INTERFACE_BASE))))
            cmd_pending <= 4'h0;
        else if (en_i && wr_i) cmd_pending[adr_i] <= 1;
            cmd_pending[adr_i] <= 1'b1;

        // as soon as all 3 commands become written to, go for it
        cmd_busy <= &cmd_pending[3:1];

        // clear status on rising edge of cmd_busy signal
        if (reset || (cmd_busy && !cmd_was_busy)) begin
            cmd_complete <= 0;
            cmd_error <= 0;
            cmd_timeout <= 0;            
        end else if (write_strobe && ((port_id & (pb_base_mask | interface_port_mask)) == (IF_CMD_STATUS | INTERFACE_BASE))) begin
            cmd_complete <= out_port[1];
            cmd_error <= out_port[2];
            cmd_timeout <= out_port[3];
        end

        if (write_strobe && ((port_id & (pb_base_mask | reset_port_mask)) == RESET_BASE)) begin
            reset <= out_port[0];
            icap_reboot <= out_port[7];
        end else begin
            reset <= 0;
            icap_reboot <= 0;
        end
        if (write_strobe && ((port_id & pb_base_mask) == RESET_BASE)) begin
            if ((port_id & reset_port_mask) == RESET_WBSTAR) wbstar[0 +: 8] <= out_port;
            if ((port_id & reset_port_mask) == RESET_WBSTAR+1) wbstar[8 +:  8] <= out_port;
            if ((port_id & reset_port_mask) == RESET_WBSTAR+2) wbstar[16 +: 8] <= out_port;
            if ((port_id & reset_port_mask) == RESET_WBSTAR+3) wbstar[24 +: 8] <= out_port;
        end
        
        if (read_pending) dat <= dat_mux[read_adr]; else dat <= dat_mux[adr_i];
        
        // FIFO multiplexing. Software needs to NOT eff this up.
        fifo_read <= (fifo_if_read || fifo_pb_read);
        fifo_write <= (fifo_if_write || fifo_pb_write);
        fifo_data <= (fifo_pb_write) ? out_port : dat_i;        
    end
    
    spi_bootloader_fifo u_fifo(.clk(clk_i),.din(fifo_data),.wr_en(fifo_write),.dout(fifo_data_out),.rd_en(fifo_read),.srst(fifo_if_reset),
                                .valid(fifo_data_valid));
    
    kcpsm6 u_picoblaze(.address(address),.instruction(instruction),.bram_enable(bram_enable),
                        .in_port(in_port),.out_port(out_port),.port_id(port_id),
                        .write_strobe(write_strobe),.k_write_strobe(k_write_strobe),
                        .read_strobe(read_strobe),.interrupt(interrupt),.interrupt_ack(interrupt_ack),
                        .sleep(sleep),.reset(rst_i || reset),.clk(clk_i));
                        
    spi_bootloader u_rom(.clk(clk_i),.address(address),.instruction(instruction));

    iprog_rst u_rst(.CLK(clk_i),.RST(icap_reboot),.WBSTAR(wbstar),.RIP());
            
    assign spi_cs_b_o = cs_b;
    assign spi_sclk_o = sclk;
    assign spi_mosi_o = mosi;
endmodule
                                          