`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:58 05/29/2016 
// Design Name: 
// Module Name:    MUX_bin 
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
module MUX_bin(
    input s0,
    input s1,
    input select,
    output reg out
    );
	 
    always @(s0 or s1 or select) begin
	   if (select) out <= s1; 
		else out <= s0; 
	 end

endmodule
