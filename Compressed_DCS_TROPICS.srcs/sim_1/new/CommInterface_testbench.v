`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2024 07:30:04 PM
// Design Name: 
// Module Name: top_tb
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


module CommInterface_testbench(
);

reg sysclk   = 0,
    comm_clk = 0, 
    txe      = 0; //inputs

wire [7:0] data_out; //output data (to FT2232)
wire wr; //write ready signal (to FT2232)
wire rd;
reg enable = 0;
wire siwu;
wire oe_n;

reg [0:559] data_in = 560'b00000000000000010000001000000011000001000000010100000110000001110000100000001001000010100000101100001100000011010000111000001111000100000001000100010010000100110001010000010101000101100001011100011000000110010001101000011011000111000001110100011110000111110010000000100001001000100010001100100100001001010010011000100111001010000010100100101010001010110010110000101101001011100010111100110000001100010011001000110011001101000011010100110110001101110011100000111001001110100011101100111100001111010011111000111111010000000100000101000010010000110100010001000101;

FTDI_Top tb
(
.sysclk(sysclk),
.comm_clk(comm_clk),
.enable(enable),
.txe(txe),
.data_in(data_in),

.data_out(data_out),
.wr(wr),
.rd(rd),

.siwu(siwu),
.oe_n(oe_n)

);

integer i;
initial begin
    txe <= 0;
    for (i=0; i<100000; i = i+1) begin
        if(i % 1 == 0) begin
            comm_clk <= ~comm_clk;
        end

        if(i % 5 == 0) begin
            sysclk <= ~sysclk;
        end
        
        if(i % ($random%5) == 0) begin
            txe <= ~txe;
        end

        if(i % ($random%250) == 0) begin
            enable <= 0;
        end
        
        if(i % ($random%250) == 0) begin
            enable <= 1;
        end

        #10;
    end
end

endmodule