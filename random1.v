`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:21 05/08/2015 
// Design Name: 
// Module Name:    random 
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
module random1(
	input clock,
    input reset,
    input enable,
    output [7:0] rnd
    );


 
reg [7:0] random, random_done;
reg [3:0] count; //to keep track of the shifts

wire feedback = random[7] ^random[6] ^ random[2] ^ random[1];

/*
always @ (posedge clock or posedge reset) begin
	if (reset) begin
		random <= 8'hF; //An LFSR cannot have an all 0 state, thus reset to FF
		count <= 0;
	end  else begin
		random <= random_next;
		count <= count_next;
	end
end
 
always @ (*)begin
 	//random_next = random; //default state stays the same
 	//count_next = count;
   
  	random_next = {random[6:0], feedback}; //shift left the xor'd every posedge clock
  	count_next = count + 1;
	 
	if (count == 8)  begin
	  	count = 0;
	  	random_done = random; //assign the random number to output after 8 shifts
	end
end*/

always @ (posedge clock or negedge reset) begin
	if (!reset) begin
		random <= 8'd200; //An LFSR cannot have an all 0 state, thus reset to FF
		count <= 0;
	end  else if(enable) begin
		random <= {random[6:0], feedback};
		count <= count + 1;

		if (count == 8)  begin
	  		count <= 0;
	  		random_done <= random; //assign the random number to output after 8 shifts
		end
	end
end
 
assign rnd = random_done;
 
endmodule