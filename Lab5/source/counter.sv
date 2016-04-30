// $Id: $
// File name:   counter.sv
// Created:     2/14/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: counter
module counter
(
	input wire clk,
	input wire n_reset,
	input wire cnt_up,
	input wire clear,
	output wire one_k_samples
);
reg [9:0] count_out; 
flex_counter #(10) COUNTER(.clk(clk), .n_rst(n_reset), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .count_out(count_out), .rollover_flag(one_k_samples));
endmodule 