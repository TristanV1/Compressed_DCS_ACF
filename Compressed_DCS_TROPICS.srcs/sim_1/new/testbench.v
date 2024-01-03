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
//reg clk = 1;
//reg photonCounterIn1 = 0;
//wire n;

//main 
//#(
//.integration_time(0.040),
//.default_clock_frequency(5_000_000),
//.sampling_frequency(1_000_000)
//)
//uut(
//    .clk(clk),
//    .photonCounterIn1(photonCounterIn1)
////    .n(n)
//);

//integer i;
//initial begin
//    #10; 
//    for(i = 0;; i = i+1) begin
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
//parameter WIDTH = 19;
//reg clk = 0;
//reg enable = 0;
//reg reset = 0;
//reg [3:0] n_i = 0;

//wire [7:0] n = 0;
//wire [3:0] n_delta [0:39];
//wire [WIDTH-1:0] ACF_result [0:39];


//parameter real delay_times[40] = {
//  0.0000010000,
//  0.0000011318,
//  0.0000012810,
//  0.0000014498,
//  0.0000016408,
//  0.0000018571,
//  0.0000021018,
//  0.0000023789,
//  0.0000026924,
//  0.0000030472,
//  0.0000034488,
//  0.0000039033,
//  0.0000044178,
//  0.0000050000,
//  0.0000056590,
//  0.0000064048,
//  0.0000072489,
//  0.0000082042,
//  0.0000092855,
//  0.0000105092,
//  0.0000118943,
//  0.0000134619,
//  0.0000152360,
//  0.0000172440,
//  0.0000195167,
//  0.0000220888,
//  0.0000250000,
//  0.0000282948,
//  0.0000320239,
//  0.0000362444,
//  0.0000410211,
//  0.0000464274,
//  0.0000525462,
//  0.0000594714,
//  0.0000673093,
//  0.0000761802,
//  0.0000862202,
//  0.0000975834,
//  0.0001104442,
//  0.0001250000
//};

//genvar k;

//generate
//  for (k = 0; k < 40; k = k + 1) begin : auto_corr_inst
//  AutoCorrelator
//    #(
//    .WIDTH(WIDTH),
//    .PRECISION(2),
//    .fs(1_000_000), //1 MHz Sampling Frequency
//    .delayTime(delay_times[k]), //0.0000010000 us max delay time
//    .t_int(0.0001) //0.1 ms integration time (Simulating 100 n(i) size)
//    )
//    uut_inst (
//      .clk(clk),
//      .enable(enable),
//      .reset(reset),
//      .n_i(n_i),
//      .n_delta(n_delta[k*4 +: 4]), // Assuming n_delta is an array of 4-bit elements
//      .ACF_result(ACF_result[k*WIDTH +: WIDTH])
//    );
//  end
//endgenerate


//AutoCorrelator 
//#(
//.WIDTH(WIDTH)
//)
//uut(
//    .clk(clk),
//    .enable(enable),
//    .reset(reset),
//    .n_i(n_i),
//    .n_delta(n_delta),
//    .ACF_result(ACF_result)
//);

//integralTimer
//uut(
//.clk(clk),
//.t_int_out(t_int_out)
//);

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
parameter WIDTH_2 = 125;
parameter integration_time = 0.000125;
parameter sampling_frequency = 1_000_000;

reg [3:0] n_i_reg [0:WIDTH_2-1] = '{0, 9, 0, 5, 5, 8, 9, 4, 0, 2, 10, 4, 10, 0, 5, 8, 5, 5, 3, 4, 1, 10, 7, 8, 9, 5, 0, 8, 6, 8, 2, 2, 9, 0, 5, 0, 9, 6, 10, 2, 10, 0, 1, 6, 10, 4, 5, 3, 4, 10, 4, 6, 7, 2, 2, 10, 3, 2, 10, 5, 8, 7, 2, 10, 7, 0, 1, 0, 6, 0, 8, 2, 8, 9, 4, 5, 1, 0, 4, 5, 3, 3, 1, 2, 5, 10, 9, 5, 2, 8, 8, 5, 7, 2, 6, 1, 6, 3, 1, 8, 1, 10, 1, 2, 2, 1, 10, 4, 7, 3, 6, 4, 2, 6, 1, 8, 10, 8, 3, 8, 3, 0, 2, 1, 0};


reg clk = 0;

integer i;
integer z = 0;

reg prev = 0;
initial begin
    for(i=0;;i=i+1) begin
        clk <= ~clk;
        #41.667
        
        if (sample_and_clear != prev & t_int_out == 1) begin
            if (sample_and_clear == 1'b1) begin
                toSampler <= n_i_reg[z];
                z = z + 1;
            end  
        end
        
        prev <= sample_and_clear;  
        
    end
end
wire t_int_out;
reg [3:0] toSampler = 0;
wire [3:0] toBuffer;
wire sample_and_clear;
wire toPhotonCounterReset;

integralTimer 
   #(
    .clk_speed(12_000_000),
    .t_int(integration_time) //integration time.
    )
integralTimer_1
    (
    .clk(clk),
    .t_int_out(t_int_out)
);

sampler sampler_1
    (
    .clk(clk),
    .sample_in(toSampler),
    .sample_out(toBuffer),
    .sample_and_clear(sample_and_clear)
);

wire toCounterBufferEnable;
and(toCounterBufferEnable, t_int_out, sample_and_clear);

wire [3:0] n_i;
wire [3:0] n_delta_1;  
wire [3:0] n_delta_2;  
wire [3:0] n_delta_3;  
wire [3:0] n_delta_4;  
wire [3:0] n_delta_5;  
wire [3:0] n_delta_6;  
wire [3:0] n_delta_7;  
wire [3:0] n_delta_8;  
wire [3:0] n_delta_9;  
wire [3:0] n_delta_10; 
wire [3:0] n_delta_11; 
wire [3:0] n_delta_12;
wire [3:0] n_delta_13;
wire [3:0] n_delta_14;
wire [3:0] n_delta_15;
wire [3:0] n_delta_16;
wire [3:0] n_delta_17;
wire [3:0] n_delta_18;
wire [3:0] n_delta_19;
wire [3:0] n_delta_20;
wire [3:0] n_delta_21;
wire [3:0] n_delta_22;
wire [3:0] n_delta_23;
wire [3:0] n_delta_24;
wire [3:0] n_delta_25;
wire [3:0] n_delta_26;
wire [3:0] n_delta_27;
wire [3:0] n_delta_28;
wire [3:0] n_delta_29;
wire [3:0] n_delta_30;
wire [3:0] n_delta_31;
wire [3:0] n_delta_32;
wire [3:0] n_delta_33;
wire [3:0] n_delta_34;
wire [3:0] n_delta_35;
wire [3:0] n_delta_36;
wire [3:0] n_delta_37;
wire [3:0] n_delta_38;
wire [3:0] n_delta_39;
wire [3:0] n_delta_40;

counterBuffer 
   #(
    .fs(sampling_frequency),
    .delayTime_MAX(0.000125) //5 us delay time
    ) 
counterBuffer_1
    (
    .write_en(sample_and_clear), //The enable line will be connected to the sample_and_clear line
    .reset(~t_int_out),
    .data_in(toBuffer),
    .n_i(n_i),
    .n_delta_1(n_delta_1), 
    .n_delta_2(n_delta_2), 
    .n_delta_3(n_delta_3), 
    .n_delta_4(n_delta_4), 
    .n_delta_5(n_delta_5), 
    .n_delta_6(n_delta_6), 
    .n_delta_7(n_delta_7),
    .n_delta_8(n_delta_8),
    .n_delta_9(n_delta_9),
    .n_delta_10(n_delta_10),
    .n_delta_11(n_delta_11),
    .n_delta_12(n_delta_12),
    .n_delta_13(n_delta_13),
    .n_delta_14(n_delta_14),
    .n_delta_15(n_delta_15),
    .n_delta_16(n_delta_16),
    .n_delta_17(n_delta_17),
    .n_delta_18(n_delta_18),
    .n_delta_19(n_delta_19),
    .n_delta_20(n_delta_20),
    .n_delta_21(n_delta_21),
    .n_delta_22(n_delta_22),
    .n_delta_23(n_delta_23),
    .n_delta_24(n_delta_24),
    .n_delta_25(n_delta_25),
    .n_delta_26(n_delta_26),
    .n_delta_27(n_delta_27),
    .n_delta_28(n_delta_28),
    .n_delta_29(n_delta_29),
    .n_delta_30(n_delta_30),
    .n_delta_31(n_delta_31),
    .n_delta_32(n_delta_32),
    .n_delta_33(n_delta_33),
    .n_delta_34(n_delta_34),
    .n_delta_35(n_delta_35),
    .n_delta_36(n_delta_36),
    .n_delta_37(n_delta_37),
    .n_delta_38(n_delta_38),
    .n_delta_39(n_delta_39),
    .n_delta_40(n_delta_40)
    );

parameter WIDTH = 20;


wire [WIDTH-1:0] ACF_result_1;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000010000), //0.0000010000 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_1
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_1),
.ACF_result(ACF_result_1)
);


wire [WIDTH-1:0] ACF_result_2;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000011318), //0.0000011318 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_2
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_2),
.ACF_result(ACF_result_2)
);


wire [WIDTH-1:0] ACF_result_3;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000012810), //0.0000012810 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_3
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_3),
.ACF_result(ACF_result_3)
);


wire [WIDTH-1:0] ACF_result_4;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000014498), //0.0000014498 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_4
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_4),
.ACF_result(ACF_result_4)
);


wire [WIDTH-1:0] ACF_result_5;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000016408), //0.0000016408 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_5
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_5),
.ACF_result(ACF_result_5)
);


wire [WIDTH-1:0] ACF_result_6;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000018571), //0.0000018571 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_6
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_6),
.ACF_result(ACF_result_6)
);


wire [WIDTH-1:0] ACF_result_7;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000021018), //0.0000021018 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_7
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_7),
.ACF_result(ACF_result_7)
);


wire [WIDTH-1:0] ACF_result_8;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000023789), //0.0000023789 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_8
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_8),
.ACF_result(ACF_result_8)
);


wire [WIDTH-1:0] ACF_result_9;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000026924), //0.0000026924 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_9
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_9),
.ACF_result(ACF_result_9)
);


wire [WIDTH-1:0] ACF_result_10;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000030472), //0.0000030472 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_10
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_10),
.ACF_result(ACF_result_10)
);


wire [WIDTH-1:0] ACF_result_11;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000034488), //0.0000034488 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_11
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_11),
.ACF_result(ACF_result_11)
);


wire [WIDTH-1:0] ACF_result_12;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000039033), //0.0000039033 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_12
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_12),
.ACF_result(ACF_result_12)
);


wire [WIDTH-1:0] ACF_result_13;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000044178), //0.0000044178 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_13
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_13),
.ACF_result(ACF_result_13)
);


wire [WIDTH-1:0] ACF_result_14;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000050000), //0.0000050000 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_14
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_14),
.ACF_result(ACF_result_14)
);


wire [WIDTH-1:0] ACF_result_15;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000056590), //0.0000056590 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_15
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_15),
.ACF_result(ACF_result_15)
);


wire [WIDTH-1:0] ACF_result_16;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000064048), //0.0000064048 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_16
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_16),
.ACF_result(ACF_result_16)
);


wire [WIDTH-1:0] ACF_result_17;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000072489), //0.0000072489 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_17
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_17),
.ACF_result(ACF_result_17)
);


wire [WIDTH-1:0] ACF_result_18;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000082042), //0.0000082042 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_18
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_18),
.ACF_result(ACF_result_18)
);


wire [WIDTH-1:0] ACF_result_19;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000092855), //0.0000092855 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_19
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_19),
.ACF_result(ACF_result_19)
);


wire [WIDTH-1:0] ACF_result_20;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000105092), //0.0000105092 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_20
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_20),
.ACF_result(ACF_result_20)
);


wire [WIDTH-1:0] ACF_result_21;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000118943), //0.0000118943 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_21
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_21),
.ACF_result(ACF_result_21)
);


wire [WIDTH-1:0] ACF_result_22;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000134619), //0.0000134619 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_22
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_22),
.ACF_result(ACF_result_22)
);


wire [WIDTH-1:0] ACF_result_23;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000152360), //0.0000152360 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_23
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_23),
.ACF_result(ACF_result_23)
);


wire [WIDTH-1:0] ACF_result_24;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000172440), //0.0000172440 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_24
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_24),
.ACF_result(ACF_result_24)
);


wire [WIDTH-1:0] ACF_result_25;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000195167), //0.0000195167 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_25
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_25),
.ACF_result(ACF_result_25)
);


wire [WIDTH-1:0] ACF_result_26;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000220888), //0.0000220888 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_26
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_26),
.ACF_result(ACF_result_26)
);


wire [WIDTH-1:0] ACF_result_27;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000250000), //0.0000250000 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_27
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_27),
.ACF_result(ACF_result_27)
);


wire [WIDTH-1:0] ACF_result_28;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000282948), //0.0000282948 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_28
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_28),
.ACF_result(ACF_result_28)
);


wire [WIDTH-1:0] ACF_result_29;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000320239), //0.0000320239 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_29
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_29),
.ACF_result(ACF_result_29)
);


wire [WIDTH-1:0] ACF_result_30;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000362444), //0.0000362444 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_30
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_30),
.ACF_result(ACF_result_30)
);


wire [WIDTH-1:0] ACF_result_31;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000410211), //0.0000410211 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_31
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_31),
.ACF_result(ACF_result_31)
);


wire [WIDTH-1:0] ACF_result_32;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000464274), //0.0000464274 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_32
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_32),
.ACF_result(ACF_result_32)
);


wire [WIDTH-1:0] ACF_result_33;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000525462), //0.0000525462 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_33
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_33),
.ACF_result(ACF_result_33)
);


wire [WIDTH-1:0] ACF_result_34;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000594714), //0.0000594714 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_34
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_34),
.ACF_result(ACF_result_34)
);


wire [WIDTH-1:0] ACF_result_35;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000673093), //0.0000673093 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_35
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_35),
.ACF_result(ACF_result_35)
);


wire [WIDTH-1:0] ACF_result_36;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000761802), //0.0000761802 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_36
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_36),
.ACF_result(ACF_result_36)
);


wire [WIDTH-1:0] ACF_result_37;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000862202), //0.0000862202 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_37
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_37),
.ACF_result(ACF_result_37)
);


wire [WIDTH-1:0] ACF_result_38;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0000975834), //0.0000975834 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_38
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_38),
.ACF_result(ACF_result_38)
);


wire [WIDTH-1:0] ACF_result_39;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0001104442), //0.0001104442 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_39
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_39),
.ACF_result(ACF_result_39)
);


wire [WIDTH-1:0] ACF_result_40;
AutoCorrelator
#(
.WIDTH(WIDTH),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.0001250000), //0.0001250000 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_40
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_40),
.ACF_result(ACF_result_40)
);



endmodule