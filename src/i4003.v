`timescale 1ns / 1ps
//-------------------------------------------------------------------------------------
// Modelo del chip 4003 de la serie msc-4 de Intel.
// El chip es un registro de desplazamiento que se usaba como ampliación I/O del
// sistema msc-4.
//-------------------------------------------------------------------------------------
module i4003(
		input cp,
		input e,
		input data_in,
		output reg [9:0]q,
		output reg serial_out
 		 );

reg [9:0]shift;

always@(posedge cp)
	begin
		serial_out = shift[9];
		shift <= shift << 1;
		shift[0] <= data_in;
		if(e == 1)
			q <= shift;
	end
endmodule