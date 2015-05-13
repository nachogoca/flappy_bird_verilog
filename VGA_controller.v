`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:12 05/07/2015 
// Design Name: 
// Module Name:    VGA_controller 
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
module VGA_controller(
    input Enable_i,
    input rst_i,
    input clk_i,
	output [9:0] x_o,
	output [9:0] y_o,
    output v_sync_o,
    output h_sync_o
    );
wire clk_25_mhz;
wire enable_ver;	 
wire [9:0] x;
wire [9:0] y;
FSM_vertical Vertical (
    .clk(clk_i), 
    .enable(clk_25_mhz), 
    .rst(~rst_i), 
    .V_conteo(y), 
    .v_synch(v_sync_o)
    );

FSM_horizontal Horizontal (
    .clk(clk_i), 
    .enable(clk_25_mhz), 
    .rst(~rst_i), 
    .h_conteo(x), 
    .h_synch(h_sync_o)
    );

counter_with_comparison
#(.DW(10), .MAX(10'd800))
 Contador_horizontal(
    .en(clk_25_mhz), 
    .clk(clk_i), 
    .rst(~rst_i), 
    .outCount(x), 
    .comparison(enable_ver)
    );
	 
counter_with_comparison 
#(.DW(10), .MAX(10'd521))
Contador_vertical (
    .en(enable_ver), 
    .clk(clk_i), 
    .rst(~rst_i), 
    .outCount(y), 
    .comparison()
    );


ff_D_25_Mhz reloj_25_MHZ (
    .clk(clk_i), 
    .rst(!rst_i), 
    .enable_i(Enable_i), 
    .out_o(clk_25_mhz)
    );

assign x_o = x;
assign y_o = y;



endmodule
