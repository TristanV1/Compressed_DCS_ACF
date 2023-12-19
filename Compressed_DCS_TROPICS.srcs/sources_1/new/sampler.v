`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2023 08:47:43 PM
// Design Name: 
// Module Name: sampler
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


module sampler
#(
parameter default_fclk = 12_000_000,
parameter fs = 1_000_000 //1 MHz Sampling Frequency
) 
(
input clk,
input [3:0] sample_in,
output reg [3:0] sample_out,
output reg sample_and_clear
);

reg [3:0]count = 0; 
reg CLK_1MHZ = 0;

always @ (posedge clk) begin //Clock divider to provide 1MHz sampling frequency.
 
    if (count >= 12) begin
        count <= 4'b0;
        CLK_1MHZ <= ~CLK_1MHZ;
    end    
    
    else if (count < 12) begin
        count = count + 1'b1;
    end
    
end

//reg w_sample_out;
//reg w_sample_and_clear;

always @ (posedge CLK_1MHZ) begin
    if (CLK_1MHZ == 1'b1) begin
        sample_out <= sample_in;
        sample_and_clear <= 1'b1;
    end
end 

//assign sample_out = w_sample_out;
//assign sample_and_clear = w_sample_and_clear;

always @ (negedge CLK_1MHZ) begin
    sample_out <= 4'b0;
    sample_and_clear <= 1'b0;
end 

endmodule
