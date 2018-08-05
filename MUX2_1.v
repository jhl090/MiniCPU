`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:34 05/28/2016 
// Design Name: 
// Module Name:    MUX2_1 
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
module MUX2_1(
    input [7:0] in1,
    input [7:0] in2,
    input s0,
    output reg [7:0] out
    ); 

    always @(in1 or in2 or s0) begin
	   if (s0) out <= in2; 
		else out <= in1; 
	 end


endmodule
