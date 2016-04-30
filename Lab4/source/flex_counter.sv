// $Id: $
// File name:   flex_counter.sv
// Created:     2/1/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flex_counter
module flex_counter
#(
	NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS - 1: 0] rollover_val,
	output reg [NUM_CNT_BITS - 1: 0] count_out,
	output reg rollover_flag
);
reg [NUM_CNT_BITS - 1: 0] count;
reg newflag;
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		count_out <= 0;
		rollover_flag <= 0;
	end
	else
	begin
		count_out <= count;
		rollover_flag <= newflag;
	end
end
always_comb
begin
	if (clear == 1)
	begin	
		count = 0;
	end
	else
	begin
		if (rollover_flag == 1 && count_enable == 1)
		begin
			count = 1;
		end
		else if (count_enable == 1 && !rollover_flag)
		begin
			count = count_out + 1;
		end
		else
		begin	
			count = count_out;
		end
	end
end
always_comb
begin
	if ((count == rollover_val) && count_enable == 1)
	begin
		newflag = 1;
	end
	else
	begin
		newflag = 0;
	end
end
endmodule 
