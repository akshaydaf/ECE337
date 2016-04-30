// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     9/2/2013
// Author:      Akshay Daftardar
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: fifo queue block

module tb_decode();
	timeunit 1ns;
	reg clk;
	reg n_rst;
	reg tb_r_enable;
	reg tb_w_enable;
	reg tb_w_data;
	reg tb_r_data;
	reg tb_empty;
	reg tb_full;
	rx_fifo(.clk(clk),.n_rst(n_rst),.r_enable(tb_r_enable),.w_enable(tb_w_enable),.w_data(tb_w_data), .r_data(tb_r_data), .empty(tb_empty), .full(tb_full));
);
	always
	begin
		#3 clk = 1;
		#3 clk = 0;
	end
endmodule
