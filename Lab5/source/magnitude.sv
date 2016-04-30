// $Id: $
// File name:   magnitude.sv
// Created:     2/14/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: magnitude
module magnitude
(
	input wire [16:0] in,
	output wire [15:0] out
);
reg [16:0] in2;
assign in2 = (in[16] == 1) ? ~in[16:0] + 1'b1: in[16:0];
assign out = in2[15:0];
endmodule 

		
