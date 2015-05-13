`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:47 05/11/2015 
// Design Name: 
// Module Name:    FSM_estdo_del_juego 
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
module FSM_estdo_del_juego(
	input clk,
	input rst,
	input jump,
	input pausa,
	input looser,
	input time_out,
	output reg en_pausa,
	output reg en_counter
    );

reg[1:0] CurrentState;
localparam[1:0] pause = 0, playing = 1, lose = 2;  
always@(posedge clk, negedge rst)begin
	if(!rst) CurrentState <= pause;
	else
		case (CurrentState)
			pause:begin
				if(jump==1&pausa==0)
					CurrentState <= playing;
			end
			playing:begin 
				if(pausa==1)
					CurrentState <= pause;
				else if(looser) begin
					CurrentState <= lose;
				end
			end
			lose:begin 
				if(time_out) begin
					CurrentState <= pause;
				end
			end
			default : CurrentState <= pause;
		endcase
end
always@(*)begin
	case (CurrentState)
		pause:begin 
			en_counter <= 0;
			en_pausa <= 1;
			
		end
		playing:begin 
			en_counter <= 0;
			en_pausa <= 0; 
			
		end
		lose:begin 
			en_counter <= 1;
			en_pausa <= 1;
			
		end
		default : begin
			en_counter <= 0;
			en_pausa <= 1;
			
		end
	endcase
end
endmodule
