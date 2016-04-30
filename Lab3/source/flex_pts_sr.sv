// $Id: $
// File name:   flex_pts_sr.sv
// Created:     1/31/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flex_pts_sr
module flex_pts_sr
#(
	NUM_BITS = 4,
	SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire load_enable,
	input reg [NUM_BITS - 1:0] parallel_in,
	output reg serial_out
);
reg [NUM_BITS - 1: 0] next = 4'b0;
reg [NUM_BITS - 1: 0] fin = 4'b0;
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		fin <= '1;
	end
	else 
	begin
		fin <= next;
	end		
end	
always_comb 
begin
	if (!load_enable)
	begin
		if(shift_enable == 1)
		begin
			if (SHIFT_MSB == 1)
			begin
				next = {fin[(NUM_BITS - 2):0], 1'b1};
			end
			else
			begin
				next = {1'b1, fin[(NUM_BITS - 1):1]};
			end
		end
		else 
		begin
			next = fin;
		end
	end
	else
	begin
		next = parallel_in;
	end
end

if (SHIFT_MSB == 1)
begin
	assign serial_out = fin[NUM_BITS - 1];
end
else
begin
	assign serial_out = fin[0];
end
endmodule
		