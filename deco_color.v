`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:46 05/07/2015 
// Design Name: 
// Module Name:    deco_color 
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
module deco_color(
	input clk,
	input reset,
    input [9:0] x,
    input [9:0] y,
    input [9:0] posX_tube1,
    input [9:0] posX_tube2,
    input [9:0] posX_tube3,
    input [9:0] pos_y_bird,
    output loose,
    output reg [2:0]r,
    output reg [2:0]g,
    output reg [1:0]b
    );
//tueberia 1
wire [9:0] tub_1_x1;
wire [9:0] tub_1_x2;
wire [9:0] tub_1_y1;
wire [9:0] tub_1_y2;
wire enable_1;
wire [9:0] posY_1;
//tuberia 2
wire [9:0] tub_2_x1;
wire [9:0] tub_2_x2;
wire [9:0] tub_2_y1;
wire [9:0] tub_2_y2;
wire enable_2;
wire [9:0] posY_2;
//tuberia 3
wire [9:0] tub_3_x1;
wire [9:0] tub_3_x2;
wire [9:0] tub_3_y1;
wire [9:0] tub_3_y2;
wire enable_3;
wire [9:0] posY_3;

always@(*)
begin
	if(x>225 & x < 250 & y > pos_y_bird &  y < pos_y_bird + 25  )begin
		r <= 3'd5;	g <= 3'd5;	b <= 2'd3;
	end
	else
		if(x>tub_1_x1 & x < tub_1_x2  ) 
		begin
			if(y > tub_1_y1 & y < tub_1_y2)	begin
				r <= 3'd0;	g <= 3'd5;	b <= 2'd3;
			end else begin
				r <= 3'd0;	g <= 3'd7;	b <= 2'd0;
			end
		end	
		else if(x>tub_2_x1 & x < tub_2_x2  ) 
		begin
			if(y > tub_2_y1 & y < tub_2_y2)	begin
				r <= 3'd0; 	g <= 3'd5;	b <= 2'd3;
			end	else begin
				r <= 3'd0;	g <= 3'd7;	b <= 2'd0;
			end
		end	
		else if(x>tub_3_x1 & x < tub_3_x2  ) 
		begin
			if(y > tub_3_y1 & y < tub_3_y2)	begin
				r <= 3'd0;	g <= 3'd5;	b <= 2'd3;
			end else begin
				r <= 3'd0;	g <= 3'd7;	b <= 2'd0;
			end
		end	
		else begin
			r <= 3'd0;	g <= 3'd5;	b <= 2'd3;
		end
end
Colisiones colisiones(
	.tube1_x(tub_1_x1),
	.tube1_y(tub_1_y1),
	.tube2_x(tub_2_x1),
	.tube2_y(tub_2_y1),
	.tube3_x(tub_3_x1),
	.tube3_y(tub_3_y1),
	.bird_y(pos_y_bird),
	.loose(loose)
    );

tube_generator tubo1(
    .posX(posX_tube1),
    .posY(posY_1), 
    .x1(tub_1_x1), 
    .x2(tub_1_x2), 
    .y1(tub_1_y1), 
    .y2(tub_1_y2),
    .enable(enable_1)
    );

tube_generator tubo2 (
    .posX(posX_tube2), 
    .posY(posY_2), 
    .x1(tub_2_x1), 
    .x2(tub_2_x2), 
    .y1(tub_2_y1), 
    .y2(tub_2_y2),
    .enable(enable_2)
    );

tube_generator tubo3 (
    .posX(posX_tube3), 
    .posY(posY_3), 
    .x1(tub_3_x1), 
    .x2(tub_3_x2), 
    .y1(tub_3_y1), 
    .y2(tub_3_y2), 
    .enable(enable_3)
    );

random1 random_1 (
    .clock(clk), 
    .reset(reset), 
    .enable(enable_1), 
    .rnd(posY_1)
    );

random2 random_2 (
    .clock(clk), 
    .reset(reset), 
    .enable(enable_2), 
    .rnd(posY_2)
    );

random3 random_3(
    .clock(clk), 
    .reset(reset), 
    .enable(enable_3), 
    .rnd(posY_3)
    );

/*tube_generator tubo4 (
    .posX(posX), 
    .posY(posY), 
    .x1(x1), 
    .x2(x2), 
    .y1(y1), 
    .y2(y2)
    );
*/

endmodule
