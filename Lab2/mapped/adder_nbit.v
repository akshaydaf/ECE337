/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Jan 25 18:40:05 2016
/////////////////////////////////////////////////////////////


module adder_nbit ( a, b, carry_in, sum, overflow );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input carry_in;
  output overflow;

  tri   [3:0] a;
  tri   [3:0] b;
  tri   carry_in;
  tri   [3:0] sum;
  tri   overflow;
  tri   [3:1] carrys;

  adder_1bit \genblk1[0].IX  ( .a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(
        sum[0]), .carry_out(carrys[1]) );
  adder_1bit \genblk1[1].IX  ( .a(a[1]), .b(b[1]), .carry_in(carrys[1]), .sum(
        sum[1]), .carry_out(carrys[2]) );
  adder_1bit \genblk1[2].IX  ( .a(a[2]), .b(b[2]), .carry_in(carrys[2]), .sum(
        sum[2]), .carry_out(carrys[3]) );
  adder_1bit \genblk1[3].IX  ( .a(a[3]), .b(b[3]), .carry_in(carrys[3]), .sum(
        sum[3]), .carry_out(overflow) );
endmodule

