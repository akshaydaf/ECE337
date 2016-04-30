// $Id: $
// File name:   sr_9bit.sv
// Created:     2/6/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sr_9bit
module sr_9bit
(
	input wire clk,
	input wire n_rst,
	input wire shift_strobe,
	input wire serial_in,
	output wire [7:0]packet_data,
	output wire stop_bit
);

reg [8:0] store;
flex_stp_sr #(9,0) A2(.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out(store));
assign stop_bit = store[8];
assign packet_data = store[7:0];
endmodule 
