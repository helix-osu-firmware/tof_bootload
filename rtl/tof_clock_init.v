module tof_clock_init(  input clk_i,
                        output pll_sclk_o,
                        output pll_sdin_o,
                        output pll_load_o,
                        input pll_lock_i );

// 34002D  = 0011 0100 0000 0000 0010 1101
// 0481A4  = 0000 0100 1000 0001 1010 0100
// 002C0A  = 0000 0000 0010 1100 0000 1010

        localparam [23:0] INIT_0 = 24'h34002D;
        localparam [23:0] INIT_1 = 24'h0481A4;
        localparam [23:0] INIT_2 = 24'h002C0A;
    

endmodule
