// $Id: $
// File name:   adder_1bit.sv
// Created:     1/24/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: adder_1bit
`timescale 1ns / 100ps
module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);
	xor (sum,a, b, carry_in);
	assign carry_out = (!carry_in & b & a) || (carry_in & (b || a));
	always @ (a, b, carry_in)
	begin
		assert((a == 1'b1) || (a == 1'b0))
		else $error("Input 'a' of component is not a digital logic value");
		assert((b == 1'b1) || (b == 1'b0))
		else $error("Input 'b' of component is not a digital logic value");
		assert((carry_in == 1'b1) || (carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value");
	end
	always @ (a,b, carry_in)
	begin
		#(2) assert(((a + b + carry_in) % 2) == sum) 
		else $error("Output 's' of first 1 bit adder is not correct");
		#(2) assert(((a + b + carry_in) / 2) == carry_out)
		else $error("Output 'c_o' of first 1 bit adder is not correct");
	end
endmodule 
	