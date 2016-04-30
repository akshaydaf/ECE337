// $Id: $
// File name:   decode.sv
// Created:     2/21/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: decode
module decode
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire shift_enable,
	input wire eop,
	output wire d_orig
);
reg next;
reg curr;
reg nextdplus;
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		curr <= 1;
		nextdplus <= 1;
	end
	else
	begin
		curr <= next;
		nextdplus <= d_plus;
	end
end

always_comb
begin
	next = curr;
	if (shift_enable)
	begin
		if (!eop)
		begin
			next = d_plus;
		end
		else
		begin
			next = 1;
		end
	end
	else
	begin
		next = curr;
	end
end
xnor DEC(d_orig, nextdplus, curr);
endmodule
				
