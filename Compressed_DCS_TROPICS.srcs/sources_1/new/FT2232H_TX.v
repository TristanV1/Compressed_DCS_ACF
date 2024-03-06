`timescale 1ns / 1ps

module FT2232H_TX
#(
    parameter DATA_WIDTH = 14    
)
(
    input clk,
    input txe,
    input [0:(DATA_WIDTH*40)-1] data,
    output wr,
    output reg [7:0] data_out
);

reg r_wr;

initial begin
    r_wr <= 1'b1;
end

assign wr = r_wr;

parameter IDLE = 2'b00,
          SEND = 2'b01,
          DONE = 2'b10,
          ERROR = 2'b11;

reg [1:0] state;

initial begin
    state <= IDLE;
end

reg [7:0] to_send = 'd0;
reg [7:0] next_data = 0;

parameter ADDRESS_WIDTH = $rtoi($ceil($clog2(DATA_WIDTH*40)));
parameter COUNTER_WIDTH = $rtoi($ceil($clog2(ADDRESS_WIDTH)));

reg [ADDRESS_WIDTH+1:0]data_out_LSB;
reg [ADDRESS_WIDTH+1:0]data_out_MSB;
reg [COUNTER_WIDTH+1:0]data_out_COUNTER;

initial begin
    data_out_LSB <= 0;
    data_out_MSB <= 7;
    data_out_COUNTER <= 0;
end


always @ ( posedge clk) begin //txe can go high while clk is low

    if(txe) begin
        state <= IDLE;
        r_wr <= 1'b1;
    end

    case(state) 

        IDLE:begin
            if(~txe) begin
                state <= SEND;
            end
            else begin
                r_wr <= 1'b1;
                data_out <= 8'b0;
            end
        end

        SEND:begin
            if(~txe) begin
                data_out <= data[8*data_out_COUNTER+:8];
                data_out_COUNTER <= data_out_COUNTER + 1;
                //data_out_LSB <= data_out_LSB+8;
                //data_out_MSB <= data_out_MSB+8;
                r_wr <= 1'b0;
            end
            else begin
                to_send <= to_send - 1'b1;
                r_wr <= 1'b1;
                next_data <= to_send+1;
                
                data_out_LSB <= 0;
                data_out_MSB <= 7;

                state <= IDLE;
            end
        end
    endcase
end


endmodule