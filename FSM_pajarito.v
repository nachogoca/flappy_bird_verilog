`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:02 05/11/2015 
// Design Name: 
// Module Name:    FSM_pajarito 
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
module FSM_pajarito(
	input clk,
	input rst,
	input one_shot_button,
	input time_out,
	output reg en_subiendo,
	output reg en_counter
    );

localparam fall = 0, up = 1;
reg CurrentState;

always@(posedge clk, negedge rst)begin
	if(!rst)	CurrentState <= fall;
	else
	case(CurrentState)
		fall: begin 
			if(one_shot_button)
				CurrentState <= up;
		end
		up: begin 
			if(time_out) begin
				CurrentState <= fall;
			end
		end
		default: CurrentState <= fall;
	endcase
end
always@(*)begin
	case(CurrentState)
		fall:begin
			en_subiendo <= 0;
			en_counter <= 0;
		end
		up: begin
			en_subiendo <= 1;
			en_counter <= 1;
		end
		default:begin 
			en_subiendo <= 0;
			en_counter <= 0;
		end
	endcase
end

endmodule
