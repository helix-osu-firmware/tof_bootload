///////////////////////////////////////////////////////////////////////////////
// (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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
//
//
///////////////////////////////////////////////////////////////////////////////
//
//  RX_LL_NFC
//
//
//  Description: the RX_LL_NFC module detects, decodes and executes NFC messages
//               from the channel partner.  When a message is recieved, the module
//               signals the TX_LL module that idles are required until the number
//               of idles the TX_LL module sends are enough to fulfil the request.
//
//               This module supports 1 2-byte lane designs.
//

`timescale 1 ns / 1 ps

module merger_aurora_RX_LL_NFC
(
    // Aurora Lane Interface
    RX_SNF,
    RX_FC_NB,


    // TX_LL Interface
    DECREMENT_NFC,

    TX_WAIT,

    // Global Logic Interface
    CHANNEL_UP,


    // USER Interface
    USER_CLK

 );

`define DLY #1


//***********************************Port Declarations*******************************

    // Aurora Lane Interface
    input       RX_SNF;
    input   [0:3]   RX_FC_NB;


    // TX_LL Interface
    input       DECREMENT_NFC;

    output      TX_WAIT;


    // Global Logic Interface
    input       CHANNEL_UP;


    // USER Interface
    input       USER_CLK;


//**************************Internal Register Declarations****************************


    reg             load_nfc_r;
    reg     [0:3]   fcnb_r;
    reg     [0:8]   nfc_counter_r;
    reg             xoff_r;
    reg     [0:8]   fcnb_decode_c;


//*********************************Main Body of Code**********************************





    //_________________Stage 1: Detect the most recent NFC message____________________


    // Generate the load NFC signal if an NFC signal is detected.
    always @(posedge USER_CLK)
        load_nfc_r          <=  `DLY    RX_SNF;


    // Register the FC_NB signal.
    always @(posedge USER_CLK)
        fcnb_r  <=  `DLY    RX_FC_NB;




    //________________ Stage 2: Use the FCNB code to set the counter_______________


    // We use a counter to keep track of the number of dead cycles we must produce to
    // satisfy the NFC request from the Channel Partner.  Note we *increment* nfc_counter
    // when decrement NFC is asserted.  This is because the nfc counter uses the difference
    // between the max value and the current value to determine how many cycles to demand
    // a pause.  This allows us to use the carry chain more effectively to save LUTS, and
    // gives us a registered output from the counter.
    always @(posedge USER_CLK)
        if (!CHANNEL_UP)         nfc_counter_r   <=  `DLY    9'h100;
        else if (load_nfc_r)     nfc_counter_r   <=  `DLY    fcnb_decode_c;
        else if (!nfc_counter_r[0] && DECREMENT_NFC && !xoff_r)
                                nfc_counter_r   <=  `DLY    nfc_counter_r + 9'h001;



    // We load the counter with a decoded version of the FCNB code.  The decode values are
    // chosen such that the counter will assert TX_WAIT for the number of cycles required
    // by the FCNB code.
    always @(fcnb_r)
        case(fcnb_r)
            4'h0    :   fcnb_decode_c   =   9'h100; // XON
            4'h1    :   fcnb_decode_c   =   9'h0FE; // 2
            4'h2    :   fcnb_decode_c   =   9'h0FC; // 4
            4'h3    :   fcnb_decode_c   =   9'h0F8; // 8
            4'h4    :   fcnb_decode_c   =   9'h0F0; // 16
            4'h5    :   fcnb_decode_c   =   9'h0E0; // 32
            4'h6    :   fcnb_decode_c   =   9'h0C0; // 64
            4'h7    :   fcnb_decode_c   =   9'h080; // 128
            4'h8    :   fcnb_decode_c   =   9'h000; // 256
            4'hF    :   fcnb_decode_c   =   9'h000; // 8
            default :   fcnb_decode_c   =   9'h100; // 8
        endcase


    // The XOFF signal forces an indefinite wait.  We decode FCNB to determine whether
    // XOFF should be asserted.
    always @(posedge USER_CLK)
        if (!CHANNEL_UP)             xoff_r  <=  `DLY    1'b0;
        else if (load_nfc_r)
        begin
            if (fcnb_r == 4'hF)      xoff_r  <=  `DLY    1'b1;
            else                     xoff_r  <=  `DLY    1'b0;
        end


    // The TXWAIT signal comes from the MSBit of the counter.  We wait whenever the counter
    // is not at max value.
    assign TX_WAIT  =   !nfc_counter_r[0];




endmodule















