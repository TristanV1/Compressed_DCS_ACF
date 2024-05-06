`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 01:02:18 PM
// Design Name: 
// Module Name: Full_Integration_testbench
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


module Full_Integration_testbench();

parameter SYS_PERIOD = 83.33; //nanoseconds
parameter COMM_PERIOD = 16.66; //nanoseconds
parameter APD_PERIOD_ON = 25; //nanoseconds
parameter APD_PERIOD_OFF = 50; //nanoseconds

reg SYS_CLK = 0;
reg COMM_CLK = 0;
reg APD_INPUT = 0;

initial begin
    txe = 0;
    #(COMM_PERIOD/2);
    txe = 1;
end
initial begin //Generate SYS CLK 12 MHz
    forever begin
        #(SYS_PERIOD/2);
        SYS_CLK = ~SYS_CLK;
    end
end
initial begin //Generate COMM CLK 60 MHz    
    forever begin
        #(COMM_PERIOD/2);
        COMM_CLK = ~COMM_CLK;
    end
end
initial begin //Generate APD TTL Pulse
    forever begin
        APD_INPUT = 1;
        #APD_PERIOD_ON;
        APD_INPUT = 0;
        #APD_PERIOD_OFF;
    end
end

reg txe = 0;
reg wr;
reg rd;
reg siwu;
reg oe_n;
reg data_out;


main UUT
(
    .clk(SYS_CLK),
    .photonCounterIn1(APD_INPUT),
    .comm_clk(COMM_CLK),
    .txe(txe),
    .wr(wr),
    .rd(rd),
    .siwu(siwu),
    .oe_n(oe_n),
    .data_out(data_out)
);

//initial begin 
//    forever begin
//        if (~wr) begin
//            txe = 0;
//        end
//    end
//end
//initial begin
    
//end

endmodule

