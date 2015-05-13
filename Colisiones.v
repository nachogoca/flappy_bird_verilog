`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:45 05/12/2015 
// Design Name: 
// Module Name:    Colisiones 
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
module Colisiones(
	input [9:0] tube1_x,
	input [9:0] tube1_y,
	input [9:0] tube2_x,
	input [9:0] tube2_y,
	input [9:0] tube3_x,
	input [9:0] tube3_y,
	input [9:0] bird_y,
	output reg loose
    );

always@(*)begin 
		if(tube1_x < 250 & tube1_x+100 > 225)begin 
			if(bird_y < tube1_y | bird_y +25 >tube1_y + 100)
				loose <= 1; 
			else
				loose <= 0; 
		end	else if(tube2_x < 250 & tube2_x+100 > 225)begin 
			if(bird_y < tube2_y | bird_y +25 >tube2_y + 100)
				loose <= 1; 
			else
				loose <= 0;  
		end	else if(tube3_x < 250 & tube3_x+100 > 225) begin 
			if(bird_y < tube3_y | bird_y +25 >tube3_y + 100)
				loose <= 1; 
			else
				loose <= 0;  
			end
		else if(bird_y <= 1)
			loose <= 1;
		else if(bird_y + 25 >= 479) 
			loose <= 1;
		else
			loose <= 0; 
end
		/*end	else if(tube1_x < 250 & bird_y < tube1_y)
			loose <= 1;
		else if(tube2_x < 250 & bird_y < tube2_y)
			loose <= 1;
		else if(tube3_x < 250 & bird_y < tube3_y)
			loose <= 1;
		*/

endmodule
