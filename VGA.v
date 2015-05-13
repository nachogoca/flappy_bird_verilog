`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:13 05/07/2015
// Design Name:   VGA_controller
// Module Name:   C:/HDL/VGA_practica/VGA.v
// Project Name:  VGA_practica
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA;

	// Inputs
	reg Enable_i;
	reg rst_i;
	reg clk_i;

	// Outputs
	wire [9:0] x_o;
	wire [9:0] y_o;
	wire v_sync_o;
	wire h_sync_o;

	// Instantiate the Unit Under Test (UUT)
	VGA_controller uut (
		.Enable_i(Enable_i), 
		.rst_i(rst_i), 
		.clk_i(clk_i), 
		.x_o(x_o), 
		.y_o(y_o), 
		.v_sync_o(v_sync_o), 
		.h_sync_o(h_sync_o)
	);

	initial begin
		// Initialize Inputs
		Enable_i = 1;
		rst_i = 0;
		clk_i = 0;
		#1 rst_i <= 1;
		#1 rst_i <= 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always
		#1 clk_i <= ~clk_i;
      
endmodule

