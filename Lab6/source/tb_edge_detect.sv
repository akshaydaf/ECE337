// $Id: $
// File name:   tb_edge_detect.sv
// Created:     9/2/2013
// Author:      Akshay Daftardar
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Edge detect

module tb_edge_detect();
	timeunit 1ns;
	reg tb_d_plus;
	reg clk;
	reg n_rst;
	reg tb_d_edge;
	always
	begin
		#3 clk = 1;
		#3 clk = 0;
	end
	edge_detect EDGE(.clk(clk), .n_rst(n_rst), .d_plus(tb_d_plus), .d_edge(tb_d_edge));
	initial
	begin
		//TEST CASE 1
		n_rst = 0;
		@(negedge clk)
		n_rst = 1;
		tb_d_plus = 0;
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		tb_d_plus = 1;
		@(posedge clk)
		#1;
		if (tb_d_edge == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Error\n");
		end
		#10;
		//TEST CASE 2
		n_rst = 0;	
		@(negedge clk)
		n_rst = 1;
		tb_d_plus = 1;
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		tb_d_plus = 0;
		@(posedge clk)
		#1;
		if(tb_d_edge == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Error\n");
		end
		//TEST CASE 4
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		tb_d_plus = 1;
		@(posedge clk)
		#1;
		if(tb_d_edge == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Error\n");
		end	
		#10;
		//TEST CASE 4
		@(negedge clk)
		tb_d_plus = 0;
		@(posedge clk)
		#1;
		if (tb_d_edge == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Error\n");
		end	
		//TEST CASE 5
		@(negedge clk)		
		tb_d_plus = 1;
		@(posedge clk)
		#1;
		if (tb_d_edge == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Error\n");
		end	 
	end
endmodule
		
		
