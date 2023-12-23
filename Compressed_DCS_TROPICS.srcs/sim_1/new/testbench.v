`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 10:41:14 PM
// Design Name: 
// Module Name: testbench
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


module testbench();

//reg clk;
//reg photonCounter;
//wire n;

//main(
//.clk(clk),
//.photonCounter(photonCounter),
//.n(n)
//);

//wire t_int_out;

//integralTimer
//uut(
//.clk(clk),
//.t_int_out(t_int_out)
//);

//main uut(
//    .clk(clk),
//    .photonCounter(photonCounter),
//    .n(n)
//    );

//reg clk, write_en = 0;
//wire Mem_OutOfRange;
//reg [3:0] data_in = 4'b0;

//counterBuffer
//uut(
//.clk(clk),
//.write_en(write_en),
////.address_write(address_write),
//.data_in(data_in[3:0]),
//.Mem_OutOfRange(Mem_OutOfRange)
//);

//integer i;
//initial begin
//    clk = 0;
//    for (i = 0; i < 500; i = i + 1) begin
    
//        if (i % 5 == 0) begin
//            clk <= ~clk;
//        end
        
//        if (i % 2 == 0) begin
//            data_in <= data_in + 1;
//        end
        
//        if (i % 25 == 0) begin
//            write_en <= ~write_en;
//        end
        
//        #10;
        
//    end

//end

/////////////////////////////////////////Full Sampling Stage Integration Test Bench///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////Full Sampling Stage Integration Test Bench///////////////////////////////////////////////////////////////////////////
//reg clk = 0;
//reg photonCounterIn1 = 0;
//wire n;

//main uut(
//    .clk(clk),
//    .photonCounterIn1(photonCounterIn1),
//    .n(n)
//);

//integer i;
//initial begin
//    for(i = 0; i<100000; i = i+1) begin
//       if(i%10==0) begin
//          clk <= ~clk;   
//       end
       
//       if(i % ($random%5) == 0) begin
//          photonCounterIn1 <= ~photonCounterIn1;
//       end
       
//       #10;   
//    end
//end

/////////////////////////////////////////Full Sampling Stage Integration Test Bench///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////Full Sampling Stage Integration Test Bench///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////// Auto Correlator Test Bench ///////////////////////////////////////////////////////////////////////////
//reg enable = 0;
//reg reset = 0;
//reg [3:0] n_i = 0;
//reg [3:0] n_delta = 0;
//wire [7:0] n = 0;

//AutoCorrelator uut(
//.enable(enable),
//.reset(reset),
//.n_i(n_i),
//.n_delta(n_delta),
//.n(n)
//);

//integer i;

//initial begin
//    for(i = 0; i<100000; i = i+1) begin
//       if(i%10==0) begin
//          enable <= ~enable;   
//       end
       
//       if(i%25000==0) begin
//          reset <= ~reset;   
//       end
       
//       if(i % 5 == 0) begin
//          n_i <= $random%16;
//          n_delta <= $random%16;
//       end
       
//       #10;   
//    end
//end


///////////////////////////////////////// Auto Correlator Test Bench ///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////// Divider  ///////////////////////////////////////////////////////////////////////////
parameter WIDTH = 11;
reg clk = 0,enable = 0;
wire done,DBZ_flag;
wire [WIDTH-1:0] divisor = 10'd10;
wire [WIDTH-1:0] dividend = 10'd101;
wire [WIDTH-1:0] quotient = 0;
wire [WIDTH-1:0] remainder = 0;

Divider uut
(
.clk(clk),
.enable(enable),
.dividend(dividend),
.divisor(divisor),
.quotient(quotient),
.remainder(remainder),
.done(done),
.DBZ_flag(DBZ_flag)
);

integer i;

initial begin
    for(i = 0; i<100000; i = i+1) begin
       if(i%10==0) begin
          clk <= ~clk;   
       end
       
       if(i%200==0) begin
          enable <= ~enable;   
       end
       
       #10;   
    end
end


///////////////////////////////////////// Divider ///////////////////////////////////////////////////////////////////////////

endmodule