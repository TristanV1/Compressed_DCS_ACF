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
input sample_in,
output sample_out,
output sample_and_clear
);

reg count = 0; 
reg CLK_1MHZ = 0;

always @ (posedge clk) begin
 
    if (count >= 12) begin
        count <= 0;
        CLK_1MHZ <= ~CLK_1MHZ;
    end    
    
    else if (count < 12) begin
        count <= count + 1;
    end
    
end

always @ (posedge CLK_1MHZ) begin
    sample_out <= sample_in;
    sample_and_clear <= 1'b1;
end 

always @ (CLK_1MHZ) begin
    sample_and_clear <= 1'b0;
end 

endmodule
