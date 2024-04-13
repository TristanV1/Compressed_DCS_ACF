`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 11:29:41 PM
// Design Name: 
// Module Name: Comm_Master
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Comm_Master
#(
    parameter DATA_WIDTH = 14    
)
(
    input clk_60MHz,
    input [0:(DATA_WIDTH*40)-1]data_out,
    input enable
);

FTDI_Top FTDI_Top
(
.enable(enable),
.comm_clk(clk_60MHz),
.txe,
.data_out,
.data,
.wr,
.rd,
.siwu,
.oe_n
);

endmodule
