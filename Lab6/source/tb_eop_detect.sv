// $Id: $
// File name:   tb_eop_detect.sv
// Created:     9/2/2013
// Author:      Akshay Daftardar
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: End of packet detect

module tb_eop_detect();
	timeunit 1ns;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_eop;
	eop_detect EOP(.d_plus(tb_d_plus),.d_minus(tb_d_minus),.eop(tb_eop));
	initial
	begin
		//TEST CASE 1
		tb_d_plus = 1;	
		tb_d_minus = 1;
		#1;
		if (tb_eop == 0)
		begin
			$info("Passed!\n");
		end
		else
		begin
			$info("Error\n");
		end
		#10;
		//TEST CASE 2
		tb_d_plus = 1;	
		tb_d_minus = 0;
		if (tb_eop == 0)
		begin
			$info("Passed!\n");
		end
		else
		begin
			$info("Error\n");
		end
		#10;
		//TEST CASE 3
		tb_d_plus = 0;	
		tb_d_minus = 1;
		if (tb_eop == 0)
		begin
			$info("Passed!\n");
		end
		else
		begin
			$info("Error\n");
		end
		#10;
		//TEST CASE 4
		tb_d_plus = 0;	
		tb_d_minus = 0;
		#1;
		if (tb_eop == 1)
		begin
			$info("Passed!\n");
		end
		else
		begin
			$info("Error\n");
		end
		#10;
	end
endmodule
