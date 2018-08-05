`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:19 05/28/2016 
// Design Name: 
// Module Name:    ALU 
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
 module ALU(
    input [7:0] input_1,
    input [7:0] input_2,
    output [8:0] ADD,
    output [7:0] SHIFT_L,
    output [7:0] SHIFT_R,
    output [7:0] L_AND,
    output [7:0] L_OR,
    output [7:0] COMP,
	 output ALU_OV1,
	 output ALU_OV2
    );
	 
	 wire[8:0] tempSum; 
	 wire[7:0] tempOut_1, tempOut_2, tempOut_3; 
	 
	 
	 Adder op1( .num1( input_1 ), .num2( input_2 ), .SUM( tempSum ), .OV( ALU_OV1 ) );
	 Shift_Left op2( .num( input_2 ), .out( tempOut_1 ), .OV(  ALU_OV2) );
	 Shift_Right op3( .num( input_2 ), .out( tempOut_2 ) );
	 Comparator op4( .num1( input_1 ), .num2( input_2 ), .out( tempOut_3 ) ); 
	 
	 assign ADD = tempSum;
	 assign SHIFT_L = tempOut_1;
	 assign SHIFT_R = tempOut_2;
	 assign COMP = tempOut_3; 
	 
	 assign L_AND = input_1 & input_2;
	 assign L_OR = input_1 | input_2; 

    

endmodule
