`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:57 05/29/2016 
// Design Name: 
// Module Name:    MiniCPU 
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
module MiniCPU(
    input [11:0] IN,
    input CLK,
    output OVERFLOW,
    output [7:0] RESULT
    );
	 
	 wire [3:0] COMMAND;
	 wire [7:0] NUM, temp_result;
	 
	 wire temp_overflow; 
	 
	 BusSplit BS( .Input(IN), .Out1(NUM), .Out2(COMMAND) );
	 
	 Main_Module MAIN( .clock(CLK), .in(NUM), .command(COMMAND), .overflow(temp_overflow), .out(temp_result) ); 
	 
	 assign OVERFLOW = temp_overflow;
	 assign RESULT = temp_result; 


endmodule
