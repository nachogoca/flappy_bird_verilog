`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:14 04/30/2015 
// Design Name: 
// Module Name:    ff_D_25_Mhz 
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
module ff_D_25_Mhz(
    input clk,
    input rst,
    input enable_i,
    output reg out_o
    );
always@(posedge clk, negedge rst)
begin
	if(!rst)
		out_o <= 0;
	else if(enable_i)
		out_o<=~out_o;
end

endmodule
