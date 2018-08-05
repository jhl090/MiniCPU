`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:34:28 05/29/2016
// Design Name:   Main_Module
// Module Name:   H:/140L/Lab4/Main_Tester.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_Tester;

	// Inputs
	reg clock;
	reg [11:0] in;

	// Outputs
	wire overflow;
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	MiniCPU uut (
		.clock(clock), 
		.in(in), 
		.overflow(overflow), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clock = 1; 
		
		// Clear the two registers
		in = 12'b000000000000;
		#27;
		
		// R1 holds 7 
		in = 12'b000100000111;
		#27;
		
		// R2 holds 8
      in = 12'b001000001000;	
	   #27;
		
		
		// Rout = R1 + R2
		in = 12'b010000000000;
		#27;
		
		// Rout = R1 | R2 
		in = 12'b100000000000;
      #27; 		
		
		// Compare R1 and R2
		in = 12'b100100000000;
		#27; 
		
		// Rout = R2 << 1 
      in = 12'b010100000000; 
		#27;
		
	   // R2 = Rout 
		in = 12'b001100000000;
		#27;
		
		// Rout = R2 >> 1
		in = 12'b011000000000;
		#27;
		
		// Rout = R1 & R2
		in = 12'b011100000000; 
		#27;
		
		// Clear registers
		in = 12'b000000000000;
		#27;
		
		// R1 holds 135
		in = 12'b000110000111;
		#27;
		
		// R2 holds 136
      in = 12'b001010001000;	
	   #27;
		
		// Rout = R1 + R2
		in = 12'b010000000000;
		#27;
		
		// Rout = R2 << 1
      in = 12'b010100000000; 
		#27; 
		
	end
	
	always begin
	  #7 clock = ~clock;
	end
      
endmodule

