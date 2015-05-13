`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:47:06 05/08/2015
// Design Name:   random
// Module Name:   C:/HDL/VGA_practica/tb_random.v
// Project Name:  VGA_practica
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_random;

	// Inputs
	reg clock;
	reg reset;
	reg enable;

	// Outputs
	wire [7:0] rnd;

	// Instantiate the Unit Under Test (UUT)
	random uut (
		.clock(clock), 
		.reset(reset), 
		.enable(enable), 
		.rnd(rnd)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		enable = 1;

		#1 reset = 0;
		#1 reset = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
always begin 
	#1 clock = ~clock;
end

endmodule

