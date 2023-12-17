`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2023 10:53:42 PM
// Design Name: 
// Module Name: photonCounter
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


module photonCounter(
input photonCounter_TTL,
input reset,
output counter_val
);

reg counter = 0;

always @ (posedge(photonCounter)) begin

    if (reset == 1'b1) begin
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
    end
    
end

endmodule
