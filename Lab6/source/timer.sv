// $Id: $
// File name:   timer.sv
// Created:     2/27/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: timer
module timer
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire rcving,
	output wire shift_enable,
	output wire byte_received
);

reg flag;
reg [3:0] count1;
reg [3:0] count2; 
flex_counter #(4) FLEX(.clk(clk), .n_rst(n_rst), .clear(d_edge || !rcving), .count_enable(rcving), .rollover_val(4'd8), .count_out(count1), .rollover_flag(flag));
flex_counter #(4) FLEX2(.clk(clk), .n_rst(n_rst), .clear(byte_received || !rcving), .count_enable(shift_enable), .rollover_val(4'd8), .count_out(count2), .rollover_flag(byte_received));

assign shift_enable = (count1 == 3)? 1:0;
endmodule 
	
