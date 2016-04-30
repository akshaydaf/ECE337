// $Id: $
// File name:   timer.sv
// Created:     2/7/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: timer
module timer
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output wire shift_strobe,
	output wire packet_done
);

reg [3:0] count1;
reg [3:0] count2;

flex_counter #(4) A10(.clk(clk),.n_rst(n_rst), .clear(packet_done),.count_enable(enable_timer), .rollover_val(4'd10), .count_out(count1), .rollover_flag(shift_strobe));
flex_counter #(4) A9(.clk(clk),.n_rst(n_rst), .clear(packet_done),.count_enable(shift_strobe), .rollover_val(4'd9), .count_out(count2), .rollover_flag(packet_done));
endmodule 
