`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 08:58:03 PM
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input photonCounter,
    output n
);

wire t_int_out;

counterBuffer 
   #(
    .ts(0.000001),
    .t_int(0.01) //1 ms integration time
    ) 
channel_1
    (
    .fs_clk(clk), //
    .enable(t_int_out), //The enable line will be connected to the t_int timer
    .photonCounter(photonCounter), //The TTL pulse directly from the photonCounter
    .n(n)
);


integralTimer 
   #(
    .clk_speed(50_000_000),
    .t_int(0.01)
    )
integralTimer1
    (
    .clk(clk),
    .t_int_out(t_int_out)
);

endmodule
