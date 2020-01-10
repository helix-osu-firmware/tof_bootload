`timescale 1ns / 1ps
// this guy runs entirely in the 200 MHz domain
module tof_controller_top_v2(  input clk_i,
                        input rst_i,
                        output init_o,
                        output init_skip_o,
                        input  init_done_i,
                        output ready_o,
                        input update_i,
                        output updating_o,
                        output update_complete_o,
                        // monitoring rate
                        input [15:0] mon_rate_i,
                        
                        // there are 65 total registers for DACs, plus 1 general purpose for power enables
                        output [6:0]    cfg_addr_o,
                        output          cfg_rd_o,
                        input [15:0]    cfg_dat_i,
                        // and there are 77 total registers for monitoring stuff
                        output [6:0]    mon_addr_o,
                        output [15:0]   mon_dat_o,
                        output          mon_wr_o,
                        
                        // generates a blinky LED
                        output          moncycle_toggle_o,
                                                
                        input [1:0] scl_i,
                        output [1:0] scl_o,
                        output [1:0] scl_t,
                        input [1:0] sda_i,
                        output [1:0] sda_o,
                        output [1:0] sda_t);

    // use regular timing, or fast (fake) timing                        
    parameter SIM_SPDUP = "FALSE";
    parameter DEBUG = "TRUE";
                            
    reg update_complete = 0;
    reg updating = 0;
    reg update_request = 0;
    
    reg ready = 0;
    reg init = 0;
    reg init_skip = 0;
    wire init_force;
    wire fake_init_done;
    reg [7:0] mon_tmp = {8{1'b0}};
    reg [6:0] mon_addr = {7{1'b0}};    

    reg [6:0] cfg_addr = {7{1'b0}};

    // these are for debugging
    reg moncycle_toggle = 0;
    wire mon_waiting;
    wire mon_wait_at_tick;
        
    wire [11:0] address;
    wire [17:0] instruction;
    wire bram_enable;
    wire [7:0] in_port;
    wire [7:0] out_port;
    wire [7:0] port_id;
    wire write_strobe;
    wire k_write_strobe;
    wire read_strobe;
    wire interrupt = 0;
    wire interrupt_ack;
    wire sleep = 0;
    wire reset;

    // The Soft I2C controller uses 4 ports, but only 1 is a read port.
    reg bus_sel = 0;
    reg [1:0] sda_tristate = {2{1'b1}};
    reg [1:0] scl_tristate = {2{1'b1}};
    wire sda_in = (bus_sel) ? sda_i[1] : sda_i[0];
    wire scl_in = (bus_sel) ? scl_i[1] : scl_i[0];    
    
    wire [7:0] i2c_inport = { {6{1'b0}}, sda_in, scl_in };
    
    // We don't need a lot of other registers so we just use [7:5] to decode (except for the 16 bit guys).
    // 20/21: cfg_dat_i[15:0]
    // 40   : cfg_adr[7:0]
    // 60/61: mon_dat_o[15:0]  - note that a write to 60 executes a write to mon_addr
    // 80   : mon_adr[7:0]
    // A0/A1: mon_rate[15:0]
    // C0   : [7] = ready, [6] init, [4] init_done, [2] update_complete, [1] = updating, [0] = update_request
    // E0   : unused
    wire [7:0] pb_port_mux[7:0];    
    assign pb_port_mux[0] = i2c_inport;
    assign pb_port_mux[1] = (port_id[0]) ? cfg_dat_i[15:8] : cfg_dat_i[7:0];
    assign pb_port_mux[2] = {1'b0, cfg_addr };
    assign pb_port_mux[3] = mon_tmp;  // like, why would you do this
    assign pb_port_mux[4] = {1'b0, mon_addr };
    assign pb_port_mux[5] = (port_id[0]) ? mon_rate_i[15:8] : mon_rate_i[7:0];
    assign pb_port_mux[6] = { ready , init, 1'b0, init_done_i | fake_init_done, init_force, update_complete, updating, update_request };
    assign pb_port_mux[7] = { {6{1'b0}}, mon_waiting, mon_wait_at_tick};
    assign in_port = pb_port_mux[port_id[7:5]];

    localparam [7:0] PB_MASK_32BIT = 8'b11100011;
    localparam [7:0] PB_MASK_16BIT = 8'b11100001;
    localparam [7:0] PB_MASK_8BIT  = 8'b11100000;

    wire [7:0] kport_id = (k_write_strobe) ? { {4{1'b0}},port_id[3:0] } : port_id;

    always @(posedge clk_i) begin
        init_skip <= (write_strobe && ((port_id & PB_MASK_8BIT) == 8'hC0)) && out_port[5];

        if (write_strobe && ((port_id & PB_MASK_32BIT) == 8'hE0) && out_port[7]) moncycle_toggle <= ~moncycle_toggle;
    
        // I2C core. This looks complicated but it should simplify pretty heavily
        if ((write_strobe || k_write_strobe) && ((kport_id & PB_MASK_32BIT) == 8'h00)) bus_sel <= out_port[0];
        // CLK is 1 and 3
        if ((write_strobe || k_write_strobe) && 
                (((kport_id & PB_MASK_32BIT) == 8'h01)||((kport_id & PB_MASK_32BIT)==8'h03))) scl_tristate[bus_sel] <= out_port[0];
        // DATA is 2 and 3
        if ((write_strobe || k_write_strobe) &&
                (((kport_id & PB_MASK_32BIT) == 8'h02)||((kport_id & PB_MASK_32BIT)==8'h03))) sda_tristate[bus_sel] <= out_port[1];
        
        if (write_strobe && ((port_id & PB_MASK_8BIT) == 8'h40))  cfg_addr <= out_port;
        if (write_strobe && ((port_id & PB_MASK_16BIT) == 8'h61)) mon_tmp <= out_port;
        if (write_strobe && ((port_id & PB_MASK_8BIT) == 8'h80)) mon_addr <= out_port;
        if (rst_i) begin
            ready <= 1'b0;
            init <= 1'b0;
            update_complete <= 1'b0;
            updating <= 1'b0;
        end else if (update_i) begin
            update_complete <= 1'b0;
        end else if (write_strobe && ((port_id & PB_MASK_8BIT) == 8'hC0)) begin
            ready <= out_port[7];
            init <= out_port[6];    
            update_complete <= out_port[2];
            updating <= out_port[1];
        end
        
        if (rst_i) begin
            update_request <= 1'b0;
        end else if (update_i) begin
            update_request <= 1'b1;
        end else if (update_complete) begin
            update_request <= 1'b0;
        end                
    end

    // this is the time reference for I2C. this isn't really "49 times faster" since the 5 us delay function is
    // 15 instructions + 10xHWBUILD or so, for instance, so it's actually only ~20 times faster.
    parameter [7:0] HWBUILD = (SIM_SPDUP == "TRUE") ? 8'd1 : 8'd49;
    kcpsm6 #(.HWBUILD(HWBUILD)) u_picoblaze(.address(address),.instruction(instruction),.bram_enable(bram_enable),
                        .in_port(in_port),.out_port(out_port),.port_id(port_id),
                        .write_strobe(write_strobe),.k_write_strobe(k_write_strobe),
                        .read_strobe(read_strobe),.interrupt(interrupt),.interrupt_ack(interrupt_ack),
                        .sleep(sleep),.reset(rst_i),.clk(clk_i));
                        
    tof_controller_v2 u_rom(.clk(clk_i),.address(address),.instruction(instruction));

    generate
        if (DEBUG == "TRUE") begin : VIO
            reg [7:0] mon_state = {8{1'b0}};
            reg [7:0] mon_channel = {8{1'b0}};
            reg mon_clear_wait_reg = 0;
            wire mon_clear_wait;
            reg mon_waiting = 0;
            always @(posedge clk_i) begin : DEBUG
                if (write_strobe && ((port_id & PB_MASK_32BIT) == 8'hE1)) mon_state <= out_port;
                if (write_strobe && ((port_id & PB_MASK_32BIT) == 8'hE2)) mon_channel <= out_port;
                if (mon_clear_wait && !mon_clear_wait_reg) mon_waiting <= 0; 
                else if (write_strobe && ((port_id & PB_MASK_32BIT) == 8'hE0) && out_port[1]) mon_waiting <= 1;
                mon_clear_wait_reg <= mon_clear_wait;
            end
            monitor_debug_vio u_vio(.clk(clk_i),.probe_in0(moncycle_toggle),.probe_in1(mon_waiting),
                                                .probe_in2(mon_state),.probe_in3(mon_channel),
                                                .probe_out0(mon_wait_at_tick),.probe_out1(mon_clear_wait),
                                                .probe_out2(init_force),
                                                .probe_out3(fake_init_done));
        end else begin
            assign mon_wait_at_tick =  0;
            assign mon_waiting = 0;
            assign init_force = 0;
            assign fake_init_done = 0;
        end
    endgenerate

    assign mon_wr_o = (write_strobe && ((port_id & PB_MASK_16BIT) == 8'h60));
    assign cfg_rd_o = (read_strobe && ((port_id & PB_MASK_16BIT) == 8'h40));
    assign mon_dat_o = { mon_tmp, out_port };
    assign mon_addr_o = mon_addr;
    assign cfg_addr_o = cfg_addr;
    assign updating_o = updating;
    assign update_complete_o = update_complete;
    assign ready_o = ready;
    assign init_o = init;                        
    assign init_skip_o = init_skip;
    
    assign moncycle_toggle_o = moncycle_toggle;
    
    assign sda_t = sda_tristate;
    assign scl_t = scl_tristate;
    assign sda_o = {2{1'b0}};
    assign scl_o = {2{1'b0}};
endmodule