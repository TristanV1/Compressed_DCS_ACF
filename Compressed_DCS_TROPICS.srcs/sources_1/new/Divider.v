`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 07:05:52 PM
// Design Name: 
// Module Name: Divider
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


module Divider
#(
parameter WIDTH = 11
)
(
input clk,
input enable,
input [WIDTH-1:0] dividend,
input [WIDTH-1:0] divisor,
output reg [WIDTH-1:0] quotient,
output reg [WIDTH-1:0] remainder,
output reg done,
output reg DBZ_flag
);

reg [WIDTH:0] acc = 0;
reg [WIDTH-1:0] r_quotient = 0;
reg [3*WIDTH:0]working_register = 0;
reg [$clog2(WIDTH)-1:0] count = 0;

parameter Amsb = 3*WIDTH;
parameter Alsb = 2*WIDTH;
parameter Dmsb = (2*WIDTH) - 1;
parameter Dlsb = WIDTH;
parameter Qmsb = WIDTH - 1;
parameter Qlsb = 0;

reg [2:0] current_state = 3'b000;
reg [2:0] next_state = 3'b000;

parameter IDLE = 3'b000, 
          DIVIDE_1 = 3'b001, 
          DIVIDE_2 = 3'b010,
          ERROR = 3'b011, 
          COMPLETE = 3'b100;

always @ (posedge(clk)) 
begin : Next_State_Logic
    current_state <= next_state;
end

always @ (current_state) begin
    case(current_state) 
        IDLE: 
            if(enable == 1'b1) begin
                 working_register[3*WIDTH:0] <= {acc,dividend,r_quotient};
                 next_state <= DIVIDE_1;
                 done <= 1'b0;
                 
              end
              else begin
                 acc <= 0;
                 r_quotient <= 0;
                 done <= 1'b1;
                 DBZ_flag <= 1'b0;
              end
        DIVIDE_1: 
            if (count <= WIDTH-1) begin
                count <= count + 1;
                if (working_register[Amsb:Alsb]>divisor) begin
                    if (divisor == 0) begin
                        next_state <= ERROR;
                    end
                    else begin
                        working_register[Qmsb:Qlsb] <= working_register[Qmsb:Qlsb] + 1; 
                        working_register[Amsb:Alsb] <= working_register[Amsb:Alsb] - divisor;
                        next_state <= DIVIDE_2;
                    end
                end
                else begin
                    working_register = working_register << 1;
                end     
            end
            
            else begin
                next_state <= COMPLETE;
            end
            
        DIVIDE_2:
            if (count <= WIDTH-1) begin
                working_register = working_register << 1;
                next_state <= DIVIDE_1;
            end
            else begin
                next_state <= COMPLETE;
            end
        ERROR:
        begin
            DBZ_flag <= 1'b1; 
            next_state <= COMPLETE;
        end
        COMPLETE:
        begin
            done <= 1'b1;
            count <= 1'b0;
            quotient <= working_register[Qmsb:Qlsb];
            remainder <= working_register[Amsb:Alsb];
        end    

    endcase
    
end

endmodule
