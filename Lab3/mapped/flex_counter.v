/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb  2 23:06:50 2016
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N23, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74;
  wire   [3:0] count;

  DFFSR \count_out_reg[0]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(count[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(count[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(count[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  NOR2X1 U42 ( .A(n41), .B(n42), .Y(N23) );
  NAND3X1 U43 ( .A(n43), .B(count_enable), .C(n44), .Y(n42) );
  MUX2X1 U44 ( .B(n45), .A(n46), .S(rollover_val[2]), .Y(n44) );
  XOR2X1 U45 ( .A(n47), .B(count[2]), .Y(n46) );
  NOR2X1 U46 ( .A(n48), .B(n49), .Y(n45) );
  XNOR2X1 U47 ( .A(n50), .B(count[1]), .Y(n43) );
  MUX2X1 U48 ( .B(n51), .A(n52), .S(count_out[1]), .Y(count[1]) );
  NAND2X1 U49 ( .A(n53), .B(n54), .Y(n52) );
  OAI21X1 U50 ( .A(n74), .B(n55), .C(n47), .Y(n50) );
  INVX1 U51 ( .A(rollover_val[1]), .Y(n55) );
  OR2X1 U52 ( .A(n56), .B(n57), .Y(n41) );
  OAI21X1 U53 ( .A(count[2]), .B(n58), .C(n59), .Y(n57) );
  XOR2X1 U54 ( .A(n60), .B(count[3]), .Y(n59) );
  MUX2X1 U55 ( .B(n61), .A(n62), .S(count_out[3]), .Y(count[3]) );
  OAI21X1 U56 ( .A(n63), .B(n64), .C(n53), .Y(n62) );
  NOR2X1 U57 ( .A(count_out[2]), .B(n65), .Y(n63) );
  NAND3X1 U58 ( .A(count_out[1]), .B(n66), .C(count_out[2]), .Y(n61) );
  NAND2X1 U59 ( .A(rollover_val[3]), .B(n58), .Y(n60) );
  INVX1 U60 ( .A(n49), .Y(count[2]) );
  MUX2X1 U61 ( .B(n67), .A(n68), .S(count_out[2]), .Y(n49) );
  AND2X1 U62 ( .A(n53), .B(n64), .Y(n68) );
  OAI21X1 U63 ( .A(count_out[1]), .B(n65), .C(n69), .Y(n64) );
  INVX1 U64 ( .A(n54), .Y(n69) );
  OAI21X1 U65 ( .A(count_out[0]), .B(n65), .C(count_enable), .Y(n54) );
  INVX1 U66 ( .A(n70), .Y(n65) );
  AND2X1 U67 ( .A(n66), .B(count_out[1]), .Y(n67) );
  INVX1 U68 ( .A(n51), .Y(n66) );
  NAND3X1 U69 ( .A(n70), .B(n53), .C(count_out[0]), .Y(n51) );
  OAI21X1 U70 ( .A(rollover_val[3]), .B(n58), .C(n71), .Y(n56) );
  XOR2X1 U71 ( .A(rollover_val[0]), .B(n74), .Y(n71) );
  AND2X1 U72 ( .A(n72), .B(n53), .Y(n74) );
  INVX1 U73 ( .A(clear), .Y(n53) );
  MUX2X1 U74 ( .B(n73), .A(n70), .S(count_out[0]), .Y(n72) );
  NOR2X1 U75 ( .A(rollover_flag), .B(n73), .Y(n70) );
  INVX1 U76 ( .A(count_enable), .Y(n73) );
  OR2X1 U77 ( .A(n47), .B(rollover_val[2]), .Y(n58) );
  INVX1 U78 ( .A(n48), .Y(n47) );
  NOR2X1 U79 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n48) );
endmodule

