`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:44 05/11/2015 
// Design Name: 
// Module Name:    movimiento_pajarito 
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
module movimiento_pajarito(
	input clk,
	input rst,
	input en_subiendo,
	input en_time_out,
	input pausa,
	output reg [9:0]posy
    );

always@(posedge clk, negedge rst) begin
	if(~rst) 	posy <= 150;
	else if(en_time_out)begin 
		if(pausa) posy <= posy;
		else if(en_subiendo) posy <= posy - 15;
		else posy <= posy + 2;
	end
	
end

endmodule
