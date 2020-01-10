// this guy runs entirely in the 200 MHz domain
module tof_controller(  input clk_i,
                        input rst_i,
                        output ready_o,
                        input update_i,
                        output update_complete_o,
                        // monitoring rate
                        input [15:0] mon_rate_i,
                        
                        // there are 65 total registers for DACs, plus 1 general purpose for power enables
                        output [6:0] cfg_addr_o,
                        input [15:0] cfg_dat_i,
                        // and there are 77 total registers for monitoring stuff
                        output [6:0]    mon_addr_o,
                        output [15:0]   mon_dat_o,
                        output          mon_wr_o,
                        
                        inout [1:0] sda_io,
                        inout [1:0] scl_io );

    reg update_complete = 0;
    reg update_seen = 0;
    
    reg [7:0] mon_tmp = {8{1'b0}};
    reg [6:0] mon_addr = {7{1'b0}};    

    reg [6:0] cfg_addr = {7{1'b0}};

    wire [11:0] address;
    wire [17:0] instruction;
    wire [7:0] in_port;
    wire [7:0] out_port;
    wire [7:0] port_id;
    wire write_strobe;
    wire k_write_strobe;
    wire read_strobe;
    wire interrupt;
    wire interrupt_ack;
    wire sleep;
    wire reset;
        
    

                        
endmodule