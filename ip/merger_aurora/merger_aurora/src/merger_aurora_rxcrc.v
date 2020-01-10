///////////////////////////////////////////////////////////////////////////////
// Project:  Aurora 8B10B
// Version:  version 11.0
// Company:  Xilinx
//
//
// (c) Copyright 2012 - 2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.

/////////////////////////////////////////////////////////////////////////////////////
//
// Module merger_aurora_RX_CRC
// Generated by Xilinx Aurora 8B10B

`timescale 1ns / 10ps
`define DLY #1

//***********************************Module Declaration*******************************
module merger_aurora_RX_CRC (
  DATA_DS,
  REM_DS,
  SOF_N_DS,
  EOF_N_DS,
  SRC_RDY_N_DS,
  DST_RDY_N_US,
  CRC_PASS_FAIL_N,
  CRC_VALID,
  DATA_US,
  REM_US,
  SOF_N_US,
  EOF_N_US,
  SRC_RDY_N_US,
  DST_RDY_N_DS,
  RESET,
  CLK
);

 
parameter CRC_INIT  = 16'hFFFF;

output [15:0]     DATA_DS;
output            REM_DS;                   
  output      	SOF_N_DS;
  output      	EOF_N_DS;
  output      	SRC_RDY_N_DS;
  input       	DST_RDY_N_DS;
  output      	DST_RDY_N_US;
  output      	CRC_PASS_FAIL_N;
  output      	CRC_VALID;
input [15:0]     DATA_US;
input            REM_US;                   
  input       	SOF_N_US;
  input       	EOF_N_US;
  input       	SRC_RDY_N_US;
  input       	RESET;
  input       	CLK;
   
reg [15:0]     DATA_DS;
reg            REM_DS;                   
  reg       	SOF_N_DS;
  reg       	EOF_N_DS;
  reg       	SRC_RDY_N_DS;
  reg       	CRC_VALID;


    //__Signal declaration for one-hot encoded FSM__//
    reg   idle_r;
    reg   wait_r;
    reg   sof_ds_r;
    reg   data_r;
    reg   eof_ds_r;
    reg   sof_eof_r;
   
    wire  idle_c;
    wire  wait_c;
    wire  sof_ds_c;
    wire  data_c;
    wire  eof_ds_c;
    wire  sof_eof_c;
   
    //__internal register declaration__//
  	reg     	EOF_N_US_r;
    reg     	SOF_N_US_r;
reg            rem_in;
reg [15:0]     DATA_US_r;
reg [15:0]     DATA_US_2r;
    reg     	SRC_RDY_N_US_2r;
    reg     	ll_valid_r;
    reg [1:0] 	count;
reg [15:0]     received_CRC;
    reg		CRC_RESET_r = 1'b0;  

	//__internal wire declaration__//
    wire    	CRC_RESET;
    wire [15:0] CRC_DATA1;   //__data input to CRC block 1
    wire        CRC_DATAVALID1;      //__CRC datavalid for lane1
    wire        CRC_DATAWIDTH1;      //__CRC datawidth for lane1
    wire    	CRC_DATAVALID;
    wire    	ll_valid;
    wire    	DST_RDY_N_US_i;
    wire [15:0] CRC1;      // CRC calculated for lane1
    wire [15:0] tx_crc;
    wire [15:0] final_CRC;
   
   
    //____________Main code begins here________________//
   
    //__Initialization & state assignment for FSM__//
  always @(posedge CLK)
    if (RESET)
    begin
      idle_r    <=  `DLY 1'b1;
      wait_r    <=  `DLY 1'b0;
      sof_eof_r <=  `DLY 1'b0;
      sof_ds_r  <=  `DLY 1'b0;
      data_r    <=  `DLY 1'b0;
      eof_ds_r  <=  `DLY 1'b0;
    end
    else if (!DST_RDY_N_DS)
    begin
      idle_r    <=  `DLY idle_c;
      wait_r    <=  `DLY wait_c;
      sof_eof_r <=  `DLY sof_eof_c;
      sof_ds_r  <=  `DLY sof_ds_c;
      data_r    <=  `DLY data_c;
      eof_ds_r  <=  `DLY eof_ds_c;
    end
   
    //__Combinatorial logic for FSM__//
    assign  idle_c  = (idle_r || eof_ds_r || sof_eof_r) & (SOF_N_US || !ll_valid);
             
    assign  wait_c  = (idle_r || eof_ds_r || sof_eof_r) & (!SOF_N_US & ll_valid)
								 || (wait_r & !ll_valid);
   
    assign  sof_eof_c = wait_r & !EOF_N_US & ll_valid;
   
    assign  sof_ds_c  = wait_r & EOF_N_US & ll_valid;
   
    assign  data_c  = ((sof_ds_r || data_r) & (EOF_N_US | !ll_valid));
             
    assign  eof_ds_c  = ((data_r || sof_ds_r) & !EOF_N_US & ll_valid);
               
  //__Store REM value and build output REM__//
    always @(posedge CLK)
      if (!EOF_N_US & ll_valid)
        rem_in  <=  `DLY REM_US;
       
//__input signals registered__//
  always @(posedge CLK)
  if(ll_valid)
  begin
    EOF_N_US_r    <=  `DLY EOF_N_US;
    SOF_N_US_r    <=  `DLY SOF_N_US;
    DATA_US_r     <=  `DLY DATA_US;
  end
 
  always @(posedge CLK)
  if (!DST_RDY_N_DS || !EOF_N_US_r)
  begin
    DATA_US_2r      <=  `DLY DATA_US_r;
    SRC_RDY_N_US_2r <=  `DLY !CRC_DATAVALID;
  end

  assign CRC_RESET     = (!SOF_N_US_r & ll_valid_r) ? (ll_valid || !EOF_N_US_r) : (ll_valid && CRC_RESET_r);

  assign CRC_DATAVALID = ((!SOF_N_US && ll_valid) || (!EOF_N_US_r & ll_valid_r)) ? 1'b0 :
                         (ll_valid || CRC_RESET);

    assign CRC_DATAWIDTH1 = (!EOF_N_US & ll_valid) ? REM_US : 1'b1;
    assign CRC_DATAVALID1 = CRC_DATAVALID;
    assign CRC_DATA1      = DATA_US_r[15:0];
      
    //__CRC block instantiation for lane1__//
  merger_aurora_CRC_TOP #(
        .CRC_INIT(CRC_INIT)
     ) rx_crc_gen1_i (
            .CRCRESET(CRC_RESET),
            .CRCCLK(CLK),
            //.CRCDATAWIDTH(CRC_DATAWIDTH1),
            //.CRCDATAVALID(CRC_DATAVALID1),
            //.CRCIN(CRC_DATA1),
            //.CRCOUT(CRC1)
            .CRCDATAWIDTH(CRC_DATAWIDTH1),
            .CRCDATAVALID(CRC_DATAVALID1),
            .CRCIN(CRC_DATA1),
            .CRCOUT(CRC1)
    );

 

assign final_CRC = {
                      CRC1 };

   always @(posedge CLK)
      if (!SOF_N_US_r & EOF_N_US_r & ll_valid_r)
         CRC_RESET_r <= `DLY !ll_valid;
      else if (ll_valid & CRC_RESET_r)
         CRC_RESET_r <= `DLY 1'b0;

  assign DST_RDY_N_US = DST_RDY_N_US_i;
  assign DST_RDY_N_US_i = DST_RDY_N_DS || |count;
 
  //__deassert dst_rdy_n_us for 3 cycles after eof_n_us reception__//
     
  always @(posedge CLK)
    if (RESET)
      count <=  `DLY 2'b00;
    else if (!EOF_N_US & ll_valid)
      count <=  `DLY 2'b01;
    else if (|count & !DST_RDY_N_DS)
      count <=  `DLY count >> 1;
     
  assign ll_valid = !SRC_RDY_N_US && !DST_RDY_N_US_i;
  always @(posedge CLK)
    ll_valid_r  <=  `DLY ll_valid;
   
  //__Build DS output__//
  always @(posedge CLK)
    if (RESET)
    begin
      SOF_N_DS  <=  `DLY 1'b1;
      EOF_N_DS  <=  `DLY 1'b1;
      SRC_RDY_N_DS<=  `DLY 1'b1;
      REM_DS    <=  `DLY 1'd1;
      DATA_DS   <=  `DLY 16'd0;
    end
    else if (!DST_RDY_N_DS)
    begin
      SOF_N_DS  <=  `DLY !(sof_eof_r || sof_ds_r);
      EOF_N_DS  <=  `DLY !(sof_eof_r || eof_ds_r);
      SRC_RDY_N_DS<= `DLY  SRC_RDY_N_US_2r;
      REM_DS    <=  `DLY (sof_eof_r || eof_ds_r) ? rem_in : 1'd1;
      DATA_DS   <=  `DLY DATA_US_2r;
    end
   
  //__Extract CRC from input data__//
   
    //__CRC extraction for all other cases__//     
  assign tx_crc =
                    (REM_US == 1'd0) ? {DATA_US_r[7:0],DATA_US[15:8]} : DATA_US[15:0]; 

      //__store the received CRC__//   
  always @(posedge CLK)
    if (!EOF_N_US & ll_valid)
      received_CRC  <=  `DLY tx_crc;
 
      //__compare the received CRC with the CRC calculated__//
  assign CRC_PASS_FAIL_N  = (received_CRC == final_CRC);
 
      //__CRC_PASS_FAIL_N to be considered only when CRC_VALID is asserted__//
  always @(posedge CLK)
    if (RESET)
      CRC_VALID <=  `DLY 1'b0;
    else
      CRC_VALID <=  `DLY (sof_eof_r || eof_ds_r);
     
endmodule
