// $Id: $
// File name:   edge_detect.sv
// Created:     2/21/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: edge_detect
module edge_detect
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	output reg d_edge
);
reg d_plus_old;
reg next_d_edge;
always_ff @(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		d_plus_old <= 1;
		d_edge <= 0;
	end
	else
	begin
		d_plus_old <= d_plus;
		d_edge <= next_d_edge;
	end
end
xor EDGE(next_d_edge, d_plus, d_plus_old);

endmodule 
	
