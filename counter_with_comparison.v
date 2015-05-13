`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:49 03/20/2015 
// Design Name: 
// Module Name:    counter_with_comparison 
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
module counter_with_comparison
#(parameter DW = 2, MAX=4'd4)
	(
    input en,
    input clk,
    input rst,
    output reg [DW-1:0] outCount,
    output reg comparison
    );

reg [DW-1:0] next_value; //Siguiente valor al flip-flop
reg bandera_comparador;

reg[DW-1:0] valor_a_ff;


//Circuito combinaciona l
always @*
begin
	next_value 			<= outCount + 1'b1;
	bandera_comparador 	<= outCount >= (MAX - 1'b1); //Regresa valor de la comparación
	comparison 				<= bandera_comparador & en;
	if (bandera_comparador) //Si se pasa del límite, manda a cero.
		valor_a_ff <= 0;
	else
		valor_a_ff <= next_value; 
end

//Circuito secuencial
always @(posedge clk ) 
begin
	if(~rst) //
		outCount <= 0;
 	else if(en)
		outCount <= valor_a_ff;
end


endmodule
