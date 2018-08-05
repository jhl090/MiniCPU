`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:34 05/28/2016 
// Design Name: 
// Module Name:    Comparator 
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
module Comparator(
    input [7:0] num1,
    input [7:0] num2,
    output reg [7:0] out
    );

    reg[7:0] tempOut;
	   
    always @(num1 or num2) begin
	   if (num1 == num2) out <= 0;
	   else if (num1 > num2) out <= 1;
		else out <= 255;
	 end

endmodule
