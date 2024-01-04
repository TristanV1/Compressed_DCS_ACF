`timescale 1ns / 1ps

module counterBuffer
#(
parameter fs = 1_000_000, //1 MHz Sampling Frequency
parameter delayTime_MAX = 0.000125, //(largest expected delay time)
parameter delayTime_1  = 0.0000010, 
parameter delayTime_2  = 0.0000011,
parameter delayTime_3  = 0.0000013,
parameter delayTime_4  = 0.0000014,
parameter delayTime_5  = 0.0000016,
parameter delayTime_6  = 0.0000019,
parameter delayTime_7  = 0.0000021,
parameter delayTime_8  = 0.0000024,
parameter delayTime_9  = 0.0000027,
parameter delayTime_10 = 0.0000030,
parameter delayTime_11 = 0.0000034,
parameter delayTime_12 = 0.0000039,
parameter delayTime_13 = 0.0000044,
parameter delayTime_14 = 0.0000050,
parameter delayTime_15 = 0.0000057,
parameter delayTime_16 = 0.0000064,
parameter delayTime_17 = 0.0000072,
parameter delayTime_18 = 0.0000082,
parameter delayTime_19 = 0.0000093,
parameter delayTime_20 = 0.0000105,
parameter delayTime_21 = 0.0000119,
parameter delayTime_22 = 0.0000135,
parameter delayTime_23 = 0.0000152,
parameter delayTime_24 = 0.0000172,
parameter delayTime_25 = 0.0000195,
parameter delayTime_26 = 0.0000221,
parameter delayTime_27 = 0.0000250,
parameter delayTime_28 = 0.0000283,
parameter delayTime_29 = 0.0000320,
parameter delayTime_30 = 0.0000362,
parameter delayTime_31 = 0.0000410,
parameter delayTime_32 = 0.0000464,
parameter delayTime_33 = 0.0000525,
parameter delayTime_34 = 0.0000595,
parameter delayTime_35 = 0.0000673,
parameter delayTime_36 = 0.0000762,
parameter delayTime_37 = 0.0000862,
parameter delayTime_38 = 0.0000976,
parameter delayTime_39 = 0.0001104,
parameter delayTime_40 = 0.0001250
) 
(
input write_en,//Enables write 
input reset,
input [3:0] data_in,//Data to write to memory
output [3:0] n_i,
output [3:0] n_delta_1, 
output [3:0] n_delta_2,
output [3:0] n_delta_3,
output [3:0] n_delta_4,
output [3:0] n_delta_5,
output [3:0] n_delta_6,
output [3:0] n_delta_7,
output [3:0] n_delta_8,
output [3:0] n_delta_9,
output [3:0] n_delta_10,
output [3:0] n_delta_11,
output [3:0] n_delta_12,
output [3:0] n_delta_13,
output [3:0] n_delta_14,
output [3:0] n_delta_15,
output [3:0] n_delta_16,
output [3:0] n_delta_17,
output [3:0] n_delta_18,
output [3:0] n_delta_19,
output [3:0] n_delta_20,
output [3:0] n_delta_21,
output [3:0] n_delta_22,
output [3:0] n_delta_23,
output [3:0] n_delta_24,
output [3:0] n_delta_25,
output [3:0] n_delta_26,
output [3:0] n_delta_27,
output [3:0] n_delta_28,
output [3:0] n_delta_29,
output [3:0] n_delta_30,
output [3:0] n_delta_31,
output [3:0] n_delta_32,
output [3:0] n_delta_33,
output [3:0] n_delta_34,
output [3:0] n_delta_35,
output [3:0] n_delta_36,
output [3:0] n_delta_37,
output [3:0] n_delta_38,
output [3:0] n_delta_39,
output [3:0] n_delta_40
);

parameter MEMORY_DEPTH = $rtoi($ceil(fs*delayTime_MAX)); //This is delta n, the minimum memory depth to perform the ACF.
parameter MEMORY_WIDTH = 4;

parameter n_delta_address_1 = $rtoi(fs*delayTime_1); 
parameter n_delta_address_2 = $rtoi(fs*delayTime_2);
parameter n_delta_address_3 = $rtoi(fs*delayTime_3);
parameter n_delta_address_4 = $rtoi(fs*delayTime_4);
parameter n_delta_address_5 = $rtoi(fs*delayTime_5);
parameter n_delta_address_6 = $rtoi(fs*delayTime_6);
parameter n_delta_address_7 = $rtoi(fs*delayTime_7);
parameter n_delta_address_8 = $rtoi(fs*delayTime_8);
parameter n_delta_address_9 = $rtoi(fs*delayTime_9);
parameter n_delta_address_10 = $rtoi(fs*delayTime_10);
parameter n_delta_address_11 = $rtoi(fs*delayTime_11);
parameter n_delta_address_12 = $rtoi(fs*delayTime_12);
parameter n_delta_address_13 = $rtoi(fs*delayTime_13);
parameter n_delta_address_14 = $rtoi(fs*delayTime_14);
parameter n_delta_address_15 = $rtoi(fs*delayTime_15);
parameter n_delta_address_16 = $rtoi(fs*delayTime_16);
parameter n_delta_address_17 = $rtoi(fs*delayTime_17);
parameter n_delta_address_18 = $rtoi(fs*delayTime_18);
parameter n_delta_address_19 = $rtoi(fs*delayTime_19);
parameter n_delta_address_20 = $rtoi(fs*delayTime_20);
parameter n_delta_address_21 = $rtoi(fs*delayTime_21);
parameter n_delta_address_22 = $rtoi(fs*delayTime_22);
parameter n_delta_address_23 = $rtoi(fs*delayTime_23);
parameter n_delta_address_24 = $rtoi(fs*delayTime_24);
parameter n_delta_address_25 = $rtoi(fs*delayTime_25);
parameter n_delta_address_26 = $rtoi(fs*delayTime_26);
parameter n_delta_address_27 = $rtoi(fs*delayTime_27);
parameter n_delta_address_28 = $rtoi(fs*delayTime_28);
parameter n_delta_address_29 = $rtoi(fs*delayTime_29);
parameter n_delta_address_30 = $rtoi(fs*delayTime_30);
parameter n_delta_address_31 = $rtoi(fs*delayTime_31);
parameter n_delta_address_32 = $rtoi(fs*delayTime_32);
parameter n_delta_address_33 = $rtoi(fs*delayTime_33);
parameter n_delta_address_34 = $rtoi(fs*delayTime_34);
parameter n_delta_address_35 = $rtoi(fs*delayTime_35);
parameter n_delta_address_36 = $rtoi(fs*delayTime_36);
parameter n_delta_address_37 = $rtoi(fs*delayTime_37);
parameter n_delta_address_38 = $rtoi(fs*delayTime_38);
parameter n_delta_address_39 = $rtoi(fs*delayTime_39);
parameter n_delta_address_40 = $rtoi(fs*delayTime_40);

reg [MEMORY_WIDTH-1:0] counterBuffer [0:MEMORY_DEPTH-1];

integer j;

initial begin
    for (j = 0; j < MEMORY_DEPTH; j = j+1)
            counterBuffer[j] = 0;
end

integer i;

assign n_i = counterBuffer[0];
//assign n_delta_40 = counterBuffer[MEMORY_DEPTH-1];
assign n_delta_1 = counterBuffer[n_delta_address_1-1]; 
assign n_delta_2 = counterBuffer[n_delta_address_2-1]; 
assign n_delta_3 = counterBuffer[n_delta_address_3-1]; 
assign n_delta_4 = counterBuffer[n_delta_address_4-1]; 
assign n_delta_5 = counterBuffer[n_delta_address_5-1]; 
assign n_delta_6 = counterBuffer[n_delta_address_6-1]; 
assign n_delta_7 = counterBuffer[n_delta_address_7-1];
assign n_delta_8 = counterBuffer[n_delta_address_8-1];
assign n_delta_9 = counterBuffer[n_delta_address_9-1];
assign n_delta_10 = counterBuffer[n_delta_address_10-1];
assign n_delta_11 = counterBuffer[n_delta_address_11-1];
assign n_delta_12 = counterBuffer[n_delta_address_12-1];
assign n_delta_13 = counterBuffer[n_delta_address_13-1];
assign n_delta_14 = counterBuffer[n_delta_address_14-1];
assign n_delta_15 = counterBuffer[n_delta_address_15-1];
assign n_delta_16 = counterBuffer[n_delta_address_16-1];
assign n_delta_17 = counterBuffer[n_delta_address_17-1];
assign n_delta_18 = counterBuffer[n_delta_address_18-1];
assign n_delta_19 = counterBuffer[n_delta_address_19-1];
assign n_delta_20 = counterBuffer[n_delta_address_20-1];
assign n_delta_21 = counterBuffer[n_delta_address_21-1];
assign n_delta_22 = counterBuffer[n_delta_address_22-1];
assign n_delta_23 = counterBuffer[n_delta_address_23-1];
assign n_delta_24 = counterBuffer[n_delta_address_24-1];
assign n_delta_25 = counterBuffer[n_delta_address_25-1];
assign n_delta_26 = counterBuffer[n_delta_address_26-1];
assign n_delta_27 = counterBuffer[n_delta_address_27-1];
assign n_delta_28 = counterBuffer[n_delta_address_28-1];
assign n_delta_29 = counterBuffer[n_delta_address_29-1];
assign n_delta_30 = counterBuffer[n_delta_address_30-1];
assign n_delta_31 = counterBuffer[n_delta_address_31-1];
assign n_delta_32 = counterBuffer[n_delta_address_32-1];
assign n_delta_33 = counterBuffer[n_delta_address_33-1];
assign n_delta_34 = counterBuffer[n_delta_address_34-1];
assign n_delta_35 = counterBuffer[n_delta_address_35-1];
assign n_delta_36 = counterBuffer[n_delta_address_36-1];
assign n_delta_37 = counterBuffer[n_delta_address_37-1];
assign n_delta_38 = counterBuffer[n_delta_address_38-1];
assign n_delta_39 = counterBuffer[n_delta_address_39-1];
assign n_delta_40 = counterBuffer[n_delta_address_40-1];

always @ (write_en, reset) begin

    if (write_en == 1'b1) begin
    
        for (i = MEMORY_DEPTH-1; i > 0; i = i-1) begin
                counterBuffer[i] = counterBuffer[i-1];
        end
        
        counterBuffer[0] <= data_in;
        
    
    end
    
    if (reset == 1'b1) begin
        for (i = MEMORY_DEPTH-1; i > 0; i = i-1) begin
                counterBuffer[i] = 0;
        end
    end
    


end

endmodule 


