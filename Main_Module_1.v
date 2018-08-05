`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:37 05/30/2016 
// Design Name: 
// Module Name:    Main_Module_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main_Module_1(
    input clock,
    input [7:0] in,
    input [3:0] command,
    output [7:0] R1_out,
    output [7:0] R2_out
    );

	 wire [2:0] MUX3_sel;
	 wire [7:0] R2_in, Crit_path;
	 
	 // Instruction decoder 
	 InstructionDecoder decoder( .instruction(command), .CLR(op1), .En1(op2), .En2(op3), 
	                             .En3(op4), .S0(op5), .S1(MUX3_sel) ); 
										  
	 // Register 1, control 1st input to ALU 
	 Reg8bit R1( .num(in), .En(op2), .CLK(clock), .CLR(op1), .Rout(R1_out) ); 
	 
	 // 2 to 1 MUX to control input for Register 2
	 MUX2_1 MUX1( .in1(in), .in2(Crit_path), .s0(op5), .out(R2_in) ); 
	 
	 // Register 2, control 2nd input to ALU 
	 Reg8bit R2( .num(R2_in), .En(op3), .CLK(clock), .CLR(op1), .Rout(R2_out) ); 

endmodule
