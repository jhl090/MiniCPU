`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:34 05/29/2016 
// Design Name: 
// Module Name:    Main_Module 
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
module MiniCPU(
    input clock,
    input [11:0] in,
    output reg overflow,
    output reg [7:0] out
    );
	 
	 wire [3:0] command;
	 wire [7:0] NUM;
	 
	 //Bus Split to separate commands from data
	 BusSplit BS( .Input(in), .Out1(NUM), .Out2(command) );
	 
	 wire [7:0] R1_out, R2_in, R2_out, ROUT_in, Crit_path, 
               S_LSHIFT, S_RSHIFT, S_AND, S_OR, S_COMP;	 
	 wire [2:0] MUX3_sel;
	 wire [8:0] S_ADD;
	 
	 // Components of the main module: 
	 // Instruction decoder 
	 InstructionDecoder decoder( .instruction(command), .CLR(op1), .En1(op2), .En2(op3), 
	                     .En3(op4), .S0(op5), .S1(MUX3_sel) ); 
								
	 // Register 1, control 1st input to ALU 
	 Reg8bit R1( .num(NUM), .En(op2), .CLK(clock), .CLR(op1), .Rout(R1_out) ); 
	 
	 // 2 to 1 MUX to control input for Register 2
	 MUX2_1 MUX1( .in1(NUM), .in2(Crit_path), .s0(op5), .out(R2_in) ); 
	 
	 // Register 2, control 2nd input to ALU 
	 Reg8bit R2( .num(R2_in), .En(op3), .CLK(clock), .CLR(op1), .Rout(R2_out) ); 

    // ALU
	 ALU alu1( .input_1(R1_out), .input_2(R2_out), .ADD(S_ADD), .SHIFT_L(S_LSHIFT), 
	           .SHIFT_R(S_RSHIFT), .L_AND(S_AND), .L_OR(S_OR), .COMP(S_COMP),
				  .ALU_OV1(S_OV1), .ALU_OV2(S_OV2) ); 
	 	 
	 // 2 to 1 MUX to control OVERFLOW output
	 MUX_bin MUX2( .s0(S_OV1), .s1(S_OV2), .select(command[0]), .out(temp_overflow) );	
  
    // 8 to 1 MUX to control input for Register 3 (Rout)				  
	 MUX MUX3( .ADD(S_ADD[7:0]), .L_SHIFT(S_LSHIFT), .R_SHIFT(S_RSHIFT), 
	           .L_AND(S_AND), .L_OR(S_OR), .Comp(S_COMP), .select(MUX3_sel), .out(ROUT_in) );
				  
	 // Register 3, control output of Main_Module 
	 Reg8bit ROUT( .num(ROUT_in), .En(op4), .CLK(clock), .CLR(op1), .Rout(Crit_path) );
	 
				 
	 always @(posedge clock or in) begin
	   overflow <= temp_overflow;
	   out <= Crit_path;
    end 		
	  
endmodule
