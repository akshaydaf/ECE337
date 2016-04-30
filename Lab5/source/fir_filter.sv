// $Id: $
// File name:   fir_filter.sv
// Created:     2/14/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: fir_filter
module fir_filter
(
	input wire clk,
	input wire n_reset,
	input wire [15:0] sample_data,
	input wire [15:0] fir_coefficient,
	input wire load_coeff,
	input wire data_ready,
	output wire one_k_samples,
	output wire modwait,
	output wire [15:0] fir_out,
	output wire err
);
reg dr; 
reg lc;
reg overflow;
reg cnt_up;
reg clear; 
reg [2:0] op;
reg [3:0] src1;
reg [3:0] src2;
reg [3:0] dest;
reg [16:0] outreg_data;
sync SYNC(.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(dr));
sync SYNC2(.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(lc));
controller CONTROL(.clk(clk), .n_reset(n_reset), .dr(dr), .lc(lc), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err));
datapath DATA(.clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(overflow));
counter COUNT(.clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), .clear(clear), .one_k_samples(one_k_samples));
magnitude MAG(.in(outreg_data), .out(fir_out));
endmodule 
