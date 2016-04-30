// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_adder_16bit
();
	// Define local parameters used by the test bench
	localparam NUM_INPUT_BITS			= 16;
	localparam NUM_OUTPUT_BITS		= NUM_INPUT_BITS + 1;
	localparam MAX_OUTPUT_BIT			= NUM_OUTPUT_BITS - 1;
	localparam NUM_TEST_BITS 			= (NUM_INPUT_BITS * 2) + 1;
	localparam MAX_TEST_BIT				= NUM_TEST_BITS - 1;
	localparam NUM_TEST_CASES 		= 2 ** NUM_TEST_BITS;
	localparam MAX_TEST_VALUE 		= NUM_TEST_CASES - 1;
	localparam TEST_A_BIT					= 0;
	localparam TEST_B_BIT					= NUM_INPUT_BITS;
	localparam TEST_CARRY_IN_BIT	= MAX_TEST_BIT;
	localparam TEST_SUM_BIT				= 16;
	localparam TEST_CARRY_OUT_BIT	= MAX_OUTPUT_BIT;
	localparam TEST_DELAY					= 10;
	
	// Declare Design Under Test (DUT) portmap signals
	reg	[15:0]tb_a;
	reg	[15:0]tb_b;
	reg	tb_carry_in;
	reg	[15:0]tb_sum;
	reg	tb_carry_out;
	
	// Declare test bench signals
	integer tb_test_case;
	reg [MAX_TEST_BIT:0] tb_test_inputs;
	reg [MAX_OUTPUT_BIT:0] tb_expected_outputs;
	reg no_match = 0;	
	// DUT port map
	adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	
	// Connect individual test input bits to a vector for easier testing
	//assign tb_a					= tb_test_inputs[15:0];
	//assign tb_b					= tb_test_inputs[31:16];
	//assign tb_carry_in	= tb_test_inputs[32];
	
	// Test bench process
	initial
	begin
		//TRIAL 1
		tb_a = 16'd0;
		tb_b = 16'd0;
		tb_carry_in = 1'b1;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
		end
		#(TEST_DELAY)
		//TRIAL 2
		tb_a = 16'd12000;
		tb_b = 16'd1;
		tb_carry_in = 1'b1;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
		end
		#(TEST_DELAY)
		//TRIAL 3
		tb_a = 16'd1;
		tb_b = 16'd13456;
		tb_carry_in = 1'b0;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
		end
		#(TEST_DELAY)
		//TRIAL 4
		tb_a = 16'd10000;
		tb_b = 16'd75000;
		tb_carry_in = 1'b1;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
		end
		#(TEST_DELAY)
		//TRIAL 5
		tb_a = 16'd10;
		tb_b = 16'd10;
		tb_carry_in = 1'b1;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
			#1;
		end
		#(TEST_DELAY);
		//TRIAL 6
		tb_a = 16'hffff;
		tb_b = 16'h0;
		tb_carry_in = 1'b0;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
			#1;
		end
		#(TEST_DELAY);
		//TRIAL 7
		tb_a = 16'h0;
		tb_b = 16'hffff;
		tb_carry_in = 1'b0;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
			#1;
		end
		#(TEST_DELAY);
		//TRIAL 8
		tb_a = 16'hffff;
		tb_b = 16'hffff;
		tb_carry_in = 1'b1;
		tb_expected_outputs= tb_a + tb_b + tb_carry_in;
		#(TEST_DELAY);
		if ((tb_sum[15:0] == tb_expected_outputs) && (tb_carry_out == 1'b0))
		begin
			$info ("Passed!\n");
		end
		else
		begin
			$error ("Failed!\n");
			no_match = 1;
			#1;
		end
		#(TEST_DELAY);
	end
	final
	begin
		if(NUM_TEST_CASES != tb_test_case)
		begin
			// Didn't run the test bench through all test cases
			$display("This test bench was not run long enough to execute all test cases. Please run this test bench for at least a total of %d ns", (NUM_TEST_CASES * TEST_DELAY));
		end
		else
		begin
			// Test bench was run to completion
			$display("This test bench has run to completion");
		end
	end
endmodule
