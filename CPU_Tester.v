`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:32 05/29/2016
// Design Name:   MiniCPU
// Module Name:   H:/140L/Lab4/CPU_Tester.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MiniCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_Tester;

	// Inputs
	reg [11:0] IN;
	reg CLK;

	// Outputs
	wire OVERFLOW;
	wire [7:0] RESULT;

	// Instantiate the Unit Under Test (UUT)
	MiniCPU uut (
		.IN(IN), 
		.CLK(CLK), 
		.OVERFLOW(OVERFLOW), 
		.RESULT(RESULT)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;

		// Wait 50 ns for global reset to finish
		#50;
		IN = 11'b00000000000;
   
		// Wait 50 ns for global reset to finish
		#50;
		IN = 11'b000111111111;
       
		// Wait 50 ns for global reset to finish
		#50;
		IN = 11'b00100000001;

		// Wait 50 ns for global reset to finish
		#50;
		IN = 11'b00110000000;
      
		// Wait 50 ns for global reset to finish
		#50;
		IN = 11'b01000000000;
        		

	end
	
	// Always run 'Clock' 
	always begin 
	  #7 CLK = ~CLK;
	end 
      
endmodule

