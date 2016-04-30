// $Id: $
// File name:   posedge_detect.sv
// Created:     2/29/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: posedge_detect
module posedge_detect
(
	input wire clk,
	input wire n_rst,
	input wire flag2,
	output reg byte_received
);
reg flag_new;
reg flag_old;
always_ff @(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		flag_new <= 0;
		flag_old <= 0;
	end
	else
	begin
		flag_new <= flag2;
		flag_old <= flag_new;
	end
end
and EDGE(byte_received, flag_new, !flag_old);
endmodule 