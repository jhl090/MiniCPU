`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:41 05/28/2016 
// Design Name: 
// Module Name:    Adder 
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
module Adder(
    input [7:0] num1,
    input [7:0] num2,
    output reg [8:0] SUM,
    output reg OV
    );
	 
	 always @(num1 or num2) begin
	   SUM <= num1 + num2;
		OV <= SUM[8]; 
    end

endmodule
