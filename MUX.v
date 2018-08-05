`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:57 05/28/2016 
// Design Name: 
// Module Name:    MUX 
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
module MUX(

    input [7:0] ADD, L_SHIFT, R_SHIFT, L_AND, L_OR, Comp,
    input [2:0] select,
    output reg [7:0] out
    );
	 
    always @(select) begin 
	   if (select == 0) out <= ADD; 
	   else if (select == 1) out <= L_SHIFT;
      else if (select == 2) out <= R_SHIFT;
	   else if (select == 3) out <= L_AND;
	   else if (select == 4) out <= L_OR;
	   else if (select == 5) out <= Comp; 
	   else out <= 8'bxxxxxxxx;  
	 end 
	 
 
endmodule
