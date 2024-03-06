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
input reset,
output reg [WIDTH-1:0] quotient,
output reg [WIDTH-1:0] remainder,
output reg done,
output reg busy,
output reg DBZ_flag
);

initial begin
    done <= 0;
    busy <= 0;
    DBZ_flag <= 0;
    quotient <= 0;
    remainder <=0;
end

reg [WIDTH:0] acc;
reg [WIDTH-1:0] r_quotient;
reg [3*WIDTH:0] working_register;
reg [$clog2(WIDTH):0] count;

initial begin
    acc <= 0;
    r_quotient <= 0;
    working_register <= 0;
    count <= 0;
end

parameter Amsb = 3*WIDTH;
parameter Alsb = 2*WIDTH;
parameter Dmsb = (2*WIDTH) - 1;
parameter Dlsb = WIDTH;
parameter Qmsb = WIDTH - 1;
parameter Qlsb = 0;

reg [WIDTH:0] acc_next;

reg [2:0] current_state;
reg [2:0] next_state;

initial begin
    current_state <= 3'b100;
    next_state <= 3'b000;
    acc_next <= 0;
end

parameter IDLE = 3'b000, 
          DIVIDE_1 = 3'b001, 
          DIVIDE_2 = 3'b010,
          ERROR = 3'b011, 
          COMPLETE = 3'b100;
          
reg enable_state = 0;
reg hold = 1'b0;       

always @ (posedge (clk)) begin
    if (enable == 1'b1 & busy == 1'b0 & hold == 1'b0) begin
        enable_state <= 1'b1;
    end
end

//always @ (posedge(clk)) 
//begin : Next_State_Logic
//    current_state <= next_state;
//end



//always @ (posedge(clk)) 
//begin : Reset_Condition
//    if(reset) begin
//        hold <= 1'b0;
//    end
//end

always @ (posedge(clk)) 
begin : State_Logic
    if(reset) begin //Reset condition for FSM
        hold <= 1'b0;
        done <= 1'b0;
    end
    current_state <= next_state; // Next state logic;
    case(current_state) 
        IDLE:
            if (divisor == 0 & enable_state == 1'b1) begin
                next_state <= ERROR;
            end
            else begin
                if(enable_state == 1'b1 & hold != 1'b1) begin
                    working_register[3*WIDTH:0] <= {acc,dividend,r_quotient};
                    next_state <= DIVIDE_1;
                     
                    busy <= 1'b1;
                    hold <= 1'b1;
                end
                else begin
                    count <= 1'b0;
                    working_register[Amsb:Alsb] <= 0;
                    working_register[Qmsb:Qlsb] <= 0;
                    DBZ_flag <= 1'b0;
                end
            end
          DIVIDE_1:
                 if (working_register[Amsb:Alsb] >= {1'b0,divisor}) begin
                    working_register[Qlsb] <= 1; 
                    acc_next <= working_register[Amsb:Alsb] - {1'b0,divisor};
                    next_state <= DIVIDE_2;
                 end
                 else begin
                    if (count <= WIDTH-1) begin
                        count <= count + 1;
                        working_register = working_register << 1;
                    end
                    else begin
                        next_state <= COMPLETE;
                    end
                end
              
              
          DIVIDE_2:   
               begin
                  working_register[Amsb:Alsb] <= acc_next;
                  next_state <= DIVIDE_1;
               end
  
        ERROR:
        begin
            DBZ_flag <= 1'b1; 
            next_state <= COMPLETE;
        end
        
        COMPLETE:
        begin
            done <= 1'b1;
            busy <= 1'b0;
            count <= 1'b0;
            enable_state <= 1'b0;
            quotient <= working_register[Qmsb:Qlsb];
            remainder <= working_register[Amsb:Alsb];
            next_state <= IDLE;
        end    

    endcase
    
end

endmodule
