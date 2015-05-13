`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:53:56 05/07/2015 
// Design Name: 
// Module Name:    FSM_horizontal 
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
module FSM_horizontal
#(parameter DW=10)
(
    input clk,
    input enable,
    input rst,
    input [DW-1:0] h_conteo,
    output reg h_synch
    );


always@(posedge clk or negedge rst)
begin
	if(!rst)
		h_synch <= 1'b0;
	else if(enable)
	    if (( h_conteo < (10'd752)) && (h_conteo > (10'd656)) )
	      h_synch <= 1'b0;
	    else
	      h_synch <= 1'b1;
end
	


endmodule
