`timescale 1ns / 1ps

// This module creates the Counter Buffer that interfaces directly with the photon counter
// Each channel will create an instance of the counterBuffer.
// The parameters ts and t_int are adjustable, however, these will be modifiable through software in future versions. 

module counterBuffer
#(
parameter ts = 0.000001, 
parameter t_int = 0.01 //1 ms integration time
) 
(  
input fs_clk, //
input enable, //The enable line will be connected to the t_int timer
input photonCounter, //The TTL pulse directly from the photonCounter
output reg n //Defines the output register n 
);

//parameter ts = 0.000001;
parameter fs = 1/ts; //1,000 kHz Sampling Frequency
//parameter t_int = 0.01; //1 ms integration time
parameter sizeof_n = $rtoi($ceil(fs*t_int));

parameter sizeof_bufferAddress = $clog2(sizeof_n);

reg [3:0] currentCount = 4'b0;
reg [sizeof_n:0] countBuffer = 0;

always @ (enable) begin
    if (photonCounter == 1'b1) begin
        currentCount <= currentCount + 1;
    end
end

reg [sizeof_bufferAddress:0] bufferAddress = 1'b1;

always @ (posedge(fs_clk) or !enable) begin
    countBuffer[bufferAddress] = currentCount;
end

always @ (negedge(fs_clk)) begin //This method may clear some counts that occur in between the rising and falling edge of fs_clk
    bufferAddress <= bufferAddress + 1; //Increment the buffer Address for the next rising edge of fs_clk
    currentCount <= 0;
end

endmodule