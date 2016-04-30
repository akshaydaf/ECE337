// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/28/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flex_stp_sr
module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg [NUM_BITS - 1:0] parallel_out
);
reg [NUM_BITS - 1: 0] next;
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		parallel_out <= '1;
	end
	else 
	begin
		parallel_out <= next;
	end		
end
always_comb
begin
	next = '0
	if (shift_enable == 0)
	begin
		next = parallel_out;
	end
	else 
	begin
		if (SHIFT_MSB == 1)
		begin
			next = {parallel_out[(NUM_BITS - 2):0], serial_in};
		end
		else
		begin
			next = {serial_in, parallel_out[(NUM_BITS - 1):1]};
		end
	end
end
endmodule 