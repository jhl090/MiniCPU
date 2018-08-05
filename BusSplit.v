`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:39 05/29/2016 
// Design Name: 
// Module Name:    BusSplit 
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
module BusSplit(
    input [11:0] Input,
    output [7:0] Out1,
    output [3:0] Out2
    );
	 
	 assign Out1 = Input[7:0];
	 assign Out2 = Input[11:8];

endmodule
