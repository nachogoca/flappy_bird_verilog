`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:11 04/14/2015 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer(
    input clk,
    input rst,
    input sw,
    output reg one_shot,
    output reg sw_limpia
    );


localparam bajo=0, alto=1, delay1=2, delay2=3;

reg en_count;
wire en_out;

reg [2:0] estado;

always @(posedge clk or negedge rst) 
begin
	if (!rst) 
		begin
			estado <= 0; // reset
		end
	else 
		case (estado)
			bajo: begin 					
					if(sw)begin
						estado<=delay1;
					end
					else begin
						estado<=bajo;
					end
				 end
			delay1: begin 
					if(en_out) begin
						estado<=alto;
					end	
					else begin
						estado<=delay1;
					end
				 end
			alto: begin
					if(~sw) begin
						estado<=delay2;
					end	
					else begin
						estado<=alto;
				    end					 
				end			
			delay2: begin
					if(en_out)
						estado<=bajo;				   
				   else begin
				   	estado<=delay2;
				   end
				   end
			default: estado <= bajo;
		endcase
end	

always @*
begin
	case(estado)
		bajo: begin 
				one_shot <='b0;
				sw_limpia <='b0;
				en_count<='b0;
			end
		delay1: begin 				
				sw_limpia <='b1;
				en_count<='b1;
				one_shot <= en_out;
			end
		alto: begin 
				one_shot <='b0;
				sw_limpia <='b1;
				en_count<='b0;
			end
		delay2: begin 
				one_shot <='b0;
				sw_limpia <='b0;
				en_count<='b1;
			end
		default: begin 
				one_shot <='b0;
				sw_limpia <='b0;
				en_count<='b0;
			end
	endcase
end



// genera la señal de fin_delay 
counter_with_comparison
#(.DW(21), .MAX(1500000))
Contador//NOMBRE
(
    .en(en_count),
    .clk(clk),
    .rst(rst),
    .outCount(),
    .comparison(en_out)
    );

endmodule
