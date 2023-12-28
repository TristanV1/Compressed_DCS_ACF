`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2023 12:25:53 AM
// Design Name: 
// Module Name: AutoCorrelator
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


module AutoCorrelator
#(
parameter WIDTH = 16,
parameter PRECISION = 2,
parameter fs = 1_000_000, //1 MHz Sampling Frequency
parameter delayTime_T = 0.000105, //105 us delay time
parameter t_int = 0.040 //40 ms integration time (Typical for in vivo experiment)
)
(
input clk, //System clock
input enable,
input reset,
input  [3:0] n_i,
input  [3:0] n_delta,
output reg [WIDTH-1:0] ACF_result
);

reg [WIDTH-1:0] SumBuffer_Num;
reg [WIDTH-1:0] SumBuffer_Den;

initial begin
    SumBuffer_Num = 0;
    SumBuffer_Den = 0;
end

always @ (enable) begin
    if (reset == 1'b0 & enable == 1'b1) begin
       SumBuffer_Num <= SumBuffer_Num + (n_i * n_delta); //Multiply-Accumulate operation
       SumBuffer_Den <= SumBuffer_Den + (n_i * n_i); //Multiply-Accumulate operation
    end  
end

reg [WIDTH-1:0] dividend;
reg [WIDTH-1:0] divisor;

initial begin
    dividend = 0;
    divisor = 0;
end

always @ (posedge(reset)) begin
    dividend <= SumBuffer_Num;
    divisor  <= SumBuffer_Den;
    SumBuffer_Num <= 0;
    SumBuffer_Den <= 0;
end


parameter n_int = $rtoi($ceil(fs * t_int));
parameter delta_n = $rtoi($ceil(fs * delayTime_T));
parameter n_avg_num = n_int - delta_n;

parameter prescaler_val = $rtoi($ceil(10**PRECISION));
parameter precompute_val = $ceil($itor(n_avg_num)/$itor(n_int) * prescaler_val);

reg [WIDTH-1:0] precompute;
reg [WIDTH-1:0] prescaler;

initial begin
    precompute = precompute_val;
    prescaler = prescaler_val;
end

wire [WIDTH-1:0] quotient;
wire [WIDTH-1:0] remainder;
wire done;
wire busy;
wire DBZ_flag; //Ignore??? How should we handle DBZ errors for this function.



Divider 
#(
.WIDTH(WIDTH)
)
Divider
(
.clk(clk),
.enable(reset), //Once the MAC is done, we can compute division.
.dividend(dividend * prescaler), //Scale divisor to obtain user-defined precision.
.divisor(divisor),
.quotient(quotient),
.remainder(remainder),
.done(done),
.busy(busy),
.DBZ_flag(DBZ_flag)
);

always @ (done) begin
    ACF_result <= quotient * precompute;
end
    
endmodule

