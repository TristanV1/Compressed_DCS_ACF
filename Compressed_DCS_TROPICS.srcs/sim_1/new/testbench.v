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
reg clk = 1;
reg photonCounterIn1 = 0;
wire n;

main 
#(
.integration_time(0.040),
.default_clock_frequency(5_000_000),
.sampling_frequency(1_000_000)
)
uut(
    .clk(clk),
    .photonCounterIn1(photonCounterIn1)
//    .n(n)
);

integer i;
initial begin
    #10; 
    for(i = 0;; i = i+1) begin
       if(i%10==0) begin
          clk <= ~clk;   
       end
       
       if(i % ($random%5) == 0) begin
          photonCounterIn1 <= ~photonCounterIn1;
       end
       
       #10;   
    end
end

/////////////////////////////////////////Full Sampling Stage Integration Test Bench///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////Full Sampling Stage Integration Test Bench///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////// Auto Correlator Test Bench ///////////////////////////////////////////////////////////////////////////
//parameter WIDTH = 19;
//reg clk = 0;
//reg enable = 0;
//reg reset = 0;
//reg [3:0] n_i = 0;
//reg [3:0] n_delta = 0;
//wire [7:0] n = 0;
//wire [WIDTH-1:0] ACF_result;

//AutoCorrelator 
//#(
//.WIDTH(WIDTH)
//)
//uut(
//.clk(clk),
//.enable(enable),
//.reset(reset),
//.n_i(n_i),
//.n_delta(n_delta),
//.ACF_result(ACF_result)
//);

////integralTimer
////uut(
////.clk(clk),
////.t_int_out(t_int_out)
////);

//integer i;
//integer j = 0;

//parameter WIDTH_2 = 100;
//reg [3:0] n_i_reg [0:WIDTH_2-1] = '{4'd1, 4'd3, 4'd8, 4'd10, 4'd5, 4'd10, 4'd6, 4'd9, 4'd0, 4'd5, 4'd5, 4'd6, 4'd10, 4'd10, 4'd1, 4'd10, 4'd7, 4'd1, 4'd10, 4'd8, 4'd3, 4'd6, 4'd6, 4'd9, 4'd6, 4'd1, 4'd6, 4'd5, 4'd0, 4'd4, 4'd5, 4'd8, 4'd10, 4'd0, 4'd3, 4'd0, 4'd0, 4'd0, 4'd3, 4'd0, 4'd7, 4'd10, 4'd10, 4'd6, 4'd6, 4'd8, 4'd2, 4'd2, 4'd4, 4'd5, 4'd10, 4'd0, 4'd2, 4'd8, 4'd5, 4'd0, 4'd9, 4'd7, 4'd8, 4'd6, 4'd8, 4'd6, 4'd2, 4'd1, 4'd4, 4'd4, 4'd0, 4'd4, 4'd7, 4'd8, 4'd1, 4'd8, 4'd5, 4'd10, 4'd6, 4'd4, 4'd10, 4'd3, 4'd3, 4'd2, 4'd1, 4'd5, 4'd1, 4'd0, 4'd5, 4'd1, 4'd2, 4'd8, 4'd3, 4'd1, 4'd9, 4'd5, 4'd4, 4'd0, 4'd10, 4'd4, 4'd4, 4'd4, 4'd8, 4'd1};
//reg [3:0] n_delta_reg [0:WIDTH_2-1]  = '{4'd0,4'd1, 4'd3, 4'd8, 4'd10, 4'd5, 4'd10, 4'd6, 4'd9, 4'd0, 4'd5, 4'd5, 4'd6, 4'd10, 4'd10, 4'd1, 4'd10, 4'd7, 4'd1, 4'd10, 4'd8, 4'd3, 4'd6, 4'd6, 4'd9, 4'd6, 4'd1, 4'd6, 4'd5, 4'd0, 4'd4, 4'd5, 4'd8, 4'd10, 4'd0, 4'd3, 4'd0, 4'd0, 4'd0, 4'd3, 4'd0, 4'd7, 4'd10, 4'd10, 4'd6, 4'd6, 4'd8, 4'd2, 4'd2, 4'd4, 4'd5, 4'd10, 4'd0, 4'd2, 4'd8, 4'd5, 4'd0, 4'd9, 4'd7, 4'd8, 4'd6, 4'd8, 4'd6, 4'd2, 4'd1, 4'd4, 4'd4, 4'd0, 4'd4, 4'd7, 4'd8, 4'd1, 4'd8, 4'd5, 4'd10, 4'd6, 4'd4, 4'd10, 4'd3, 4'd3, 4'd2, 4'd1, 4'd5, 4'd1, 4'd0, 4'd5, 4'd1, 4'd2, 4'd8, 4'd3, 4'd1, 4'd9, 4'd5, 4'd4, 4'd0, 4'd10, 4'd4, 4'd4, 4'd4, 4'd8};

//initial begin

//    for(i = 0; i<100000; i = i+1) begin
//       if(i%1==0) begin
//          clk <= ~clk;   
//       end
    
//       if(i%5==0) begin
//          enable <= ~enable;  
//       end
//       if (i%10==0) begin
//          n_i <= n_i_reg[j];
//          n_delta <= n_delta_reg[j];
//          if (j>=WIDTH_2-1) begin
//             j = 0;
//          end
//          else begin
//            j = j +1; 
//          end
          
//       end
       
//       if(i%1000==0) begin
//          reset <= ~reset;   
//       end
//       #10;   
//    end
//end


///////////////////////////////////////// Auto Correlator Test Bench ///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////// Divider  ///////////////////////////////////////////////////////////////////////////
//parameter WIDTH = 32;
//reg clk = 0,enable = 0;
//wire done,DBZ_flag,busy;
//reg [WIDTH-1:0] dividend = 11'd3; //Scale by 1000 to have 3 signigicant figures.
//reg [WIDTH-1:0] divisor = 11'd5; // 1/3 = 0.33333
//wire [WIDTH-1:0] quotient;
//wire [WIDTH-1:0] remainder;


//Divider 
//#(
//.WIDTH(WIDTH)
//)
//uut
//(
//.clk(clk),
//.enable(enable),
//.dividend(dividend),
//.divisor(divisor),
//.quotient(quotient),
//.remainder(remainder),
//.done(done),
//.busy(busy),
//.DBZ_flag(DBZ_flag)
//);

//integer i;
//integer tog = 0;
//integer tog2 = 0;
//initial begin
//    for(i = 0; i<100000; i = i+1) begin
//       if(i%10==0) begin
//       enable <= ~enable;
//       end 
       
//       #10;
//       if(i%10==0) begin
//          clk <= ~clk;   
//       end
       
          
//    end
//end


///////////////////////////////////////// Divider ///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////// Integration Timer & ACF ///////////////////////////////////////////////////////////////////////////
//parameter WIDTH = 19;
//reg clk = 0;
//reg enable = 0;
//reg reset = 0;
//reg [3:0] n_i = 0;
//reg [3:0] n_delta = 0;
//wire [7:0] n = 0;
//wire [WIDTH-1:0] ACF_result;

//AutoCorrelator 
//#(
//.WIDTH(WIDTH)
//)
//uut1(
//.clk(clk),
//.enable(enable),
//.reset(~t_int_out),
//.n_i(n_i),
//.n_delta(n_delta),
//.ACF_result(ACF_result)
//);

//integralTimer
//uut2(
//.clk(clk),
//.t_int_out(t_int_out)
//);

//integer i;
//integer j = 0;

//parameter WIDTH_2 = 100;
//reg [3:0] n_i_reg [0:WIDTH_2-1] = '{4'd1, 4'd3, 4'd8, 4'd10, 4'd5, 4'd10, 4'd6, 4'd9, 4'd0, 4'd5, 4'd5, 4'd6, 4'd10, 4'd10, 4'd1, 4'd10, 4'd7, 4'd1, 4'd10, 4'd8, 4'd3, 4'd6, 4'd6, 4'd9, 4'd6, 4'd1, 4'd6, 4'd5, 4'd0, 4'd4, 4'd5, 4'd8, 4'd10, 4'd0, 4'd3, 4'd0, 4'd0, 4'd0, 4'd3, 4'd0, 4'd7, 4'd10, 4'd10, 4'd6, 4'd6, 4'd8, 4'd2, 4'd2, 4'd4, 4'd5, 4'd10, 4'd0, 4'd2, 4'd8, 4'd5, 4'd0, 4'd9, 4'd7, 4'd8, 4'd6, 4'd8, 4'd6, 4'd2, 4'd1, 4'd4, 4'd4, 4'd0, 4'd4, 4'd7, 4'd8, 4'd1, 4'd8, 4'd5, 4'd10, 4'd6, 4'd4, 4'd10, 4'd3, 4'd3, 4'd2, 4'd1, 4'd5, 4'd1, 4'd0, 4'd5, 4'd1, 4'd2, 4'd8, 4'd3, 4'd1, 4'd9, 4'd5, 4'd4, 4'd0, 4'd10, 4'd4, 4'd4, 4'd4, 4'd8, 4'd1};
//reg [3:0] n_delta_reg [0:WIDTH_2-1]  = '{4'd0,4'd1, 4'd3, 4'd8, 4'd10, 4'd5, 4'd10, 4'd6, 4'd9, 4'd0, 4'd5, 4'd5, 4'd6, 4'd10, 4'd10, 4'd1, 4'd10, 4'd7, 4'd1, 4'd10, 4'd8, 4'd3, 4'd6, 4'd6, 4'd9, 4'd6, 4'd1, 4'd6, 4'd5, 4'd0, 4'd4, 4'd5, 4'd8, 4'd10, 4'd0, 4'd3, 4'd0, 4'd0, 4'd0, 4'd3, 4'd0, 4'd7, 4'd10, 4'd10, 4'd6, 4'd6, 4'd8, 4'd2, 4'd2, 4'd4, 4'd5, 4'd10, 4'd0, 4'd2, 4'd8, 4'd5, 4'd0, 4'd9, 4'd7, 4'd8, 4'd6, 4'd8, 4'd6, 4'd2, 4'd1, 4'd4, 4'd4, 4'd0, 4'd4, 4'd7, 4'd8, 4'd1, 4'd8, 4'd5, 4'd10, 4'd6, 4'd4, 4'd10, 4'd3, 4'd3, 4'd2, 4'd1, 4'd5, 4'd1, 4'd0, 4'd5, 4'd1, 4'd2, 4'd8, 4'd3, 4'd1, 4'd9, 4'd5, 4'd4, 4'd0, 4'd10, 4'd4, 4'd4, 4'd4, 4'd8};

//initial begin

//    for(i = 0;; i = i+1) begin
//       if(i%1==0) begin
//          clk <= ~clk;   
//       end
    
//       if(i%5==0) begin
//          enable <= ~enable;  
//       end
//       if (i%10==0) begin
//          n_i <= n_i_reg[j];
//          n_delta <= n_delta_reg[j];
//          if (j>=WIDTH_2-1) begin
//             j = 0;
//          end
//          else begin
//            j = j +1; 
//          end
          
//       end
       
//       #10;   
//    end
//end
///////////////////////////////////////// Integration Timer & ACF  ///////////////////////////////////////////////////////////////////////////

endmodule