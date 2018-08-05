`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:39:49 05/29/2016 
// Design Name: 
// Module Name:    InstructionDecoder 
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
module InstructionDecoder(
    input [3:0] instruction,
    output reg CLR,
    output reg En1,
    output reg En2,
    output reg En3,
    output reg S0,
    output reg [2:0] S1
    );
	 
	 always @(instruction) begin
	 
	   // Clear all registers
	   if (instruction == 0) begin
        CLR <= 1;
		  En1 <= 1;
		  En2 <= 1;
		  En3 <= 1;
      end		
		
		// Move 8-bit num to register 1 (R1)
		else if (instruction == 1) begin
		  CLR <= 0;
        En1 <= 1;
		  En2 <= 0;
		  En3 <= 0;
		end
		
		// Move 8-bit num to register 2 (R2)
		else if (instruction == 2) begin
        CLR <= 0;
		  En1 <= 0;
		  En2 <= 1;
		  En3 <= 0;
		  S0 <= 0;
		end
		
		// Move 8-bit output to R2
		else if (instruction == 3) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 1;
		  En3 <= 0;
		  S0 <= 1;
		end
		
		// Perform sum operation and store in Rout
		else if (instruction == 4) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 1; 
		  S1[2] <= 0;
		  S1[1] <= 0;
		  S1[0] <= 0;
		end
		
		// Left shift 8-bit num in R2 
		else if (instruction == 5) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 1; 
		  S1[0] <= 1;
		  S1[1] <= 0;
		  S1[2] <= 0;
		end
		
		// Right shift 8-bit num in R2
		else if (instruction == 6) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 1; 
		  S1[0] <= 0;
		  S1[1] <= 1;
		  S1[2] <= 0;
		end
		
		// Perform AND operation and store in Rout
		else if (instruction == 7) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 1; 
		  S1[0] <= 1;
		  S1[1] <= 1;
		  S1[2] <= 0;
		end
		
		// Perform ORR operation and store in Rout
		else if (instruction == 8) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 1; 
		  S1[0] <= 0;
		  S1[1] <= 0;
		  S1[2] <= 1;
		end
	 
	   // Compare 2 8-bit vals and store in Rout
	   else if (instruction == 9) begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 1; 
		  S1[0] <= 1;
		  S1[1] <= 0;
		  S1[2] <= 1;
		end
		
		// Ignore all other input binary combinations 
		else begin
		  CLR <= 0;
		  En1 <= 0;
		  En2 <= 0;
		  En3 <= 0;
		end
		
	 end


endmodule
