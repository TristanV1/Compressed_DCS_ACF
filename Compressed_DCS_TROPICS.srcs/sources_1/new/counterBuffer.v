`timescale 1ns / 1ps

module counterBuffer
#(
parameter fs = 1_000_000, //1 MHz Sampling Frequency
parameter delayTime_T = 0.000105 //105 us delay time
) 
(
input write_en,//Enables write 
input [3:0] data_in,//Data to write to memory
//output Mem_OutOfRange//Memory overflow flag
output [3:0] n_i,
output [3:0] n_delta
);

parameter MEMORY_DEPTH = $rtoi($ceil(fs*delayTime_T)); //This is delta n, the minimum memory depth to perform the ACF.
parameter MEMORY_WIDTH = 4;
//parameter SIZE_OF_MEMORY_ADDRESS = $ceil($clog2(MEMORY_DEPTH));

reg [MEMORY_WIDTH-1:0] counterBuffer [0:MEMORY_DEPTH-1];

integer j;

initial begin
    for (j = 0; j < MEMORY_DEPTH; j = j+1)
            counterBuffer[j] = 0;
end

integer i;

assign n_i = counterBuffer[0];
assign n_delta = counterBuffer[MEMORY_DEPTH-1];

always @ (posedge(write_en)) begin
//    n_i <= counterBuffer[0];
//    n_delta <= counterBuffer[MEMORY_DEPTH-1];

    if (write_en == 1'b1) begin
    
        for (i = MEMORY_DEPTH-1; i > 0; i = i-1) begin
                counterBuffer[i] = counterBuffer[i-1];
        end
        
        counterBuffer[0] <= data_in;
        
    
    end
    
    else if (write_en == 1'b0) begin
        for (i = MEMORY_DEPTH-1; i > 0; i = i-1) begin
                counterBuffer[i] = 0;
        end
    end
    
    else begin
        for (i = MEMORY_DEPTH-1; i > 0; i = i-1) begin
                counterBuffer[i] = 0;
        end
    end

end

endmodule 


