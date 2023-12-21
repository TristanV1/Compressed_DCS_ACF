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


module AutoCorrelator(
input enable,
input reset,
input  [3:0] n_i,
input  [3:0] n_delta,
output [7:0] n
);

reg [31:0] SumBuffer_Num;
reg [31:0] SumBuffer_Den;

initial begin
    SumBuffer_Num = 0;
    SumBuffer_Den = 0;
end

always @ (enable) begin
    if (reset == 1'b0) begin
        if (enable == 1'b1) begin
            SumBuffer_Num <= SumBuffer_Num + (n_i * n_delta);
            SumBuffer_Den <= SumBuffer_Den + (n_i * n_i);
        end
    
        else begin
            SumBuffer_Num <= SumBuffer_Num;
            SumBuffer_Den <= SumBuffer_Den;
        end
    end
    
    else begin
        SumBuffer_Num <= 0;
        SumBuffer_Den <= 0;
    end
    
end
    
endmodule

