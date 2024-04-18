`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 09:55:51 PM
// Design Name: 
// Module Name: RISC_V_Processor
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



module RISC_V_processor(
input clk,
input reset,
output wire [63:0] pc_out,
output wire [63:0] adder1_out,
output wire [63:0] adder2_out,
output wire [63:0] pc_in,
//output wire branch,
output wire zero,
output wire [31:0] instruction,
output wire [6:0] opcode,
output wire [4:0] rd,
output wire [2:0] funct3,
output wire [4:0] rs1,
output wire [4:0] rs2,
output wire [6:0] funct7,
output wire [63:0]writedata,
//output wire regwrite,
output wire [63:0]readdata1,
output wire [63:0]readdata2,
output wire branch, memread, memtoreg, memwrite, alusrc, regwrite,
output wire [1:0] aluop,
output wire [63:0] immdata,
output wire [63:0] mux2out,
output wire [3:0] operation,
output wire [63:0] aluout,
output wire [63:0] datamemoryreaddata,
output wire [63:0] element1,
  output wire [63:0] element2,
  output wire [63:0] element3,
  output wire [63:0] element4,
  output wire [63:0] element5,
  output wire [63:0] element6,
  output wire [63:0] element7,
  output wire [63:0] element8
    );

wire branch_finale;
wire [3:0] funct;    
    
    
adder a1(pc_out, 64'd4, adder1_out);
Mux m1(adder1_out, adder2_out,(branch&&branch_finale) , pc_in);
program_counter pc(clk, reset, pc_in,pc_out);
Instruction_Memory im(pc_out, instruction);
inst_parser ip(instruction, opcode, rd, funct3, rs1, rs2, funct7);
 Control_Unit cu(opcode, branch, memread, memtoreg, memwrite, alusrc, regwrite, aluop);
register_file rf(writedata, rs1, rs2, rd, regwrite, clk, reset, readdata1, readdata2);
immediate_gen imm_gen(instruction, immdata);
Mux m2(readdata2, immdata, alusrc, mux2out);
assign funct = {instruction[30], instruction[14:12]};
alu_cu alu_c(aluop, funct, operation);
adder a2(pc_out, immdata*2, adder2_out);
alu_64bit alu(readdata1, mux2out, operation, aluout, zero);
data_memory dm(aluout, readdata2, clk, memwrite, memread, datamemoryreaddata,element1,element2,element3,element4,element5,element6,element7,element8);
Mux m3(aluout, datamemoryreaddata, memtoreg, writedata);
branch bu(funct3, readdata1, mux2out, branch_finale);
endmodule
