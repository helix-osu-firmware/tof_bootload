`timescale 1ns / 1ps
// this is a simple HELIX control packet parser.
// it yoinks out a 16-bit address space from the packet
// and converts it to a simple interface:
// reg_en_o goes 1 for every transaction
// reg_wr_o goes 1 with reg_en_o for a write
// reg_update_o goes 1 (with reg_wr_o) with an update
// the transaction completes either immediately (for a write)
// or when reg_valid_i is 1 (for a read).

// The 16-bit address is formed by the 12-bit base address
// plus chip[2:0] and brd[0]. brd[2:1] are left for... whatever
module helix_control_decode(
        input aclk,
        input aresetn,
        input [63:0] s_axis_tdata,
        input        s_axis_tvalid,
        output       s_axis_tready,
        input [7:0]  s_axis_tkeep,
        input [3:0]  s_axis_tuser,
        input        s_axis_tlast,
        
        output        reg_en_o,
        output [15:0] reg_dat_o,
        output [15:0] reg_adr_o,
        output        reg_wr_o,
        input  [15:0] reg_dat_i,
        input         reg_valid_i,
        output        reg_update_o,
        
        output [63:0] m_axis_tdata,
        output        m_axis_tvalid,
        input         m_axis_tready,
        output        m_axis_tlast        
    );

    // Natively there's 22 bits of address space.
    // 12 is flat out called 'address'.
    // The top 4 are merger lanes, for routing, so we can't screw with those.
    // The remaining 6 in RICH speak are brd[2:0]/chip[2:0]. We steal 4 bits to make a 16-bit address.
    // which leaves 2 bits to just flat assign.
    parameter [1:0] BASE_ADDRESS = 2'b00;
    
    // inbound guys
    localparam [15:0] CONTROL_HEADER = 16'hC751;
    // outbound guys
    localparam [15:0] STATUS_HEADER = 16'h57A7;
    localparam [3:0] SOF = 4'hF;
    localparam [3:0] EOF = 4'h8;
    localparam [1:0] TYPE_NOP = 2'b00;
    localparam [1:0] TYPE_WRITE = 2'b01;
    localparam [1:0] TYPE_READ = 2'b10;
    localparam [1:0] TYPE_UPDATE = 2'b11;
    
    localparam FSM_BITS=3;
    localparam [FSM_BITS-1:0] IDLE = 0;
    localparam [FSM_BITS-1:0] CHECK_WAIT = 1;
    localparam [FSM_BITS-1:0] CHECK = 2;
    localparam [FSM_BITS-1:0] ISSUE = 3;
    localparam [FSM_BITS-1:0] WAIT = 4;
    localparam [FSM_BITS-1:0] CAPTURE = 5;
    localparam [FSM_BITS-1:0] RESPOND = 6;
    localparam [FSM_BITS-1:0] IGNORE = 7;
    reg [FSM_BITS-1:0] state = IDLE;
    
//    ila_0 u_ila(.clk(aclk),.probe0(s_axis_tdata),.probe1(s_axis_tvalid),.probe2(s_axis_tkeep),.probe3(s_axis_tuser),.probe4(s_axis_tlast),
//                        .probe5(reg_en_o),.probe6(reg_dat_o),.probe7(reg_adr_o),.probe8(reg_wr_o),.probe9(reg_dat_i),.probe10(reg_update_o),
//                        .probe11(state));
    
    reg [63:0] captured_data = {64{1'b0}};
    reg [7:0] captured_keep = {8{1'b0}};
    reg [3:0] captured_tuser = {4{1'b0}};
    reg captured_tlast = 0;
    
    reg match_header = 0;
    reg match_keep = 0;
    reg match_tuser = 0;
    reg match_address = 0;
    reg match_sof_eof = 0;
    
    reg [3:0] lane = {4{1'b0}};
    reg [15:0] address = {16{1'b0}};
    reg [1:0] type = {2{1'b0}};
    reg [15:0] data_out = {16{1'b0}};
    reg [15:0] data_in = {16{1'b0}};

    reg reg_en = 0;
    reg reg_wr = 0;
    reg reg_update = 0;

    reg axis_tvalid = 0;
    
    // CONTROL PACKET FORMAT
    // [15:0] = 0xC751
    // [31:16] = control word 1.
    // [47:32] = control word 2
    // [63:48] = control word 3
    wire [15:0] header = captured_data[0 +: 16];
    // control_word_1: [15:12] = SOF. [11:10] = type. [9:0] = address[21:12] ( lane[3:0]/brd[2:0]/chip[2:0] )
    wire [15:0] control_word_1 = captured_data[16 +: 16];
    // control_word_2: [15:12] = data[15:12], [11:0] = address[11:0]
    wire [15:0] control_word_2 = captured_data[32 +: 16];
    // control_word_3: [15:12] = EOF. [11:0] = data[11:0]
    wire [15:0] control_word_3 = captured_data[48 +: 16];

    // the full 22-bit captured address. The top 4 bits (lane) we simply echo back, they're for
    // routing. The next 2 bits are... something, and then the bottom 16 are for our register space
    wire [21:0] captured_address = {control_word_1[9:0],control_word_2[15:4]};
    wire [15:0] captured_cdata = {control_word_2[3:0],control_word_3[15:4]};
    wire [3:0] captured_sof = control_word_1[15:12];
    wire [3:0] captured_eof = control_word_3[3:0];
    wire [1:0] captured_type = control_word_1[11:10];
                
    always @(posedge aclk) begin
        if (state == IDLE && s_axis_tvalid) begin
            captured_data <= s_axis_tdata;
            captured_keep <= s_axis_tkeep;
            captured_tuser <= s_axis_tuser;
            captured_tlast <= s_axis_tlast;
        end
        // header shows up first
        match_header <= (header == CONTROL_HEADER);        
        match_keep <= (captured_keep == 8'hFF);
        match_tuser <= (captured_tuser == 4'h0) && captured_tlast;
        // our address shows up on 
        match_address <= (captured_address[16 +: 2] == BASE_ADDRESS);
        match_sof_eof <= (captured_sof  == SOF) && (captured_eof == EOF);
    
        if (state == CHECK) begin
            address <= captured_address[15:0];
            type <= captured_type;
            data_in <= captured_cdata;
            lane <= captured_address[18 +: 4];
        end
    
        if (!aresetn) reg_en <= 0;
        else if (state == ISSUE) begin
            reg_en <= (type != TYPE_NOP);
        end else if (state == IDLE) reg_en <= 0;

        if (state == ISSUE) begin
            reg_wr <= (type != TYPE_READ);
            reg_update <= (type == TYPE_UPDATE);
        end else begin
            reg_wr <= 0;
            reg_update <= 0;
        end

        if (state == CAPTURE) begin
            data_out <= reg_dat_i;
        end

        if (!aresetn) axis_tvalid <= 0;        
        else if (state == CAPTURE) axis_tvalid <= 1;
        else if (m_axis_tready) axis_tvalid <= 0;
        
        if (!aresetn) state <= IDLE;
        else begin
            case (state)
                IDLE: if (s_axis_tvalid) state <= CHECK_WAIT;
                CHECK_WAIT: state <= CHECK;
                CHECK: if (match_header && match_keep && match_tuser && match_address && match_sof_eof) state <= ISSUE;
                       else state <= IGNORE;
                ISSUE: state <= WAIT;
                // reg_en is valid here
                WAIT: if (type == TYPE_READ) state <= CAPTURE; else state <= IDLE;
                CAPTURE: if (reg_valid_i) state <= RESPOND;
                RESPOND: if (m_axis_tready) state <= IDLE;
                IGNORE: state <= IDLE;
            endcase
        end
    end
    
    // CHECK THIS CHECK THIS CHECK THIS
    wire [15:0] tx_header = STATUS_HEADER;
    wire [15:0] tx_word_1 = { SOF, TYPE_READ, lane, BASE_ADDRESS, address[15:12] };
    wire [15:0] tx_word_2 = { address[11:0], data_out[15:12] };
    wire [15:0] tx_word_3 = { data_out[11:0], EOF };
    assign m_axis_tdata = { tx_word_3, tx_word_2, tx_word_1, tx_header };
    assign m_axis_tvalid = axis_tvalid;
    assign m_axis_tlast = 1'b1;
    
    assign reg_en_o = reg_en;
    assign reg_dat_o = data_in;
    assign reg_adr_o = address;
    assign reg_wr_o = reg_wr;
    assign reg_update_o = reg_update;
    
    assign s_axis_tready = (state == IDLE); 
    
endmodule
