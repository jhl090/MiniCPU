`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:57:40 05/30/2016
// Design Name:   Main_Module_1
// Module Name:   H:/140L/Lab4/Module_1_Tester.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Module_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Module_1_Tester;

	// Inputs
	reg clock;
	reg [7:0] in;
	reg [3:0] command;

	// Outputs
	wire [7:0] R1_out;
	wire [7:0] R2_out;

	// Instantiate the Unit Under Test (UUT)
	Main_Module_1 uut (
		.clock(clock), 
		.in(in), 
		.command(command), 
		.R1_out(R1_out), 
		.R2_out(R2_out)
	);

	initial begin
		// Initialize Inputs
		clock = 1; 
		command = 0;
		#10;
		
		in = 255;
		command = 1;
		#27;

      in = 1;	
		command = 2;
	   #27;
       
	end
	
	always begin
	  #5 clock = ~clock;
	end
      
endmodule

