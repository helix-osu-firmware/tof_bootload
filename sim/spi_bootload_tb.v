`timescale 1ns / 1ps

module spi_bootload_tb;

    wire clk;
    tb_rclk #(.PERIOD(12.5)) u_clk(.clk(clk));
    
    reg rst = 1;
    wire sclk;
    wire mosi;
    wire miso;
    pulldown(miso);
    wire cs_b;
    
    wire hold;
    pullup(hold);
    wire w;
    pullup(w);
        
    spi_bootload u_spi(.clk_i(clk),.rst_i(rst),.spi_cs_b_o(cs_b),.spi_sclk_o(sclk),.spi_mosi_o(mosi),.spi_miso_i(miso));
    N25Qxxx u_memory( .S(cs_b),.C_(sclk), .DQ0(mosi),.DQ1(miso),.Vcc(3300),.HOLD_DQ3(hold),.Vpp_W_DQ2(w));
    
    initial begin
        rst = 1;
        #150000; @(posedge clk) #1 rst = 0;
    end    
    
endmodule