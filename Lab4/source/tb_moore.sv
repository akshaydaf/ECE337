// $Id: $
// File name:   tb_moore.sv
// Created:     9/2/2013
// Author:      Akshay Daftardar
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: moore model test bench

module tb_moore ();
	timeunit 1ns;
	reg clk = 1;
	reg n_rst = 1;
	reg i;
	reg o;
	always
	begin
		#5 clk = 0;
		#5 clk = 1;
	end
	moore A1(.clk(clk),.n_rst(n_rst),.i(i),.o(o));
	initial
	begin
		//TEST CASE 1
		n_rst = 1'b0;
		i = 1'b1;
		#1;
		n_rst = 1'b1;
		@(posedge clk);
	 	i = 1'b1;
		@(posedge clk);
		@(posedge clk);
		if (o == 0)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Failed\n");
		end
		#10;

		//TEST CASE 2
		i = 1'b0;
		#1;
		n_rst = 1'b1;
		@(posedge clk);
		i = 1'b1;
		@(posedge clk);
		@(posedge clk);
		if (o == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		
		//TEST CASE 3
		i = 1'b1;
		#1;
		n_rst = 1'b1;
		@(posedge clk);
		@(posedge clk);
		if (o == 0)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		
		//TEST CASE 4
		i = 1'b0;
		#1;
		n_rst = 1'b1;
		@(posedge clk);
		i = 1'b1;
		@(posedge clk);
		@(posedge clk);
		if (o == 1)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
		
		//TEST CASE 5
		i = 1'b0;
		#1;
		n_rst = 1'b1;
		@(posedge clk);
		i = 1'b1;
		@(posedge clk);
		i = 1'b1;
		@(posedge clk);
		i = 1'b0;
		@(posedge clk);
		i = 1'b0;
		@(posedge clk);
		@(posedge clk);
		if (o == 0)
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error("Failed\n");
		end
		#10;
	end
endmodule
