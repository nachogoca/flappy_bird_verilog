`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:51 05/07/2015 
// Design Name: 
// Module Name:    top_module_VGA 
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
module top_module_VGA(
    input enable,
    input rst_asyn_la,
    input clk_50mhz,
    input pausa,
    input jump,
    output h_sync,
    output v_sync,
    output [7:0] rgb
    );
wire [9:0] x,y;

wire [9:0] posX_tube1;
wire [9:0] posX_tube2;
wire [9:0] posX_tube3;

wire [9:0] posY_bird;
wire en_subiendo_FSM_bird;

wire en_counter;
wire time_out;
wire en_counter_bird;

wire one_shot_jump;
wire time_out_bird;

wire time_out_edo_general;
wire en_counter_edo_general;
wire en_pause_from_edo_general;

wire loose;


VGA_controller controlador (
    .Enable_i(enable),
    .rst_i(rst_asyn_la), 
    .clk_i(clk_50mhz), 
    .x_o(x), 
    .y_o(y), 
    .v_sync_o(v_sync), 
    .h_sync_o(h_sync)
    );
	 
deco_color decodificador (
    .clk(clk_50mhz), 
    .reset(~rst_asyn_la), 
    .x(x), 
    .y(y), 
    .posX_tube1(posX_tube1),
    .posX_tube2(posX_tube2),
    .posX_tube3(posX_tube3),
    .pos_y_bird(posY_bird),
    .loose(loose),
    .r(rgb[2:0]),
    .g(rgb[5:3]),
    .b(rgb[7:6])
    );

FSM_estdo_del_juego estado_general (
    .clk(clk_50mhz), 
    .rst(~rst_asyn_la), 
    .jump(one_shot_jump), 
    .pausa(pausa), 
    .looser(loose), 
    .time_out(time_out_edo_general), 
    .en_pausa(en_pause_from_edo_general), 
    .en_counter(en_counter_edo_general)
    );

counter_with_comparison
#(.DW(27), .MAX(27'd100_000_000))
 counter_edo_general(
    .en(en_counter_edo_general), 
    .clk(clk_50mhz), 
    .rst(~rst_asyn_la), 
    .outCount(), 
    .comparison(time_out_edo_general)
    );

tubery_array tube_array (
    .clk(clk_50mhz), 
    .rst(!rst_asyn_la), 
    .time_out(time_out), 
    .en_counter(en_counter), 
    .posX_tube1(posX_tube1), 
    .posX_tube2(posX_tube2), 
    .posX_tube3(posX_tube3)
    );

counter_with_comparison
#(.DW(21), .MAX(21'd1_250_000))
 Contador_horizontal(
    .en(en_counter&(~en_pause_from_edo_general)), 
    .clk(clk_50mhz), 
    .rst(~rst_asyn_la), 
    .outCount(), 
    .comparison(time_out)
    );

//Debouncer for fsm, only one jump
// Instantiate the module
Debouncer debouncer_jump (
    .clk(clk_50mhz), 
    .rst(~rst_asyn_la), 
    .sw(jump), 
    .one_shot(one_shot_jump), 
    .sw_limpia()
    );

FSM_pajarito FSM_pajarito (
    .clk(clk_50mhz), 
    .rst(~rst_asyn_la), 
    .one_shot_button(one_shot_jump), 
    .time_out(time_out_bird), 
    .en_subiendo(en_subiendo_FSM_bird), 
    .en_counter(en_counter_bird)
    );

counter_with_comparison
#(.DW(22), .MAX(22'd2_500_000))
 counter_bird(
    .en(en_counter_bird), 
    .clk(clk_50mhz), 
    .rst(~rst_asyn_la), 
    .outCount(), 
    .comparison(time_out_bird)
    );

movimiento_pajarito mov_pajarito(
    .clk(clk_50mhz),
    .rst(~rst_asyn_la),
    .en_subiendo(en_subiendo_FSM_bird),
    .en_time_out(time_out),
    .pausa(en_pause_from_edo_general),
    .posy(posY_bird)
    );
endmodule
