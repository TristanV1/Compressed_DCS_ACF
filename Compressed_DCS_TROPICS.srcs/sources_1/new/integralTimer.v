`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 10:50:12 PM
// Design Name: 
// Module Name: integralTimer
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


module integralTimer 
#(
parameter clk_speed = 12_000_000, //12MHz clock speed
parameter t_int = 0.000040 //40 us integration time (Typical for in vivo experiment)
)
(
input clk,
output reg t_int_out
);

parameter t_int_counter_max = $rtoi($ceil(t_int * clk_speed));
parameter count_max = $rtoi($ceil($clog2(t_int_counter_max)));

reg [count_max-1:0] count = 0;

//reg r_t_int_out = 1'b1;
//assign t_int_out = r_t_int_out;
initial begin 
    t_int_out <= 1'b0;
end

always @ (posedge clk) begin
    if (count >= t_int_counter_max-1) begin
        t_int_out <= !t_int_out;
        count <= 0; 
    end
    else begin
        count <= count + 1; 
    end
end


endmodule
