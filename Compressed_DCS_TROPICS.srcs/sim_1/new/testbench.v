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

reg clk;
reg photonCounter;
wire n;

//main(
//.clk(clk),
//.photonCounter(photonCounter),
//.n(n)
//);

wire t_int_out;

//integralTimer
//uut(
//.clk(clk),
//.t_int_out(t_int_out)
//);

main uut(
    .clk(clk),
    .photonCounter(photonCounter),
    .n(n)
    );

integer i;
initial begin
    clk = 0;
    for (i = 0; i < 500; i = i + 1) begin
        photonCounter = 0;
        if (i % 5 == 0) begin
            clk = ~clk;
        end
        
        if (i % 2 == 0) begin
            photonCounter = 1;
        end
        #10;
    end

end
endmodule

