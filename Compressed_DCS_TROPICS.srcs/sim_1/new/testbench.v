`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 10:41:14 PM
// Design Name: 
// Module Name: testbench
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


module testbench();

wire clk;
wire photonCounter;
reg n;

//main(
//.clk(clk),
//.photonCounter(photonCounter),
//.n(n)
//);

wire t_int_out;
integralTimer
#(
.clk_speed(2),
.t_int(1)
)
uut(
.clk(clk),
.t_int_out(t_int_out)
);

integer i;
initial begin
    for (i = 0; i < 25; i = i + 1) begin
        clk = ~clk;
    end

end

endmodule
