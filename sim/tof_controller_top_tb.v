module tof_controller_top_tb;

    // make the simulation run fast
    parameter SIM_SPDUP = "TRUE";
    // skip clock/ADC init.
    parameter SKIP_INIT = "TRUE";

    wire clk;
    tb_rclk #(.PERIOD(5.0)) u_clk(.clk(clk));

    wire [1:0] sda_out;
    wire [1:0] sda_t;
    wire [1:0] sda_in;
    wire [1:0] sda_io;
    wire [1:0] scl_out;
    wire [1:0] scl_t;
    wire [1:0] scl_in;
    wire [1:0] scl_io;
    generate
        genvar i;
        for (i=0;i<2;i=i+1) begin : TRISTATES
            IOBUF u_sda(.I(sda_out[i]),.T(sda_t[i]),.O(sda_in[i]),.IO(sda_io[i]));
            IOBUF u_scl(.I(scl_out[i]),.T(scl_t[i]),.O(scl_in[i]),.IO(scl_io[i]));
            pullup(sda_io[i]);
            pullup(scl_io[i]);
        end
    endgenerate
    
    reg rst = 1;
    wire init;
    wire init_skip;
    reg init_done = 0;
    wire ready;
    reg update = 0;
    wire updating;
    wire update_complete;
    // quick update, 256 loops
    // this should be 664 in normal operation
    wire [15:0] mon_rate = 1;
    
    wire [6:0] cfg_addr;
    reg [15:0] cfg_data = {16{1'b0}};
    wire [6:0] mon_addr;
    wire [15:0] mon_data;
    wire mon_wr;
    // We speed up the simulation because holy crap it takes forever otherwise.
    // It's like, 0.5 seconds just to do ADC initialization.
    tof_controller_top_v2 #(.SIM_SPDUP("TRUE"),.DEBUG("FALSE"),.SIMULATION("TRUE")) uut(.clk_i(clk),.rst_i(rst),.init_o(init),.init_skip_o(init_skip),.init_done_i(init_done),.ready_o(ready),
                                .update_i(update),.updating_o(updating),.update_complete_o(update_complete),
                                .mon_rate_i(mon_rate),
                                .cfg_addr_o(cfg_addr),
                                .cfg_dat_i(cfg_data),
                                .mon_addr_o(mon_addr),
                                .mon_dat_o(mon_data),
                                .mon_wr_o(mon_wr),
                                
                                .scl_i(scl_in),
                                .scl_o(scl_out),
                                .scl_t(scl_t),
                                .sda_i(sda_in),
                                .sda_o(sda_out),
                                .sda_t(sda_t));

    wire [7:0] gpio[3:0];
    wire [31:0] switch[1:0];
    reg [7:0] ramp0 = 8'd0;
    reg [7:0] ramp1 = 8'd128;
    reg [7:0] ramp2 = 8'd64;
    reg [7:0] ramp3 = 8'd192;
    reg [7:0] ramp4 = 8'd32;
        
    wire [7:0] adc0_gpio = ramp0;
    wire [7:0] adc1_gpio = ramp1;
    wire [7:0] temp0_gpio = ramp2;
    wire [7:0] temp1_gpio = ramp3;
    wire [7:0] pmon_gpio = ramp4;

    reg bus0_busy = 0;
    reg bus1_busy = 0;            
    wire [1:0] start;
    wire [1:0] stop;            
    // perform timing checks on I2C. Don't do this if SIM_SPDUP set TRUE above
    // this is only ever done by 1 slave model on each bus
    parameter TIMING = (SIM_SPDUP == "TRUE") ? "FALSE" : "TRUE";    
    parameter [7:0] GP1_DEFAULT = (SKIP_INIT == "TRUE") ? 8'hFC : 8'hFF;
    // one model has full debugging and timing checks (if enabled). Everyone else would just be a duplicate.
    i2c_slave_model #(.I2C_ADR(7'h20),.NAME("gpio0_0"),.BEHAVIOR("GPIO"),.TIMING(TIMING),.DEBUG("FULL")) gpio0(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(gpio[0]),.start(start[0]),.stop(stop[0]));
    i2c_slave_model #(.I2C_ADR(7'h21),.NAME("gpio1_0"),.BEHAVIOR("GPIO"),.TIMING("FALSE"),.DEFAULT(GP1_DEFAULT),.DEBUG("TRANSACTION")) gpio1(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(gpio[1]));
    i2c_slave_model #(.I2C_ADR(7'h20),.NAME("gpio0_1"),.BEHAVIOR("GPIO"),.TIMING(TIMING),.DEBUG("FULL")) gpio2(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(gpio[2]),.start(start[1]),.stop(stop[1]));
    i2c_slave_model #(.I2C_ADR(7'h21),.NAME("gpio1_1"),.BEHAVIOR("GPIO"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) gpio3(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(gpio[3]));

    i2c_slave_model #(.I2C_ADR(7'h4c),.NAME("sw0_0"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw0(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(switch[0][7:0]));
    i2c_slave_model #(.I2C_ADR(7'h4d),.NAME("sw1_0"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw1(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(switch[0][15:8]));
    i2c_slave_model #(.I2C_ADR(7'h4e),.NAME("sw2_0"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw2(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(switch[0][23:16]));
    i2c_slave_model #(.I2C_ADR(7'h4f),.NAME("sw3_0"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw3(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(switch[0][31:24]));

    i2c_slave_model #(.I2C_ADR(7'h4c),.NAME("sw0_1"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw4(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(switch[1][7:0]));
    i2c_slave_model #(.I2C_ADR(7'h4d),.NAME("sw1_1"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw5(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(switch[1][15:8]));
    i2c_slave_model #(.I2C_ADR(7'h4e),.NAME("sw2_1"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw6(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(switch[1][23:16]));
    i2c_slave_model #(.I2C_ADR(7'h4f),.NAME("sw3_1"),.BEHAVIOR("SWITCH"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) sw7(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(switch[1][31:24]));

    // seriously don't give a crap about what the ADCs do
    i2c_slave_model #(.I2C_ADR(7'h14),.NAME("adc_0"),.BEHAVIOR("CONSTANT"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) adc0(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(adc0_gpio));
    i2c_slave_model #(.I2C_ADR(7'h14),.NAME("adc_1"),.BEHAVIOR("CONSTANT"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) adc1(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(adc1_gpio));

    // the temperature sensor and power monitor just act like an ADC
    // 1001 000
    i2c_slave_model #(.I2C_ADR(7'h48),.NAME("temp_0"),.BEHAVIOR("CONSTANT"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) temp0(.scl(scl_io[0]),.sda(sda_io[0]),.gpio(temp0_gpio));
    i2c_slave_model #(.I2C_ADR(7'h48),.NAME("temp_1"),.BEHAVIOR("CONSTANT"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) temp1(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(temp1_gpio));
    i2c_slave_model #(.I2C_ADR(7'h18),.NAME("pmon_1"),.BEHAVIOR("CONSTANT"),.TIMING("FALSE"),.DEBUG("TRANSACTION")) pmon0(.scl(scl_io[1]),.sda(sda_io[1]),.gpio(pmon_gpio));
    function [7:0] idx;
        input [31:0] bitmask;
        integer i;
        integer found_one;
        begin
            idx = 0;
            found_one = 0;
            for (i=0;i<32;i=i+1) begin
                if (bitmask[i]) begin
                    if (found_one == 0) begin
                        idx = i;
                        found_one = 1;
                    end
                end
            end
        end
    endfunction
    function is_invalid;
        input [31:0] bitmask;
        integer i;
        integer found_one;
        begin
            is_invalid = 0;
            found_one = 0;
            for (i=0;i<31;i=i+1) begin
                if (bitmask[i]) begin
                    if (found_one) begin
                        is_invalid = 1;
                    end else begin
                        found_one = 1;
                    end
                end
            end
        end
    endfunction
    function [47:0] mon_string;
        input [31:0] switch;
        input [4:0] channel;
        input [7:0] label;
        input xsel;
        begin
            if (is_invalid(switch)) mon_string = "XXXXXX";
            else if (switch == 0)   mon_string = "   HIZ";
            else begin
                if (channel[2:0] == 1) begin
                    mon_string[5*8 +: 8] = "V";
                    mon_string[4*8 +: 8] = "C";
                    mon_string[3*8 +: 8] = "O";
                    mon_string[2*8 +: 8] = "M";
                    mon_string[1*8 +: 8] = "P";
                    mon_string[0*8 +: 8] = label;
                end else begin
                    if (channel[2:0] < 4) mon_string[5*8 +: 8] = "R";
                    else mon_string[5*8 +: 8] = "I";
                    mon_string[4*8 +: 8] = "M";
                    mon_string[3*8 +: 8] = "O";
                    mon_string[2*8 +: 8] = "N";
                    mon_string[1*8 +: 8] = label;
                    if (channel[2:0] == 0) begin
                        if (xsel) mon_string[0*8 +:8] = "3";
                        else mon_string[0*8 +: 8] = "2";
                    end else if (channel[2:0] == 2) begin
                        mon_string[0*8 +: 8] = "1";
                    end else if (channel[2:0] == 3) begin
                        mon_string[0*8 +: 8] = "0";
                    end else if (channel[2:0] == 4) begin
                        mon_string[0*8 +: 8] = "3";
                    end else if (channel[2:0] == 5) begin
                        mon_string[0*8 +: 8] = "2";
                    end else if (channel[2:0] == 6) begin
                        mon_string[0*8 +: 8] = "1";
                    end else if (channel[2:0] == 7) begin
                        mon_string[0*8 +: 8] = "0";
                    end
                end
            end
        end        
    endfunction

    wire [4:0] ch0 = idx(switch[0]);
    wire [7:0] label0 = "A" + ch0[4:3];
    wire [4:0] ch1 = idx(switch[1]);
    wire [7:0] label1 = "E" + ch1[4:3];
    wire [6*8-1:0] bus0_mon = mon_string(switch[0],ch0,label0,gpio[0][4]);
    wire [6*8-1:0] bus1_mon = mon_string(switch[1],ch1,label1,gpio[2][4]);

    always @(posedge start[1] or posedge stop[1]) begin
        if (start[1]) bus1_busy <= 1;
        else if (stop[1]) bus1_busy <= 0;
    end
    always @(posedge start[0] or posedge stop[0]) begin
        if (start[0]) bus0_busy <= 1;
        else if (stop[0]) bus0_busy <= 0;
    end

    always @(posedge clk) begin
        if (init_skip) begin
            #1 init_done = 1;
        end else if (init) begin
            #500;
            @(posedge clk); #1 init_done = 1;
        end        
    end

    always @(posedge clk) #1 ramp0 <= ramp0 + 1;
    always @(posedge clk) #1 ramp1 <= ramp1 + 1;
    always @(posedge clk) #1 ramp2 <= ramp2 + 1;
    always @(posedge clk) #1 ramp3 <= ramp3 + 1;
    always @(posedge clk) #1 ramp4 <= ramp4 + 1;

    initial begin
        #100;
        @(posedge clk); #1 rst = 0; @(posedge clk); #1 rst = 0;
    end                                        

endmodule