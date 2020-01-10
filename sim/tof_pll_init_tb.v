module tof_pll_init_tb;

    wire clk200;
    tb_rclk #(.PERIOD(5.0)) u_clk200(.clk(clk200));
    
    reg rst200 = 0;
    reg init = 0;
    reg init_skip = 0;
    wire init_done;
    wire sclk;
    wire sdin;
    wire load;
    
    tof_pll_init pll_init(.clk200_i(clk200),.rst200_i(rst200),.init_i(init),.init_skip_i(init_skip),.init_done_o(init_done),
                        .pll_sclk_o(sclk),.pll_sdin_o(sdin),.pll_load_o(load));
    
    initial begin
        #100;
        @(posedge clk200); #1 rst200 = 1; @(posedge clk200); #1 rst200 = 0;
        
        #100;
        @(posedge clk200); #1 init = 1;
    end
    
    
endmodule