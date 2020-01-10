// Wrap the TOF controller in an interface to the Aurora control packet decoder.
// Note that because all of the PicoBlaze-y type controls are less than 16 bits
// we steal the top bit (auto-inserted!) to indicate to the PicoBlaze that a write
// to that address has occurred since the last update, and therefore it properly
// needs to be updated. Otherwise the PicoBlaze just zips through the config space
// and ignores stuff.
//
// Updating ALL of the I2C devices would take nearly ~30 ms for each update,
// which is pretty large.
module tof_controller_interface(
        input           clk_i,
        input           clk200_i,
        input           rst200_i,
        input           en_i,
        input [7:0]     addr_i,
        input [15:0]    dat_i,
        input           wr_i,
        output [15:0]   dat_o,
        output          dat_valid_o,
        input           update_i,
        output          updating_o,
        
        output          init_o,
        output          init_skip_o,
        input           init_done_i,
        
        output          ready_o,
        
        input   [1:0]   scl_i,
        output  [1:0]   scl_o,
        output  [1:0]   scl_t,
        input   [1:0]   sda_i,
        output  [1:0]   sda_o,
        output  [1:0]   sda_t
        );

    parameter [15:0] MONRATE_DEFAULT = 664;
    parameter SIM_SPDUP = "FALSE";
    
    reg regce = 0;
    reg datvalid = 0;
    assign dat_valid_o = datvalid;
    always @(posedge clk_i) regce <= (en_i && !wr_i);
    always @(posedge clk_i) datvalid <= regce;
    
    // optimize this
    wire en200;
    wire wr200;
    wire [9:0] addr200;
    wire [15:0] di200;
    wire [15:0] do200;

    // all the PicoBlaze controls are sub-16 bits, so we steal the top for a "needs update" bit.
    wire [15:0] config_data_in = {1'b1,dat_i[14:0]};
                
    // TOF interface is really just a 256 x 16-bit dual-port block RAM.
    BRAM_TDP_MACRO #(.BRAM_SIZE("18Kb"),.DOA_REG(1'b1),.DOB_REG(1'b0),//.INIT_FILE( some_filename ),
                     .READ_WIDTH_A(16),.WRITE_WIDTH_A(16),
                     .READ_WIDTH_B(16),.WRITE_WIDTH_B(16)) 
                     u_confmon_bram(.CLKA(clk_i),.CLKB(clk200_i),
                                    .REGCEA(regce),// optimize this
                                    .RSTA(1'b0),.RSTB(1'b0),
                                    .ADDRA(addr_i),.DIA(config_data_in),.DOA(dat_o),.ENA(en_i),.WEA(wr_i),
                                    .ADDRB(addr200),.DIB(di200),.DOB(do200),.ENB(en200),.WEB(wr200));
    wire [15:0] cfg_data;
    wire [6:0] cfg_addr;
    wire       cfg_rd;
    wire [6:0] mon_addr;
    wire [15:0] mon_data;
    wire       mon_wr;
    // Mux the control and monitor path to the BRAM.
    tof_controller_bram_multiplexer u_multiplexer(.clk200_i(clk200_i),
                                                .cfg_addr_i(cfg_addr),
                                                .cfg_rd_i(cfg_rd),
                                                .mon_addr_i(mon_addr),
                                                .mon_wr_i(mon_wr),
                                                .mon_dat_i(mon_data),
                                                .cfg_dat_o(cfg_data),
                                                
                                                .bram_addr_o(addr200),
                                                .bram_dat_o(di200),
                                                .bram_dat_i(do200),
                                                .bram_en_o(en200),
                                                .bram_wr_o(wr200));

    wire update200;
    wire updating200;    
    reg [2:0] updating = {3{1'b0}};
    reg mon_rate_update = 0;
    wire mon_rate_update200;
    reg [15:0] mon_rate = MONRATE_DEFAULT;
    reg [15:0] mon_rate200 = MONRATE_DEFAULT;
 
    // cross clock
    flag_sync u_update(.clkA(clk_i),.clkB(clk200_i),.in_clkA(update_i),.out_clkB(update200));
    flag_sync u_monrate_update(.clkA(clk_i),.clkB(clk200_i),.in_clkA(mon_rate_update),.out_clkB(mon_rate_update200));

    always @(posedge clk_i) begin
        updating <= {updating[1:0],updating200};
        // Monitor rate update is address 0xFF. It's updated automatically (not at update), and is
        // not stored in BRAM.
        // Note that I have NO IDEA why you would ever want to change this, it basically HAS to be the value that it is.
        // MAYBE it could be slower, but... why...?
        mon_rate_update <= &addr_i && en_i && wr_i;
        if (&addr_i && en_i && wr_i) mon_rate <= dat_i;
    end
    always @(posedge clk200_i) begin
        if (mon_rate_update200) mon_rate200 <= mon_rate;
    end
        
    tof_controller_top_v2 #(.SIM_SPDUP(SIM_SPDUP)) u_controller(.clk_i(clk200_i),
                                       .rst_i(rst200_i),
                                       .init_o(init_o),
                                       .init_skip_o(init_skip_o),
                                       .init_done_i(init_done_i),
                                       .ready_o(ready_o),
                                       .update_i(update200),
                                       .updating_o(updating200),
                                       .mon_rate_i(mon_rate200),
                                       
                                       .cfg_addr_o(cfg_addr),
                                       .cfg_rd_o(cfg_rd),
                                       .cfg_dat_i(cfg_data),
                                       
                                       .mon_addr_o(mon_addr),
                                       .mon_wr_o(mon_wr),
                                       .mon_dat_o(mon_data),
                                       
                                       .scl_i(scl_i),
                                       .scl_o(scl_o),
                                       .scl_t(scl_t),
                                       .sda_i(sda_i),
                                       .sda_o(sda_o),
                                       .sda_t(sda_t));                                           


endmodule
        