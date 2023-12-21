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


module main(
    input clk,
    input photonCounterIn1,
    output n
);

wire t_int_out;
wire [3:0] toSampler;
wire [3:0] toBuffer;
wire sample_and_clear;
wire toPhotonCounterReset;

integralTimer 
   #(
    .clk_speed(12_000_000),
    .t_int(0.000050) //50 us integration time.
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
    .default_fclk(12_000_000),
    .fs(1_000_000) //1 MHz Sampling Frequency
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
wire [3:0] n_delta;

counterBuffer 
   #(
    .fs(1_000_000),
    .delayTime_T(0.000005) //5 us delay time
    ) 
counterBuffer_1
    (
    .write_en(sample_and_clear), //The enable line will be connected to the sample_and_clear line
    .data_in(toBuffer),
    .n_i(n_i),
    .n_delta(n_delta)
);

AutoCorrelator AutoCorrelator_1(
.enable(sample_and_clear),
.reset(~t_int_out),
.n_i(n_i),
.n_delta(n_delta),
.n(n)
);


endmodule
