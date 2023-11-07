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
parameter clk_speed = 50_000_000,
parameter clk_period = 1/clk_speed,
parameter t_int = 0.01,
parameter t_int_counter_max = $ceil(t_int * clk_speed)
)
(
input clk,
output t_int_out
);

parameter count_max = $clog2($ceil(t_int_counter_max));
reg [count_max:0] count;
reg r_t_int_out;

always @ (posedge(clk)) begin
    if (count >= t_int_counter_max) begin
        r_t_int_out = !r_t_int_out;
        count <= 0; 
    end
    else begin
    count <= count + 1; 
    end
end

endmodule
