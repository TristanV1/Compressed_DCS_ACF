`timescale 1ns / 1ps

// This module creates the Counter Buffer that interfaces directly with the photon counter
// Each channel will create an instance of the counterBuffer.
// The parameters ts and t_int are adjustable, however, these will be modifiable through software in future versions. 


//module counterBuffer
//#(
//parameter fs = 1_000, //1,000 kHz Sampling Frequency
//parameter t_int = 0.01 //1 ms integration time
//) 
//(  
//input fs_clk, //
//input enable, //The enable line will be connected to the t_int timer
//input photonCounter, //The TTL pulse directly from the photonCounter
//output reg [sizeof_n:0] n //Defines the output register n 
//);

////parameter ts = 0.000001;
////parameter fs = 1/ts; //1,000 kHz Sampling Frequency
////parameter t_int = 0.01; //1 ms integration time
//parameter sizeof_n = $rtoi($ceil(fs*t_int));
//parameter sizeof_bufferAddress = $clog2(sizeof_n);

//reg [3:0] currentCount = 4'b0;
//reg [3:0] countBuffer [0:sizeof_n] = 0;

//always @ (enable) begin
//    if (photonCounter == 1'b1) begin
//        currentCount <= currentCount + 1;
//    end
//end

//reg [sizeof_bufferAddress:0] bufferAddress = 1'b1;

//always @ (posedge(fs_clk) or !enable) begin
//    countBuffer[bufferAddress][3:0] = currentCount;
//end

//n <= countBuffer;
//always @ (negedge(fs_clk)) begin //This method may clear some counts that occur in between the rising and falling edge of fs_clk
//    bufferAddress <= bufferAddress + 1; //Increment the buffer Address for the next rising edge of fs_clk
//    currentCount <= 0;
//end

//endmodule


module counterBufferMemory
#(
parameter fs = 1_000, //1,000 kHz Sampling Frequency
parameter t_int = 0.01 //1 ms integration time
) 
(
input clk,
input read_en,//Enables read at given address
input write_en,//Enables write at given address
input address_read,//Address to read from
input address_write,//Address to write to 
input data_in,//Data to write to memory
output data_out,//Data read from memory at given address
output Mem_OutOfRange//Memory overflow flag
);

parameter MEMORY_DEPTH = $rtoi($ceil(fs*t_int));
parameter SIZE_OF_MEMORY_ADDRESS = $clog2($ceil(MEMORY_DEPTH));
parameter MEMORY_WIDTH = 4;

reg [MEMORY_WIDTH-1:0] counterBuffer [0:MEMORY_DEPTH-1] = 0;

always @ (posedge(clk)) begin

    if (read_en) begin
        data_out <= counterBuffer[address_read];
    end
    
    if (write_en) begin
        counterBuffer[address_write] <= data_in;
    end
    
    if (address_read > MEMORY_DEPTH-1 | address_write > MEMORY_DEPTH-1) begin
        Mem_OutOfRange <= 1'b1;
    end   

end
endmodule 


