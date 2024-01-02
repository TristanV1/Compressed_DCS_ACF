`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 08:58:03 PM
// Design Name: 
// Module Name: main
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


module main
#(
parameter integration_time = 0.040,
parameter default_clock_frequency = 5_000_000,
parameter sampling_frequency = 1_000_000
)
(
    input clk,
    input photonCounterIn1
//    output n
);

wire t_int_out;
wire [3:0] toSampler;
wire [3:0] toBuffer;
wire sample_and_clear;
wire toPhotonCounterReset;

integralTimer 
   #(
    .clk_speed(default_clock_frequency),
    .t_int(integration_time) //integration time.
    )
integralTimer_1
    (
    .clk(clk),
    .t_int_out(t_int_out)
);

wire toPhotonCounter1;
and(toPhotonCounter1,t_int_out,photonCounterIn1);

or(toPhotonCounterReset, sample_and_clear, ~t_int_out);

photonCounter photonCounter_1
    (
    .photonCounter_TTL(toPhotonCounter1),
    .reset(toPhotonCounterReset),
    .counter_val(toSampler)
);

sampler
    #(
    .default_fclk(default_clock_frequency),
    .fs(sampling_frequency) //1 MHz Sampling Frequency
    )
sampler_1
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

wire ACF_result;
AutoCorrelator 
#(
.WIDTH(20),
.PRECISION(2),
.fs(sampling_frequency), //1 MHz Sampling Frequency
.delayTime(0.000125), //125 us max delay time
.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
)
AutoCorrelator_1
(
.clk(clk),
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta_1),
.ACF_result(ACF_result)
);


endmodule
