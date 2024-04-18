`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 09:46:34 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk,reset,
input [63:0] PC_In,
output reg [63:0] PC_Out
);
initial
PC_Out=64'd0;
always @ (posedge clk or posedge reset)
begin
if (reset)
PC_Out=64'd0;
else
PC_Out=PC_In;
end
endmodule
