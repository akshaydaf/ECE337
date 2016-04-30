// $Id: $
// File name:   tb_decode.sv
// Created:     9/2/2013
// Author:      Akshay Daftardar
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Decode Block

module tb_decode();
	timeunit 1ns;
	reg clk;
	reg n_rst;
	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;
	reg tb_d_orig;
	decode DEC(.clk(clk), .n_rst(n_rst), .d_plus(tb_d_plus), .shift_enable(tb_shift_enable),.eop(tb_eop),.d_orig(tb_d_orig));
	always
	begin
		#3 clk = 1;
		#3 clk = 0;
	end
	initial
	begin
		//TEST CASE 1
		n_rst = 0;
		@(negedge clk)
		n_rst = 1;
		tb_shift_enable = 1;
		tb_eop = 0;	
		tb_d_plus = 0;
		@(negedge clk)
		@(negedge clk)
		tb_shift_enable = 0;
		tb_d_plus = 1;
		@(negedge clk)
		@(posedge clk)
		tb_shift_enable = 1;
		@(negedge clk)
		@(negedge clk)
		tb_shift_enable = 0;
		#10;
		//TEST CASE 2
		tb_eop = 0;
		tb_d_plus = 0;
		@(negedge clk)
		@(negedge clk)
		tb_shift_enable = 1;
		tb_d_plus = 1;
		@(negedge clk)
		//TEST CASE 3
		tb_eop = 1;
		@(negedge clk)
		#10;
	end
endmodule 
		
