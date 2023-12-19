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
output [3:0] counter_val
);

reg [3:0] counter = 0;

always @ (photonCounter_TTL,reset) begin
    if (reset == 1'b1) begin
        counter <= 0;
    end 
      
    else if(reset == 1'b0) begin
        if (photonCounter_TTL == 1'b1) begin 
            counter <= counter + 1;
        end
        
        else if (photonCounter_TTL == 1'b0) begin 
            counter <= counter;
        end
    end
    

    else begin
        counter <= 0;
    end
    
    
end

assign counter_val = counter;

endmodule
