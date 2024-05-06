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
    input photonCounterIn1,
    input comm_clk,
    input txe,
    output rd,
    output siwu,
    output oe_n,
    output wr,
    output data_out
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

parameter WIDTH = 20;
//wire [WIDTH-1:0]ACF_result_1;
//AutoCorrelator 
//#(
//.WIDTH(WIDTH),
//.PRECISION(2),
//.fs(sampling_frequency), //1 MHz Sampling Frequency
//.delayTime(0.000125), //125 us max delay time
//.t_int(integration_time) //40 ms integration time (Typical for in vivo experiment)
//)
//AutoCorrelator_1
//(
//.clk(clk),
//.enable(sample_and_clear),
//.reset(~t_int_out),
//.n_i(n_i),
//.n_delta(n_delta_1),
//.ACF_result(ACF_result_1)
//);


wire [WIDTH-1:0] ACF_result_1;
wire ACF_done_1;
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
.ACF_result(ACF_result_1),
.done(ACF_done_1)
);


wire [WIDTH-1:0] ACF_result_2;
wire ACF_done_2;
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
.ACF_result(ACF_result_2),
.done(ACF_done_2)
);


wire [WIDTH-1:0] ACF_result_3;
wire ACF_done_3;
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
.ACF_result(ACF_result_3),
.done(ACF_done_3)
);


wire [WIDTH-1:0] ACF_result_4;
wire ACF_done_4;
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
.ACF_result(ACF_result_4),
.done(ACF_done_4)
);


wire [WIDTH-1:0] ACF_result_5;
wire ACF_done_5;
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
.ACF_result(ACF_result_5),
.done(ACF_done_5)
);


wire [WIDTH-1:0] ACF_result_6;
wire ACF_done_6;
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
.ACF_result(ACF_result_6),
.done(ACF_done_6)
);


wire [WIDTH-1:0] ACF_result_7;
wire ACF_done_7;
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
.ACF_result(ACF_result_7),
.done(ACF_done_7)
);


wire [WIDTH-1:0] ACF_result_8;
wire ACF_done_8;
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
.ACF_result(ACF_result_8),
.done(ACF_done_8)
);


wire [WIDTH-1:0] ACF_result_9;
wire ACF_done_9;
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
.ACF_result(ACF_result_9),
.done(ACF_done_9)
);


wire [WIDTH-1:0] ACF_result_10;
wire ACF_done_10;
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
.ACF_result(ACF_result_10),
.done(ACF_done_10)
);


wire [WIDTH-1:0] ACF_result_11;
wire ACF_done_11;
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
.ACF_result(ACF_result_11),
.done(ACF_done_11)
);


wire [WIDTH-1:0] ACF_result_12;
wire ACF_done_12;
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
.ACF_result(ACF_result_12),
.done(ACF_done_12)
);


wire [WIDTH-1:0] ACF_result_13;
wire ACF_done_13;
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
.ACF_result(ACF_result_13),
.done(ACF_done_13)
);


wire [WIDTH-1:0] ACF_result_14;
wire ACF_done_14;
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
.ACF_result(ACF_result_14),
.done(ACF_done_14)
);


wire [WIDTH-1:0] ACF_result_15;
wire ACF_done_15;
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
.ACF_result(ACF_result_15),
.done(ACF_done_15)
);


wire [WIDTH-1:0] ACF_result_16;
wire ACF_done_16;
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
.ACF_result(ACF_result_16),
.done(ACF_done_16)
);


wire [WIDTH-1:0] ACF_result_17;
wire ACF_done_17;
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
.ACF_result(ACF_result_17),
.done(ACF_done_17)
);


wire [WIDTH-1:0] ACF_result_18;
wire ACF_done_18;
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
.ACF_result(ACF_result_18),
.done(ACF_done_18)
);


wire [WIDTH-1:0] ACF_result_19;
wire ACF_done_19;
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
.ACF_result(ACF_result_19),
.done(ACF_done_19)
);


wire [WIDTH-1:0] ACF_result_20;
wire ACF_done_20;
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
.ACF_result(ACF_result_20),
.done(ACF_done_20)
);


wire [WIDTH-1:0] ACF_result_21;
wire ACF_done_21;
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
.ACF_result(ACF_result_21),
.done(ACF_done_21)
);


wire [WIDTH-1:0] ACF_result_22;
wire ACF_done_22;
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
.ACF_result(ACF_result_22),
.done(ACF_done_22)
);


wire [WIDTH-1:0] ACF_result_23;
wire ACF_done_23;
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
.ACF_result(ACF_result_23),
.done(ACF_done_23)
);


wire [WIDTH-1:0] ACF_result_24;
wire ACF_done_24;
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
.ACF_result(ACF_result_24),
.done(ACF_done_24)
);


wire [WIDTH-1:0] ACF_result_25;
wire ACF_done_25;
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
.ACF_result(ACF_result_25),
.done(ACF_done_25)
);


wire [WIDTH-1:0] ACF_result_26;
wire ACF_done_26;
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
.ACF_result(ACF_result_26),
.done(ACF_done_26)
);


wire [WIDTH-1:0] ACF_result_27;
wire ACF_done_27;
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
.ACF_result(ACF_result_27),
.done(ACF_done_27)
);


wire [WIDTH-1:0] ACF_result_28;
wire ACF_done_28;
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
.ACF_result(ACF_result_28),
.done(ACF_done_28)
);


wire [WIDTH-1:0] ACF_result_29;
wire ACF_done_29;
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
.ACF_result(ACF_result_29),
.done(ACF_done_29)
);


wire [WIDTH-1:0] ACF_result_30;
wire ACF_done_30;
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
.ACF_result(ACF_result_30),
.done(ACF_done_30)
);


wire [WIDTH-1:0] ACF_result_31;
wire ACF_done_31;
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
.ACF_result(ACF_result_31),
.done(ACF_done_31)
);


wire [WIDTH-1:0] ACF_result_32;
wire ACF_done_32;
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
.ACF_result(ACF_result_32),
.done(ACF_done_32)
);


wire [WIDTH-1:0] ACF_result_33;
wire ACF_done_33;
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
.ACF_result(ACF_result_33),
.done(ACF_done_33)
);


wire [WIDTH-1:0] ACF_result_34;
wire ACF_done_34;
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
.ACF_result(ACF_result_34),
.done(ACF_done_34)
);


wire [WIDTH-1:0] ACF_result_35;
wire ACF_done_35;
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
.ACF_result(ACF_result_35),
.done(ACF_done_35)
);


wire [WIDTH-1:0] ACF_result_36;
wire ACF_done_36;
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
.ACF_result(ACF_result_36),
.done(ACF_done_36)
);


wire [WIDTH-1:0] ACF_result_37;
wire ACF_done_37;
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
.ACF_result(ACF_result_37),
.done(ACF_done_37)
);


wire [WIDTH-1:0] ACF_result_38;
wire ACF_done_38;
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
.ACF_result(ACF_result_38),
.done(ACF_done_38)
);


wire [WIDTH-1:0] ACF_result_39;
wire ACF_done_39;
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
.ACF_result(ACF_result_39),
.done(ACF_done_39)
);


wire [WIDTH-1:0] ACF_result_40;
wire ACF_done_40;
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
.ACF_result(ACF_result_40),
.done(ACF_done_40)
);

//.n_delta(n_delta_40),
//.ACF_result(ACF_result_40)
//);
wire comm_enable;
and(comm_enable,ACF_done_1,ACF_done_2, ACF_done_3, ACF_done_4,ACF_done_5,ACF_done_6,ACF_done_7,ACF_done_8,ACF_done_9,ACF_done_10,ACF_done_11,ACF_done_12,ACF_done_13,ACF_done_14,ACF_done_15,ACF_done_16,ACF_done_17,ACF_done_18,ACF_done_19,ACF_done_20,ACF_done_21,ACF_done_22,ACF_done_23,ACF_done_24,ACF_done_25,ACF_done_26,ACF_done_27,ACF_done_28,ACF_done_29,ACF_done_30,ACF_done_31,ACF_done_32,ACF_done_33,ACF_done_34,ACF_done_35,ACF_done_36,ACF_done_37,ACF_done_38,ACF_done_39,ACF_done_40);

reg [559:0] concatenated_data;

always @ (posedge clk) begin
concatenated_data <= {
    ACF_result_1[13:0],
    ACF_result_2[13:0],
    ACF_result_3[13:0],
    ACF_result_4[13:0],
    ACF_result_5[13:0],
    ACF_result_6[13:0],
    ACF_result_7[13:0],
    ACF_result_8[13:0],
    ACF_result_9[13:0],
    ACF_result_10[13:0],
    ACF_result_11[13:0],
    ACF_result_12[13:0],
    ACF_result_13[13:0],
    ACF_result_14[13:0],
    ACF_result_15[13:0],
    ACF_result_16[13:0],
    ACF_result_17[13:0],
    ACF_result_18[13:0],
    ACF_result_19[13:0],
    ACF_result_20[13:0],
    ACF_result_21[13:0],
    ACF_result_22[13:0],
    ACF_result_23[13:0],
    ACF_result_24[13:0],
    ACF_result_25[13:0],
    ACF_result_26[13:0],
    ACF_result_27[13:0],
    ACF_result_28[13:0],
    ACF_result_29[13:0],
    ACF_result_30[13:0],
    ACF_result_31[13:0],
    ACF_result_32[13:0],
    ACF_result_33[13:0],
    ACF_result_34[13:0],
    ACF_result_35[13:0],
    ACF_result_36[13:0],
    ACF_result_37[13:0],
    ACF_result_38[13:0],
    ACF_result_39[13:0],
    ACF_result_40[13:0]
    };
end

FTDI_Top FTDI_Top
(
.enable(enable),
.comm_clk(clk_60MHz),
.txe(txe),
.data_out(data_out),
.data_in(concatenated_data),
.wr(wr),
.rd(rd),
.siwu(siwu),
.oe_n(oe_n)
);


endmodule
