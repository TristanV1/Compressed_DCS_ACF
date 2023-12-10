`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 04:04:25 PM
// Design Name: 
// Module Name: photonCounterSampler
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


module photonCounterSampler(
input photonCounterIn,//The TTL pulse directly from the GPIO connected to the external Photon Counter module.
input fs_clk, //Sampling clock based on user-defined sampling frequency. Used to sample the counter.
input enable, //The enable line will be connected to the t_int timer.
output photonCounterSampleOut //Sampled Photon Counter.
    );
    
always @ (fs_clk) begin
    photonCounterSampleOut = photonCounterIn & enable; //Ensures that the Photon Counter is only sampled when the integration timer is ON and the fs_clk is ON.
end
endmodule
