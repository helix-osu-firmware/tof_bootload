`timescale 1ns / 1ps
module tof_pll_init( input clk200_i,
                     input sys_clk_i,
                     input rst200_i,
                     input init_i,
                     input init_skip_i,
                     output init_done_o,
                     
                     output pll_sclk_o,   // CLK
                     output pll_sdin_o,   // DATA
                     output pll_load_o,   // LE
                     input pll_lock_i );

        parameter SIM_SPDUP = "FALSE";

// 34002D  = 0011 0100 0000 0000 0010 1101
// 0481A4  = 0000 0100 1000 0001 1010 0100
// 002C0A  = 0000 0000 0010 1100 0000 1010

        localparam [23:0] INIT_0 = 24'h34002D;
        localparam [23:0] INIT_1 = 24'h0481A4;
        localparam [23:0] INIT_2 = 24'h002C0A;
        localparam [16:0] WAIT_COUNT = (SIM_SPDUP == "TRUE") ? 17'd10 : 17'd94000;

        wire [23:0] shreg_load[3:0];
        assign shreg_load[0] = INIT_0;
        assign shreg_load[1] = INIT_1;
        assign shreg_load[2] = INIT_2;
        assign shreg_load[3] = INIT_1;

        localparam [4:0] SHREG_MAX_BITS = 24;
        localparam [1:0] INIT_MAX = 2;

        reg sysclk_is_toggling = 0;
        reg rst_sysclk_toggling = 0;
        reg [1:0] sysclk_is_toggling_sync = {2{1'b0}};
                        
        reg init_seen = 0;
        reg init_seen_delayed = 0;
        reg skip_seen = 0;
        reg init_done = 0;
        
        // data is shifted out left.
        reg [23:0] shreg = {24{1'b0}};
        wire [17:0] shreg_plus_one = shreg[16:0] + 1;        
        reg [4:0] shreg_counter = {5{1'b0}};
        reg [1:0] init_counter = {2{1'b0}};
                
        // 16 clocks low (80 ns), 16 clocks high (80 ns)
        reg [4:0] ce_counter = {5{1'b0}};
        wire [5:0] ce_counter_plus_one = ce_counter + 1;
        reg ce = 0;
        localparam FSM_BITS = 3;
        localparam [FSM_BITS-1:0] IDLE = 0;
        localparam [FSM_BITS-1:0] LOAD = 1;   // assert 
        localparam [FSM_BITS-1:0] CLK_HIGH = 2;
        localparam [FSM_BITS-1:0] CLK_LOW = 3;
        localparam [FSM_BITS-1:0] LE = 4;
        localparam [FSM_BITS-1:0] WAIT = 5;
        localparam [FSM_BITS-1:0] FINISH = 6;
        reg [FSM_BITS-1:0] state = IDLE;

        // wait until 80 MHz input clock is toggling.
        always @(posedge sys_clk_i or rst_sysclk_toggling) 
            if (rst_sysclk_toggling) sysclk_is_toggling <= 0;
            else sysclk_is_toggling <= 1;

        always @(posedge clk200_i) begin        
            rst_sysclk_toggling <= (init_i && !init_seen);

            if (rst_sysclk_toggling) sysclk_is_toggling_sync <= {2{1'b0}};
            else sysclk_is_toggling_sync <= {sysclk_is_toggling_sync[0],sysclk_is_toggling};
        
            ce_counter <= ce_counter_plus_one;
            ce <= ce_counter_plus_one[5];
            
            if (rst200_i) init_seen <= 0;
            else if (init_i) init_seen <= 1;
            
            if (rst200_i) init_seen_delayed <= 0;
            else init_seen_delayed <= init_seen;
            
            if (rst200_i) skip_seen <= 0;
            else if (init_skip_i) skip_seen <= 1;

            if (rst200_i) state <= IDLE;
            else if (ce) begin
                case(state)
                    IDLE: if (init_seen_delayed && sysclk_is_toggling_sync[1]) state <= LOAD;
                          else if (skip_seen) state <= FINISH;
                    LOAD: state <= CLK_HIGH;
                    CLK_HIGH: state <= CLK_LOW;
                    CLK_LOW: if (shreg_counter == SHREG_MAX_BITS) state <= LE;
                             else state <= CLK_HIGH;
                    LE: if (init_counter == INIT_MAX) state <= FINISH;
                        else if (init_counter == 1) state <= WAIT;
                        else state <= LOAD;
                    WAIT: if (shreg[16:0] == WAIT_COUNT) state <= LOAD;
                    FINISH: state <= FINISH;
                endcase
            end
            // SCLK occurs at 
            if (ce) begin
                if (state == LE) shreg <= {24{1'b0}};
                else if (state == WAIT) shreg <= {shreg[23:17],shreg_plus_one[16:0]};
                else if (state == LOAD) shreg <= shreg_load[init_counter];
                else if (state == CLK_HIGH) shreg <= {shreg[22:0],1'b0};
            end
            
            if (ce) begin
                if (state == LOAD) shreg_counter <= {5{1'b0}};
                else if (state == CLK_HIGH) shreg_counter <= shreg_counter + 1;
            end
            
            if (ce) begin
                if (state == IDLE) init_counter <= {2{1'b0}};
                else if (state == LE) init_counter <= init_counter + 1;
            end
        end

        assign pll_sdin_o = shreg[23];
        assign pll_sclk_o = (state == CLK_HIGH);
        assign pll_load_o = (state == LE);
        assign init_done_o = (state == FINISH);

        specify
            specparam TLEsetupRE = 20.0, TLEholdFE = 10.0, TDATAsetup = 10.0, TDATAhold = 10.0, TCLKlow = 25, TCLKhigh = 25;
            $width(posedge pll_sclk_o, TCLKhigh);
            $width(negedge pll_sclk_o, TCLKlow);
            $setup(pll_load_o, posedge pll_sclk_o, TLEsetupRE);
            $hold(negedge pll_sclk_o, pll_load_o, TLEholdFE);
            $setup(pll_sdin_o, posedge pll_sclk_o, TDATAsetup);
            $hold(posedge pll_sclk_o, pll_sdin_o, TDATAhold);
        endspecify
        
 endmodule