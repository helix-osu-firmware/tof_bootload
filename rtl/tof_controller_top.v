// this guy runs entirely in the 200 MHz domain
module tof_controller_top(  input clk_i,
                        input rst_i,
                        output init_o,
                        input  init_done_i,
                        output ready_o,
                        input update_i,
                        output updating_o,
                        output update_complete_o,
                        // monitoring rate
                        input [15:0] mon_rate_i,
                        
                        // there are 65 total registers for DACs, plus 1 general purpose for power enables
                        output [6:0]    cfg_addr_o,
                        input [15:0]    cfg_dat_i,
                        // and there are 77 total registers for monitoring stuff
                        output [6:0]    mon_addr_o,
                        output [15:0]   mon_dat_o,
                        output          mon_wr_o,
                        
                        input [1:0] scl_i,
                        output [1:0] scl_o,
                        output [1:0] scl_t,
                        input [1:0] sda_i,
                        output [1:0] sda_o,
                        output [1:0] sda_t);

    reg update_complete = 0;
    reg updating = 0;
    reg update_request = 0;
    
    reg axi_resetn = 0;    
    reg ready = 0;
    reg init = 0;
    reg [7:0] mon_tmp = {8{1'b0}};
    reg [6:0] mon_addr = {7{1'b0}};    

    reg [6:0] cfg_addr = {7{1'b0}};

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

    wire [7:0] tof_controller_inport;
        
    // the entire AXI bridge/bus/IP cores are all in a block diagram embedded in
    // an IP core. sucks but best way to do it.
    
    // The AXI bridge eats up 32 registers from 00-1F, and k_write_strobe
    // can be used.
    
    // We don't need a lot of other registers so we just use [7:5] to decode (except for the 16 bit guys).
    // 20/21: cfg_dat_i[15:0]
    // 40   : cfg_adr[7:0]
    // 60/61: mon_dat_o[15:0]  - note that a write to 60 executes a write to mon_addr
    // 80   : mon_adr[7:0]
    // A0/A1: mon_rate[15:0]
    // C0   : [7] = ready, [6] init, [4] init_done, [2] update_complete, [1] = updating, [0] = update_request
    // E0   : [0] = AXI reset
    wire [7:0] pb_port_mux[7:0];    
    assign pb_port_mux[0] = tof_controller_inport;
    assign pb_port_mux[1] = (port_id[0]) ? cfg_dat_i[15:8] : cfg_dat_i[7:0];
    assign pb_port_mux[2] = {1'b0, cfg_addr };
    assign pb_port_mux[3] = (port_id[0]) ? mon_tmp[15:8] : mon_tmp[7:0];
    assign pb_port_mux[4] = {1'b0, mon_addr };
    assign pb_port_mux[5] = (port_id[0]) ? mon_rate_i[15:8] : mon_rate_i[7:0];
    assign pb_port_mux[6] = { ready , init, 1'b0, init_done_i, 1'b0, update_complete, updating, update_request };
    assign pb_port_mux[7] = 8'h00;
    assign in_port = pb_port_mux[port_id[7:5]];

    localparam [7:0] PB_MASK_16BIT = 8'b11100001;
    localparam [7:0] PB_MASK_8BIT  = 8'b11100000;

    always @(posedge clk_i) begin
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
    // IIC 0 is at AXI 0000
    // IIC 1 is at AXI 1000
    `define NO_PREFIX
    `define NO_SUFFIX
    `define IIC_CONNECT( port_prefix , prefix , suffix )   \
        .``port_prefix``scl_i ( prefix``scl_i``suffix ),    \
        .``port_prefix``scl_o ( prefix``scl_o``suffix ),    \
        .``port_prefix``scl_t ( prefix``scl_t``suffix ),    \
        .``port_prefix``sda_i ( prefix``sda_i``suffix ),    \
        .``port_prefix``sda_o ( prefix``sda_o``suffix ),    \
        .``port_prefix``sda_t ( prefix``sda_t``suffix )

    tof_controller_v1 u_controls(.clk200(clk_i),
                                 .aresetn(axi_resetn),
                                 .k_write_strobe(k_write_strobe),
                                 .write_strobe(write_strobe),
                                 .read_strobe(read_strobe),
                                 .port_id(port_id),
                                 .out_port(out_port),
                                 .in_port(tof_controller_inport),
                                 `IIC_CONNECT( IIC_0_ , `NO_PREFIX , [0] ),
                                 `IIC_CONNECT( IIC_1_ , `NO_SUFFIX , [1] ));                                 

    kcpsm6 u_picoblaze(.address(address),.instruction(instruction),.bram_enable(bram_enable),
                        .in_port(in_port),.out_port(out_port),.port_id(port_id),
                        .write_strobe(write_strobe),.k_write_strobe(k_write_strobe),
                        .read_strobe(read_strobe),.interrupt(interrupt),.interrupt_ack(interrupt_ack),
                        .sleep(sleep),.reset(rst_i),.clk(clk_i));
                        
    tof_controller_rom u_rom(.address(address),.instruction(instruction),.clk(clk_i));                            

    assign mon_wr_o = (write_strobe && ((port_id & PB_MASK_16BIT) == 8'h60));
    assign mon_dat_o = { mon_tmp, out_port };
    assign mon_addr_o = mon_addr;
    assign cfg_addr_o = cfg_addr;
    assign updating_o = updating;
    assign update_complete_o = update_complete;
    assign ready_o = ready;
    assign init_o = init;                        
endmodule