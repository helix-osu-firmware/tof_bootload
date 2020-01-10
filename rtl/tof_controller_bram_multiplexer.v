`timescale 1ns / 1ps
// multiplex access to the BRAM by the TOF controller
module tof_controller_bram_multiplexer( input clk200_i,
                                        // TOF controller side
                                        input [6:0]     cfg_addr_i,
                                        input           cfg_rd_i,
                                        input [6:0]     mon_addr_i,
                                        input           mon_wr_i,
                                        input [15:0]    mon_dat_i,
                                        output [15:0]   cfg_dat_o,
                                        
                                        // BRAM side
                                        output [9:0]    bram_addr_o,
                                        output [15:0]   bram_dat_o,
                                        input [15:0]    bram_dat_i,
                                        output          bram_en_o,
                                        output          bram_wr_o
                                        );
    reg bram_wr = 0;
    reg mon_wr_delayed = 0;
    reg [15:0] bram_dat = {16{1'b0}};

    // Write interface from PicoBlaze side is used for two things:
    // either an update to the monitor data, or to clear the
    // needs_update bit which is written into the BRAM
    // on each write from the control side.
    //
    // Neither of these things happen at the same time, so there's no
    // worry about this. Some protection needs to be added on the
    // merger side, but it's basically software, as in,
    // don't write to those addresses after an update.

    always @(posedge clk200_i) begin
        bram_wr <= (mon_wr_i || cfg_rd_i);
        mon_wr_delayed <= mon_wr_i;
        
        // Clear the needs_update bit (bit 15).
        if (mon_wr_i) bram_dat <= mon_dat_i;
        else bram_dat <= {1'b0,bram_dat_o[14:0]};
    end
    
    assign cfg_dat_o = bram_dat_i;
    assign bram_addr_o = (mon_wr_delayed) ? { 3'b001, mon_addr_i } : {3'b000, cfg_addr_i };
    assign bram_wr_o = bram_wr;
    assign bram_dat_o = bram_dat;
    assign bram_en_o = 1'b1;
endmodule
