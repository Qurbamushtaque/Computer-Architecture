`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 09:53:17 PM
// Design Name: 
// Module Name: alu_cu
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

`timescale 1ns / 1ps


module alu_cu
(
input [1:0] ALUOp,
input [3:0] Funct,
output reg [3:0] Operation
);
always @ (ALUOp or Funct)
begin
case(ALUOp)
2'b00: Operation = 4'b0010;
2'b01: Operation = 4'b0110;
2'b10:
begin
case(Funct)
4'b0000: Operation = 4'b0010;
4'b1000: Operation = 4'b0110;
4'b0111: Operation = 4'b0000;
4'b0110: Operation = 4'b0001;
endcase
end
endcase
end
endmodule


