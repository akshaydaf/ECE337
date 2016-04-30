// $Id: $
// File name:   tb_flex_counter.sv
// Created:     9/2/2013
// Author:      Akshay Daftardar
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Flexible Parallel to Serial shift register test bench

module tb_flex_counter ();
	timeunit 1ns;
	localparam NUM_CNT_BITS = 4; 
	reg clk = 1;
	reg n_rst = 0;
	reg clear = 0;
	reg count_enable = 0;
	reg [NUM_CNT_BITS - 1: 0] rollover_val = '0;
	reg [NUM_CNT_BITS - 1: 0] count_out = '0;
	reg rollover_flag = 0;
	reg [NUM_CNT_BITS - 1: 0] expected = '0;
	always
	begin
		#5 clk = 1;
		#5 clk = 0;
	end
	flex_counter A1 (.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(count_enable), .rollover_val(rollover_val), .count_out(count_out), .rollover_flag(rollover_flag));

	initial
	begin
		//TEST CASE 1
		@(posedge clk)
		count_enable = 0;
		n_rst = 0;
		clear = 0;
		rollover_val[NUM_CNT_BITS - 1:0] = 1100;
		expected[NUM_CNT_BITS - 1:0] = 0000;

		if (count_out == expected)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		n_rst = 0;
		//TEST CASE 2
		#2
		@(posedge clk)
		count_enable = 1;
		n_rst = 1;	
		clear = 0;
		rollover_val[NUM_CNT_BITS - 1:0] = 1100;
		expected[NUM_CNT_BITS - 1:0] = 1011;
		#(1000);
       		if (expected == count_out)
		begin
			$info("Passed!\n");
		   
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		n_rst = 0;
		//TEST CASE 3
		#0.1
		@(posedge clk)
		count_enable = 1;
		n_rst = 1;	
		clear = 1;
		rollover_val[NUM_CNT_BITS - 1:0] = 1111;
		expected[NUM_CNT_BITS - 1:0] = 1111;
		#(10);
       		if (expected == count_out)
		begin
			$info("Passed!\n");
		   
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		n_rst = 0;
		//TEST CASE 4
		#0.1
		@(posedge clk)
		count_enable = 1;
		n_rst = 1;	
		clear = 0;
		rollover_val[NUM_CNT_BITS - 1:0] = 0001;
		expected[NUM_CNT_BITS - 1:0] = 0001;
		clear = 1;
		#(10);
       		if (0 == count_out)
		begin
			$info("Passed!\n");
		   
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		n_rst = 0;
	end
endmodule 
