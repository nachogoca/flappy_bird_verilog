`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:37 05/08/2015 
// Design Name: 
// Module Name:    tube_generator 
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
module tube_generator(
	input  [9:0] posX,
	input  [9:0] posY,
	output [9:0] x1,
	output reg [9:0] x2,
	output [9:0] y1,
	output [9:0] y2,
	output reg enable
    );
assign x1 = posX;
assign y1 = posY;
assign y2 = posY+100; 
always@(*)
begin
	if(posX+100>799)
		x2 <= 799;
	else
		x2 <= x1+100;
	if(posX==0) enable <= 1'b1;
	else 		enable <= 0;
end

endmodule
