`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:44 04/30/2015 
// Design Name: 
// Module Name:    FSM_vertical 
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
module FSM_vertical
#(parameter DW=10)
(
    input clk,
    input enable,
    input rst,
    input [DW-1:0] V_conteo,
    output reg v_synch
    );


always@(posedge clk or negedge rst)
begin
	if(!rst)
		v_synch <= 1'b0;
	else if(enable)
		    if (( V_conteo < 10'd492 ) && ( V_conteo > 10'd490 )) 
			      v_synch <= 1'b0;
			else
			      v_synch <= 1'b1;
end

endmodule
