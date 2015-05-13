`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:16 05/08/2015 
// Design Name: 
// Module Name:    tubery_array 
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
module tubery_array(
	input clk,
	input rst,
	input time_out,
	output en_counter,
	output [9:0] posX_tube1,
	output [9:0] posX_tube2,
	output [9:0] posX_tube3
    );

assign en_counter = 1;

reg[9:0] temp_posX_tube_1;
reg[9:0] temp_posX_tube_2;
reg[9:0] temp_posX_tube_3;

always @(posedge clk or negedge rst) begin
	if(!rst) begin
		temp_posX_tube_1 <= 100;
		temp_posX_tube_2 <= 320;
		temp_posX_tube_3 <= 540;
	end else if(time_out) begin 
		temp_posX_tube_1 <= temp_posX_tube_1 - 1;
		temp_posX_tube_2 <= temp_posX_tube_2 - 1;
		temp_posX_tube_3 <= temp_posX_tube_3 - 1;
		if(temp_posX_tube_1 <= 0) 	temp_posX_tube_1 <= 679;
		if(temp_posX_tube_2 <= 0) 	temp_posX_tube_2 <= 679;
		if(temp_posX_tube_3 <= 0) 	temp_posX_tube_3 <= 679;
	end
end


assign posX_tube1 = temp_posX_tube_1;
assign posX_tube2 = temp_posX_tube_2;
assign posX_tube3 = temp_posX_tube_3;

endmodule
