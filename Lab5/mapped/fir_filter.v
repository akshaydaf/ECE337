/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 16 11:36:12 2016
/////////////////////////////////////////////////////////////


module sync_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   mid;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   mid;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n144, nextmod, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n40, n41, n42, n43, n44, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140;
  wire   [4:0] curr;
  wire   [4:0] next;
  assign src1[3] = 1'b0;

  DFFSR currmod_reg ( .D(nextmod), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        modwait) );
  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[0]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[2]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[1]) );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[3]) );
  DFFSR \curr_reg[4]  ( .D(next[4]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr[4]) );
  NAND2X1 U68 ( .A(n8), .B(n140), .Y(op[1]) );
  BUFX2 U3 ( .A(curr[2]), .Y(n51) );
  BUFX2 U4 ( .A(n51), .Y(n31) );
  INVX2 U5 ( .A(n10), .Y(n11) );
  INVX2 U6 ( .A(n51), .Y(n127) );
  INVX4 U7 ( .A(n144), .Y(n44) );
  AND2X2 U8 ( .A(n53), .B(n46), .Y(n37) );
  BUFX4 U9 ( .A(n4), .Y(n1) );
  AND2X2 U10 ( .A(n10), .B(n70), .Y(n2) );
  AND2X2 U11 ( .A(n92), .B(n93), .Y(n3) );
  NAND2X1 U12 ( .A(n37), .B(n11), .Y(n4) );
  AND2X2 U13 ( .A(n11), .B(curr[1]), .Y(n5) );
  AND2X1 U14 ( .A(n23), .B(n119), .Y(n6) );
  AND2X2 U15 ( .A(n123), .B(n107), .Y(n7) );
  AND2X2 U16 ( .A(n7), .B(n115), .Y(n8) );
  BUFX2 U17 ( .A(n121), .Y(n9) );
  INVX8 U18 ( .A(n44), .Y(src1[2]) );
  INVX2 U25 ( .A(curr[3]), .Y(n10) );
  OR2X2 U26 ( .A(n98), .B(n129), .Y(n12) );
  NAND2X1 U27 ( .A(n12), .B(n72), .Y(n87) );
  INVX1 U28 ( .A(n87), .Y(n88) );
  BUFX2 U29 ( .A(n46), .Y(n13) );
  INVX1 U30 ( .A(n40), .Y(n14) );
  INVX2 U31 ( .A(n14), .Y(n15) );
  AND2X2 U32 ( .A(n32), .B(n51), .Y(n22) );
  AND2X1 U33 ( .A(n32), .B(n51), .Y(n35) );
  AND2X2 U34 ( .A(n53), .B(n46), .Y(n32) );
  AND2X1 U35 ( .A(n1), .B(n119), .Y(n38) );
  NAND2X1 U36 ( .A(n40), .B(n5), .Y(n23) );
  NAND2X1 U37 ( .A(n91), .B(n3), .Y(next[1]) );
  NAND2X1 U38 ( .A(n40), .B(n5), .Y(n118) );
  INVX1 U39 ( .A(n53), .Y(n24) );
  AND2X2 U40 ( .A(n116), .B(n121), .Y(n25) );
  BUFX2 U41 ( .A(n116), .Y(n26) );
  BUFX2 U42 ( .A(n2), .Y(n27) );
  INVX1 U43 ( .A(n25), .Y(n28) );
  INVX2 U44 ( .A(n28), .Y(n29) );
  BUFX2 U45 ( .A(n43), .Y(n30) );
  INVX1 U46 ( .A(n112), .Y(n108) );
  INVX2 U47 ( .A(n139), .Y(n33) );
  INVX2 U48 ( .A(n139), .Y(n132) );
  INVX1 U49 ( .A(n33), .Y(n34) );
  INVX1 U50 ( .A(curr[4]), .Y(n53) );
  INVX1 U51 ( .A(n22), .Y(n80) );
  OR2X2 U52 ( .A(n46), .B(curr[4]), .Y(n139) );
  INVX2 U53 ( .A(n52), .Y(n36) );
  NAND2X1 U54 ( .A(n1), .B(n119), .Y(src2[2]) );
  AND2X1 U55 ( .A(n30), .B(n24), .Y(n41) );
  NAND2X1 U56 ( .A(n25), .B(n6), .Y(src1[0]) );
  AND2X2 U57 ( .A(n132), .B(n127), .Y(n40) );
  AND2X2 U58 ( .A(n24), .B(n27), .Y(n42) );
  AND2X2 U59 ( .A(curr[1]), .B(n10), .Y(n43) );
  INVX1 U60 ( .A(n1), .Y(n97) );
  INVX2 U61 ( .A(curr[0]), .Y(n46) );
  INVX1 U62 ( .A(n13), .Y(n47) );
  INVX1 U63 ( .A(n50), .Y(n48) );
  INVX1 U64 ( .A(n48), .Y(n49) );
  AND2X2 U65 ( .A(n93), .B(n118), .Y(n50) );
  INVX1 U66 ( .A(overflow), .Y(n65) );
  NAND3X1 U67 ( .A(n41), .B(n13), .C(n127), .Y(n110) );
  INVX2 U69 ( .A(curr[1]), .Y(n70) );
  NAND2X1 U70 ( .A(n42), .B(n13), .Y(n111) );
  NAND2X1 U71 ( .A(n110), .B(n111), .Y(dest[3]) );
  NAND2X1 U72 ( .A(n53), .B(n13), .Y(n52) );
  NAND3X1 U73 ( .A(n31), .B(n41), .C(n13), .Y(n115) );
  OAI21X1 U74 ( .A(n70), .B(n52), .C(n115), .Y(n56) );
  NAND3X1 U75 ( .A(n36), .B(n30), .C(n127), .Y(n122) );
  INVX2 U76 ( .A(dest[3]), .Y(n140) );
  NAND2X1 U77 ( .A(n22), .B(n43), .Y(n116) );
  NAND2X1 U78 ( .A(n35), .B(n2), .Y(n121) );
  NAND3X1 U79 ( .A(n122), .B(n140), .C(n29), .Y(n96) );
  INVX2 U80 ( .A(n96), .Y(n54) );
  NAND3X1 U81 ( .A(n33), .B(n31), .C(n2), .Y(n112) );
  NAND2X1 U82 ( .A(n40), .B(n43), .Y(n120) );
  NAND3X1 U83 ( .A(n54), .B(n112), .C(n120), .Y(n55) );
  OR2X1 U84 ( .A(n56), .B(n55), .Y(op[0]) );
  INVX2 U85 ( .A(lc), .Y(n76) );
  NAND3X1 U86 ( .A(n36), .B(n27), .C(n127), .Y(n59) );
  NAND2X1 U87 ( .A(n47), .B(n31), .Y(n124) );
  INVX2 U88 ( .A(n124), .Y(n57) );
  NAND2X1 U89 ( .A(n57), .B(n41), .Y(n98) );
  OAI21X1 U90 ( .A(n76), .B(n59), .C(n98), .Y(n63) );
  INVX2 U91 ( .A(dr), .Y(n138) );
  NAND2X1 U92 ( .A(n47), .B(n42), .Y(n82) );
  NAND3X1 U93 ( .A(n47), .B(n41), .C(n127), .Y(n75) );
  NAND3X1 U94 ( .A(n98), .B(n82), .C(n75), .Y(n58) );
  INVX2 U95 ( .A(n58), .Y(n100) );
  NOR2X1 U96 ( .A(op[0]), .B(n97), .Y(n61) );
  INVX2 U97 ( .A(n59), .Y(clear) );
  NOR2X1 U98 ( .A(n33), .B(clear), .Y(n60) );
  NAND3X1 U99 ( .A(n100), .B(n61), .C(n60), .Y(n62) );
  INVX2 U100 ( .A(n62), .Y(n102) );
  AOI21X1 U101 ( .A(n63), .B(n138), .C(n102), .Y(n64) );
  OAI21X1 U102 ( .A(n65), .B(n1), .C(n64), .Y(n69) );
  NAND2X1 U103 ( .A(n15), .B(n27), .Y(n107) );
  INVX2 U104 ( .A(n107), .Y(n66) );
  NAND2X1 U105 ( .A(n66), .B(n138), .Y(n104) );
  INVX2 U106 ( .A(n104), .Y(n73) );
  INVX2 U107 ( .A(n75), .Y(n84) );
  NOR2X1 U108 ( .A(n73), .B(n84), .Y(n67) );
  NAND3X1 U109 ( .A(n82), .B(n140), .C(n67), .Y(n68) );
  OR2X1 U110 ( .A(n69), .B(n68), .Y(next[4]) );
  NAND2X1 U111 ( .A(n138), .B(n76), .Y(n129) );
  NAND3X1 U112 ( .A(n11), .B(n132), .C(n70), .Y(n71) );
  INVX2 U113 ( .A(n71), .Y(n85) );
  NAND2X1 U114 ( .A(n85), .B(n31), .Y(n117) );
  NAND3X1 U115 ( .A(n112), .B(n116), .C(n117), .Y(n144) );
  AOI21X1 U116 ( .A(overflow), .B(n97), .C(src1[2]), .Y(n72) );
  NOR2X1 U117 ( .A(n73), .B(n87), .Y(n81) );
  OAI21X1 U118 ( .A(n42), .B(n102), .C(n31), .Y(n74) );
  OAI21X1 U119 ( .A(n76), .B(n75), .C(n74), .Y(n78) );
  NAND2X1 U120 ( .A(n120), .B(n23), .Y(n77) );
  NOR2X1 U121 ( .A(n78), .B(n77), .Y(n79) );
  NAND3X1 U122 ( .A(n81), .B(n80), .C(n79), .Y(next[2]) );
  INVX2 U123 ( .A(n82), .Y(n83) );
  MUX2X1 U124 ( .B(n84), .A(n83), .S(lc), .Y(n92) );
  NAND2X1 U125 ( .A(n127), .B(n85), .Y(n93) );
  OAI21X1 U126 ( .A(n36), .B(n102), .C(curr[1]), .Y(n86) );
  NAND2X1 U127 ( .A(n86), .B(n110), .Y(n90) );
  NAND2X1 U128 ( .A(n107), .B(n88), .Y(n89) );
  NOR2X1 U129 ( .A(n90), .B(n89), .Y(n91) );
  NAND2X1 U130 ( .A(n49), .B(n117), .Y(src2[3]) );
  NAND3X1 U131 ( .A(n31), .B(n43), .C(n33), .Y(n119) );
  INVX2 U132 ( .A(src2[3]), .Y(n94) );
  NAND2X1 U133 ( .A(n119), .B(n94), .Y(n106) );
  NOR2X1 U134 ( .A(n102), .B(n106), .Y(n95) );
  OAI21X1 U135 ( .A(overflow), .B(n1), .C(n95), .Y(next[3]) );
  NOR2X1 U136 ( .A(n97), .B(n96), .Y(n105) );
  INVX2 U137 ( .A(n98), .Y(err) );
  OAI21X1 U138 ( .A(clear), .B(err), .C(dr), .Y(n99) );
  OAI21X1 U139 ( .A(lc), .B(n100), .C(n99), .Y(n101) );
  AOI21X1 U140 ( .A(n102), .B(n47), .C(n101), .Y(n103) );
  NAND3X1 U141 ( .A(n105), .B(n104), .C(n103), .Y(next[0]) );
  INVX2 U142 ( .A(n106), .Y(n123) );
  INVX2 U143 ( .A(n120), .Y(cnt_up) );
  NOR2X1 U144 ( .A(cnt_up), .B(n108), .Y(n109) );
  NAND3X1 U145 ( .A(n7), .B(n110), .C(n109), .Y(dest[0]) );
  OAI21X1 U146 ( .A(n31), .B(n111), .C(n115), .Y(n114) );
  NAND3X1 U147 ( .A(n123), .B(n9), .C(n112), .Y(n113) );
  OR2X1 U148 ( .A(n114), .B(n113), .Y(dest[1]) );
  NAND2X1 U149 ( .A(n8), .B(n26), .Y(dest[2]) );
  NAND2X1 U150 ( .A(n118), .B(n1), .Y(src2[0]) );
  NAND2X1 U151 ( .A(n117), .B(n38), .Y(src2[1]) );
  NAND3X1 U152 ( .A(n120), .B(n121), .C(n50), .Y(src1[1]) );
  NAND3X1 U153 ( .A(n123), .B(n1), .C(n122), .Y(op[2]) );
  INVX2 U154 ( .A(n129), .Y(n125) );
  OAI21X1 U155 ( .A(n125), .B(n124), .C(n24), .Y(n136) );
  NAND2X1 U156 ( .A(lc), .B(n47), .Y(n126) );
  MUX2X1 U157 ( .B(n127), .A(n126), .S(n24), .Y(n128) );
  AOI21X1 U158 ( .A(n36), .B(n129), .C(n128), .Y(n134) );
  INVX2 U159 ( .A(modwait), .Y(n130) );
  MUX2X1 U160 ( .B(overflow), .A(n130), .S(n24), .Y(n131) );
  NOR2X1 U161 ( .A(n33), .B(n131), .Y(n133) );
  MUX2X1 U162 ( .B(n134), .A(n133), .S(n11), .Y(n135) );
  AOI21X1 U163 ( .A(n30), .B(n136), .C(n135), .Y(n137) );
  OAI21X1 U164 ( .A(n34), .B(n138), .C(n137), .Y(nextmod) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182;

  FAX1 U3 ( .A(A[15]), .B(n87), .C(n17), .YC(n16), .YS(DIFF[15]) );
  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n181), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n181), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n28), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n180), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n180), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n165), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n179), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n179), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n167), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n172), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n178), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n178), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n169), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n162), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n162), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n171), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n163), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n182), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U123 ( .A(B[7]), .Y(n95) );
  OR2X2 U124 ( .A(A[5]), .B(n97), .Y(n162) );
  BUFX2 U125 ( .A(n72), .Y(n163) );
  INVX1 U126 ( .A(n69), .Y(n68) );
  INVX1 U127 ( .A(B[15]), .Y(n87) );
  INVX1 U128 ( .A(n36), .Y(n164) );
  INVX2 U129 ( .A(n164), .Y(n165) );
  INVX1 U130 ( .A(n44), .Y(n166) );
  INVX2 U131 ( .A(n166), .Y(n167) );
  INVX1 U132 ( .A(n52), .Y(n168) );
  INVX2 U133 ( .A(n168), .Y(n169) );
  INVX1 U134 ( .A(n60), .Y(n170) );
  INVX2 U135 ( .A(n170), .Y(n171) );
  BUFX2 U136 ( .A(n49), .Y(n172) );
  XOR2X1 U137 ( .A(n103), .B(B[16]), .Y(n173) );
  XOR2X1 U138 ( .A(n16), .B(n173), .Y(DIFF[16]) );
  NAND2X1 U139 ( .A(n16), .B(n103), .Y(n174) );
  NAND2X1 U140 ( .A(n16), .B(B[16]), .Y(n175) );
  NAND2X1 U141 ( .A(n103), .B(B[16]), .Y(n176) );
  NAND3X1 U142 ( .A(n175), .B(n174), .C(n176), .Y(n15) );
  INVX2 U143 ( .A(A[0]), .Y(n177) );
  AND2X2 U144 ( .A(n177), .B(B[0]), .Y(n72) );
  INVX1 U145 ( .A(B[0]), .Y(n182) );
  OR2X2 U146 ( .A(A[7]), .B(n95), .Y(n178) );
  OR2X2 U147 ( .A(A[9]), .B(n93), .Y(n179) );
  OR2X2 U148 ( .A(A[11]), .B(n91), .Y(n180) );
  OR2X2 U149 ( .A(A[13]), .B(n89), .Y(n181) );
  INVX1 U150 ( .A(B[3]), .Y(n99) );
  INVX2 U151 ( .A(B[4]), .Y(n98) );
  INVX2 U152 ( .A(B[5]), .Y(n97) );
  INVX2 U153 ( .A(B[6]), .Y(n96) );
  INVX2 U154 ( .A(B[8]), .Y(n94) );
  INVX2 U155 ( .A(B[9]), .Y(n93) );
  INVX2 U156 ( .A(B[10]), .Y(n92) );
  INVX2 U157 ( .A(B[11]), .Y(n91) );
  INVX2 U158 ( .A(B[12]), .Y(n90) );
  INVX2 U159 ( .A(B[13]), .Y(n89) );
  INVX2 U160 ( .A(B[14]), .Y(n88) );
  INVX2 U161 ( .A(n70), .Y(n86) );
  INVX2 U162 ( .A(n66), .Y(n85) );
  INVX2 U163 ( .A(n63), .Y(n84) );
  INVX2 U164 ( .A(n58), .Y(n83) );
  INVX2 U165 ( .A(n50), .Y(n81) );
  INVX2 U166 ( .A(n42), .Y(n79) );
  INVX2 U167 ( .A(n34), .Y(n77) );
  INVX2 U168 ( .A(n26), .Y(n75) );
  INVX2 U169 ( .A(n18), .Y(n73) );
  INVX2 U170 ( .A(n56), .Y(n54) );
  INVX2 U171 ( .A(n48), .Y(n46) );
  INVX2 U172 ( .A(n40), .Y(n38) );
  INVX2 U173 ( .A(n32), .Y(n30) );
  INVX2 U174 ( .A(n24), .Y(n22) );
  INVX2 U175 ( .A(A[17]), .Y(n103) );
  INVX2 U176 ( .A(B[1]), .Y(n101) );
  INVX2 U177 ( .A(B[2]), .Y(n100) );
  INVX2 U178 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n19, n20, n21, n23, n25, n26, n27, n28, n29, n31, n33, n34, n35,
         n36, n37, n39, n41, n42, n43, n44, n45, n47, n49, n50, n51, n52, n53,
         n55, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n74, n75, n77, n79, n81, n83, n85, n86, n87, n88, n90,
         n91, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168;

  XOR2X1 U4 ( .A(n21), .B(n1), .Y(SUM[14]) );
  OAI21X1 U5 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U6 ( .A(n20), .B(n75), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(B[14]), .Y(n19) );
  NAND2X1 U9 ( .A(A[14]), .B(B[14]), .Y(n20) );
  XNOR2X1 U10 ( .A(n26), .B(n2), .Y(SUM[13]) );
  AOI21X1 U11 ( .A(n168), .B(n26), .C(n23), .Y(n21) );
  NAND2X1 U14 ( .A(n25), .B(n168), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XOR2X1 U18 ( .A(n29), .B(n3), .Y(SUM[12]) );
  OAI21X1 U19 ( .A(n29), .B(n27), .C(n28), .Y(n26) );
  NAND2X1 U20 ( .A(n28), .B(n77), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(B[12]), .Y(n27) );
  NAND2X1 U23 ( .A(A[12]), .B(B[12]), .Y(n28) );
  XNOR2X1 U24 ( .A(n34), .B(n4), .Y(SUM[11]) );
  AOI21X1 U25 ( .A(n167), .B(n34), .C(n31), .Y(n29) );
  NAND2X1 U28 ( .A(n33), .B(n167), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XOR2X1 U32 ( .A(n37), .B(n5), .Y(SUM[10]) );
  OAI21X1 U33 ( .A(n37), .B(n35), .C(n36), .Y(n34) );
  NAND2X1 U34 ( .A(n36), .B(n79), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(B[10]), .Y(n35) );
  NAND2X1 U37 ( .A(A[10]), .B(B[10]), .Y(n36) );
  XNOR2X1 U38 ( .A(n161), .B(n6), .Y(SUM[9]) );
  AOI21X1 U39 ( .A(n166), .B(n42), .C(n39), .Y(n37) );
  NAND2X1 U42 ( .A(n41), .B(n166), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n41) );
  XOR2X1 U46 ( .A(n45), .B(n7), .Y(SUM[8]) );
  OAI21X1 U47 ( .A(n45), .B(n43), .C(n44), .Y(n42) );
  NAND2X1 U48 ( .A(n44), .B(n81), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(B[8]), .Y(n43) );
  NAND2X1 U51 ( .A(A[8]), .B(B[8]), .Y(n44) );
  XNOR2X1 U52 ( .A(n160), .B(n8), .Y(SUM[7]) );
  AOI21X1 U53 ( .A(n165), .B(n50), .C(n47), .Y(n45) );
  NAND2X1 U56 ( .A(n49), .B(n165), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n49) );
  XOR2X1 U60 ( .A(n53), .B(n9), .Y(SUM[6]) );
  OAI21X1 U61 ( .A(n53), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U62 ( .A(n52), .B(n83), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(B[6]), .Y(n51) );
  NAND2X1 U65 ( .A(A[6]), .B(B[6]), .Y(n52) );
  XNOR2X1 U66 ( .A(n162), .B(n10), .Y(SUM[5]) );
  AOI21X1 U67 ( .A(n164), .B(n58), .C(n55), .Y(n53) );
  NAND2X1 U70 ( .A(n57), .B(n164), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XOR2X1 U74 ( .A(n61), .B(n11), .Y(SUM[4]) );
  OAI21X1 U75 ( .A(n61), .B(n59), .C(n60), .Y(n58) );
  NAND2X1 U76 ( .A(n60), .B(n85), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(B[4]), .Y(n59) );
  NAND2X1 U79 ( .A(A[4]), .B(B[4]), .Y(n60) );
  XNOR2X1 U80 ( .A(n66), .B(n12), .Y(SUM[3]) );
  AOI21X1 U81 ( .A(n70), .B(n62), .C(n63), .Y(n61) );
  NOR2X1 U82 ( .A(n64), .B(n67), .Y(n62) );
  OAI21X1 U83 ( .A(n64), .B(n68), .C(n65), .Y(n63) );
  NAND2X1 U84 ( .A(n65), .B(n86), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XOR2X1 U88 ( .A(n69), .B(n13), .Y(SUM[2]) );
  OAI21X1 U89 ( .A(n69), .B(n67), .C(n68), .Y(n66) );
  NAND2X1 U90 ( .A(n68), .B(n87), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(B[2]), .Y(n67) );
  NAND2X1 U93 ( .A(A[2]), .B(B[2]), .Y(n68) );
  XOR2X1 U94 ( .A(n14), .B(n163), .Y(SUM[1]) );
  OAI21X1 U96 ( .A(n71), .B(n74), .C(n72), .Y(n70) );
  NAND2X1 U97 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(B[1]), .Y(n71) );
  NAND2X1 U100 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U105 ( .A(A[0]), .B(B[0]), .Y(n74) );
  NAND3X1 U111 ( .A(n158), .B(n157), .C(n159), .Y(n150) );
  OR2X2 U112 ( .A(A[0]), .B(B[0]), .Y(n151) );
  INVX1 U113 ( .A(n71), .Y(n88) );
  XOR2X1 U114 ( .A(n91), .B(n90), .Y(n152) );
  XOR2X1 U115 ( .A(n150), .B(n152), .Y(SUM[16]) );
  NAND2X1 U116 ( .A(n17), .B(n91), .Y(n153) );
  NAND2X1 U117 ( .A(n17), .B(n90), .Y(n154) );
  NAND2X1 U118 ( .A(n91), .B(n90), .Y(n155) );
  NAND3X1 U119 ( .A(n154), .B(n153), .C(n155), .Y(n16) );
  XOR2X1 U120 ( .A(B[15]), .B(A[15]), .Y(n156) );
  XOR2X1 U121 ( .A(n18), .B(n156), .Y(SUM[15]) );
  NAND2X1 U122 ( .A(n18), .B(B[15]), .Y(n157) );
  NAND2X1 U123 ( .A(n18), .B(A[15]), .Y(n158) );
  NAND2X1 U124 ( .A(B[15]), .B(A[15]), .Y(n159) );
  NAND3X1 U125 ( .A(n158), .B(n157), .C(n159), .Y(n17) );
  BUFX2 U126 ( .A(n50), .Y(n160) );
  BUFX2 U127 ( .A(n42), .Y(n161) );
  BUFX2 U128 ( .A(n58), .Y(n162) );
  BUFX2 U129 ( .A(n74), .Y(n163) );
  OR2X2 U130 ( .A(A[7]), .B(B[7]), .Y(n165) );
  OR2X2 U131 ( .A(A[9]), .B(B[9]), .Y(n166) );
  OR2X2 U132 ( .A(A[11]), .B(B[11]), .Y(n167) );
  OR2X2 U133 ( .A(A[13]), .B(B[13]), .Y(n168) );
  AND2X1 U134 ( .A(n163), .B(n151), .Y(SUM[0]) );
  OR2X1 U135 ( .A(A[5]), .B(B[5]), .Y(n164) );
  INVX2 U136 ( .A(A[17]), .Y(n91) );
  INVX2 U137 ( .A(B[17]), .Y(n90) );
  INVX2 U138 ( .A(n67), .Y(n87) );
  INVX2 U139 ( .A(n64), .Y(n86) );
  INVX2 U140 ( .A(n59), .Y(n85) );
  INVX2 U141 ( .A(n51), .Y(n83) );
  INVX2 U142 ( .A(n43), .Y(n81) );
  INVX2 U143 ( .A(n35), .Y(n79) );
  INVX2 U144 ( .A(n27), .Y(n77) );
  INVX2 U145 ( .A(n19), .Y(n75) );
  INVX2 U146 ( .A(n70), .Y(n69) );
  INVX2 U147 ( .A(n57), .Y(n55) );
  INVX2 U148 ( .A(n49), .Y(n47) );
  INVX2 U149 ( .A(n41), .Y(n39) );
  INVX2 U150 ( .A(n33), .Y(n31) );
  INVX2 U151 ( .A(n25), .Y(n23) );
  INVX2 U152 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n13, n18, n19, n24, n25, n28, n30, n31, n36, n37, n48,
         n49, n51, n52, n53, n56, n59, n63, n64, n65, n66, n67, n68, n69, n70,
         n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n109, n111, n112, n113,
         n114, n115, n116, n120, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n133, n134, n135, n136, n140, n142, n144, n145, n146,
         n147, n148, n149, n151, n154, n155, n156, n159, n160, n161, n162,
         n163, n164, n165, n166, n169, n170, n171, n172, n173, n174, n177,
         n178, n179, n181, n182, n183, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n197, n198, n199, n200, n201, n202, n205,
         n206, n207, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n248, n249, n250, n251,
         n256, n257, n258, n259, n264, n265, n266, n267, n275, n279, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n545, n548, n551, n554, n558,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n893, n894, n897, n899, n900, n917, n918, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288,
         n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1140), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1012), .B(n1233), .Y(n74) );
  OAI21X1 U62 ( .A(n1012), .B(n1138), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1275), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n1233), .B(n89), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1166), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1275), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1233), .Y(n96) );
  OAI21X1 U90 ( .A(n1166), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1135), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n130), .B(n106), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1211), .B(n1017), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1211), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  AOI21X1 U108 ( .A(n1275), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n1233), .B(n115), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1166), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1085), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1085), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1275), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1233), .Y(n124) );
  OAI21X1 U124 ( .A(n1166), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1135), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1275), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1136), .B(n1233), .Y(n135) );
  OAI21X1 U138 ( .A(n1166), .B(n1136), .C(n140), .Y(n136) );
  AOI21X1 U142 ( .A(n151), .B(n1210), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  AOI21X1 U150 ( .A(n1275), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1233), .Y(n146) );
  OAI21X1 U152 ( .A(n1166), .B(n148), .C(n149), .Y(n147) );
  NOR2X1 U159 ( .A(n330), .B(n339), .Y(n148) );
  NAND2X1 U160 ( .A(n330), .B(n339), .Y(n149) );
  AOI21X1 U162 ( .A(n1275), .B(n155), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n349), .B(n340), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n1275), .B(n164), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n166), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n166), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n361), .B(n350), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1139), .B(n1275), .C(n1073), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1275), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n1275), .B(n285), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n187), .B(n200), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1171), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n388), .B(n401), .Y(n189) );
  NAND2X1 U212 ( .A(n388), .B(n401), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n1008), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1206), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1206), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1192), .B(n1008), .C(n1182), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n1201), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n1008), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n1008), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n1099), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1214), .B(n1208), .Y(n223) );
  AOI21X1 U258 ( .A(n1213), .B(n1208), .C(n1209), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1212), .B(n248), .C(n1215), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1216), .C(n1217), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1218), .C(n1221), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1222), .B(n1219), .C(n1220), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n310), .C(n315), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n587), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n619), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n605), .C(n621), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n637), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U335 ( .A(n623), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n591), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n655), .YC(n347), .YS(n348) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U340 ( .A(n371), .B(n369), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U348 ( .A(n609), .B(n657), .C(n641), .YC(n369), .YS(n370) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n395), .B(n382), .C(n384), .YC(n377), .YS(n378) );
  FAX1 U353 ( .A(n626), .B(n399), .C(n397), .YC(n379), .YS(n380) );
  FAX1 U355 ( .A(n386), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U361 ( .A(n659), .B(n611), .C(n643), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n627), .B(n675), .C(n595), .YC(n397), .YS(n398) );
  FAX1 U363 ( .A(n1011), .B(n579), .C(n1083), .YC(n399), .YS(n400) );
  FAX1 U364 ( .A(n406), .B(n417), .C(n404), .YC(n401), .YS(n402) );
  FAX1 U368 ( .A(n660), .B(n612), .C(n644), .YC(n409), .YS(n410) );
  FAX1 U369 ( .A(n628), .B(n596), .C(n676), .YC(n411), .YS(n412) );
  FAX1 U373 ( .A(n1001), .B(n424), .C(n426), .YC(n419), .YS(n420) );
  FAX1 U375 ( .A(n661), .B(n613), .C(n645), .YC(n423), .YS(n424) );
  FAX1 U376 ( .A(n629), .B(n677), .C(n597), .YC(n425), .YS(n426) );
  FAX1 U377 ( .A(n1235), .B(n581), .C(n693), .YC(n427), .YS(n428) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U380 ( .A(n442), .B(n438), .C(n440), .YC(n433), .YS(n434) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n614), .YC(n439), .YS(n440) );
  FAX1 U384 ( .A(n582), .B(n710), .C(n694), .YC(n441), .YS(n442) );
  FAX1 U385 ( .A(n448), .B(n1025), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U386 ( .A(n463), .B(n450), .C(n461), .YC(n445), .YS(n446) );
  FAX1 U387 ( .A(n465), .B(n452), .C(n454), .YC(n447), .YS(n448) );
  FAX1 U388 ( .A(n663), .B(n456), .C(n467), .YC(n449), .YS(n450) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n1009), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U394 ( .A(n1232), .B(n1088), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n680), .B(n664), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U397 ( .A(n600), .B(n632), .C(n712), .YC(n467), .YS(n468) );
  FAX1 U399 ( .A(n476), .B(n478), .C(n485), .YC(n471), .YS(n472) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n617), .B(n633), .C(n681), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U406 ( .A(n682), .B(n499), .C(n497), .YC(n485), .YS(n486) );
  FAX1 U407 ( .A(n698), .B(n634), .C(n666), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n714), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n667), .B(n683), .C(n635), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n700), .B(n652), .C(n684), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n716), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n702), .B(n670), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n718), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n688), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n704), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1304), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1302), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1300), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1298), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n1296), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n1294), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1292), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1290), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1288), .Y(n577) );
  NOR2X1 U443 ( .A(n918), .B(n1286), .Y(n359) );
  NOR2X1 U444 ( .A(n918), .B(n1284), .Y(n578) );
  NOR2X1 U445 ( .A(n918), .B(n1282), .Y(n385) );
  NOR2X1 U446 ( .A(n918), .B(n1280), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n1278), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1276), .Y(n581) );
  AND2X1 U449 ( .A(n1309), .B(n1308), .Y(n582) );
  OAI22X1 U466 ( .A(n918), .B(n1272), .C(n1269), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1270), .C(n1272), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1272), .B(n742), .C(n1270), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1272), .B(n743), .C(n1269), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1272), .B(n744), .C(n1270), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1272), .B(n745), .C(n1269), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1272), .B(n746), .C(n1270), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1272), .B(n747), .C(n1269), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1272), .B(n748), .C(n1270), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1272), .B(n749), .C(n1269), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1272), .B(n750), .C(n1270), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1273), .B(n751), .C(n1269), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1273), .B(n752), .C(n1270), .D(n751), .Y(n595) );
  OAI22X1 U481 ( .A(n1272), .B(n753), .C(n1269), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1272), .B(n754), .C(n1270), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1273), .B(n755), .C(n1269), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1270), .B(n755), .C(n1272), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n49), .B(n1193), .Y(n600) );
  XNOR2X1 U487 ( .A(n1305), .B(n1308), .Y(n741) );
  XNOR2X1 U488 ( .A(n1303), .B(n1308), .Y(n742) );
  XNOR2X1 U489 ( .A(n1301), .B(n1308), .Y(n743) );
  XNOR2X1 U490 ( .A(n1299), .B(n1308), .Y(n744) );
  XNOR2X1 U491 ( .A(n1297), .B(n1308), .Y(n745) );
  XNOR2X1 U492 ( .A(n1295), .B(n1308), .Y(n746) );
  XNOR2X1 U493 ( .A(n1293), .B(n1308), .Y(n747) );
  XNOR2X1 U494 ( .A(n1291), .B(n1307), .Y(n748) );
  XNOR2X1 U495 ( .A(n1289), .B(n1307), .Y(n749) );
  XNOR2X1 U496 ( .A(n1287), .B(n1307), .Y(n750) );
  XNOR2X1 U497 ( .A(n1285), .B(n1307), .Y(n751) );
  XNOR2X1 U498 ( .A(n1283), .B(n1307), .Y(n752) );
  XNOR2X1 U499 ( .A(n1281), .B(n1307), .Y(n753) );
  XNOR2X1 U500 ( .A(n1279), .B(n1307), .Y(n754) );
  XNOR2X1 U501 ( .A(n1277), .B(n1307), .Y(n755) );
  XNOR2X1 U502 ( .A(n1309), .B(n1307), .Y(n756) );
  OR2X1 U503 ( .A(n1309), .B(n918), .Y(n757) );
  OAI22X1 U505 ( .A(n1324), .B(n1268), .C(n1267), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1324), .B(n1267), .C(n1268), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1268), .B(n759), .C(n1267), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1268), .B(n760), .C(n1267), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1268), .B(n761), .C(n1267), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1268), .B(n762), .C(n1267), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1268), .B(n763), .C(n1267), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1268), .B(n764), .C(n1267), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1268), .B(n765), .C(n1027), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1268), .B(n766), .C(n1267), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1268), .B(n767), .C(n1267), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1268), .B(n768), .C(n1267), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1268), .B(n769), .C(n1267), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1268), .B(n770), .C(n1267), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1268), .B(n771), .C(n1267), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1268), .B(n772), .C(n1267), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1267), .B(n772), .C(n1268), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1309), .B(n1225), .Y(n618) );
  XNOR2X1 U526 ( .A(n1305), .B(n1323), .Y(n758) );
  XNOR2X1 U527 ( .A(n1303), .B(n1323), .Y(n759) );
  XNOR2X1 U528 ( .A(n1301), .B(n1323), .Y(n760) );
  XNOR2X1 U529 ( .A(n1299), .B(n1323), .Y(n761) );
  XNOR2X1 U530 ( .A(n1297), .B(n1323), .Y(n762) );
  XNOR2X1 U531 ( .A(n1295), .B(n1323), .Y(n763) );
  XNOR2X1 U532 ( .A(n1293), .B(n1323), .Y(n764) );
  XNOR2X1 U535 ( .A(n1287), .B(n1323), .Y(n767) );
  XNOR2X1 U536 ( .A(n1285), .B(n1323), .Y(n768) );
  XNOR2X1 U537 ( .A(n1283), .B(n1323), .Y(n769) );
  XNOR2X1 U538 ( .A(n1281), .B(n1323), .Y(n770) );
  XNOR2X1 U539 ( .A(n1279), .B(n1323), .Y(n771) );
  XNOR2X1 U540 ( .A(n1277), .B(n1323), .Y(n772) );
  XNOR2X1 U541 ( .A(n1309), .B(n1323), .Y(n773) );
  OR2X1 U542 ( .A(n1309), .B(n1324), .Y(n774) );
  OAI22X1 U544 ( .A(n1236), .B(n1266), .C(n1263), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1236), .B(n1264), .C(n1266), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1266), .B(n776), .C(n1264), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1266), .B(n777), .C(n1263), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1266), .B(n778), .C(n1264), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1266), .B(n779), .C(n1263), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1266), .B(n780), .C(n1264), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1266), .B(n781), .C(n1263), .D(n780), .Y(n626) );
  OAI22X1 U555 ( .A(n1266), .B(n783), .C(n1263), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1040), .B(n784), .C(n1264), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1266), .B(n785), .C(n1263), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1041), .B(n786), .C(n1264), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n36), .B(n787), .C(n1263), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1040), .B(n788), .C(n1264), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1041), .B(n789), .C(n1263), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1264), .B(n789), .C(n1041), .D(n790), .Y(n635) );
  XNOR2X1 U565 ( .A(n1305), .B(n1228), .Y(n775) );
  XNOR2X1 U566 ( .A(n1303), .B(n1228), .Y(n776) );
  XNOR2X1 U567 ( .A(n1301), .B(n1228), .Y(n777) );
  XNOR2X1 U568 ( .A(n1299), .B(n1228), .Y(n778) );
  XNOR2X1 U569 ( .A(n1297), .B(n1228), .Y(n779) );
  XNOR2X1 U570 ( .A(n1295), .B(n1228), .Y(n780) );
  XNOR2X1 U571 ( .A(n1293), .B(n1228), .Y(n781) );
  XNOR2X1 U572 ( .A(n1291), .B(n1228), .Y(n782) );
  XNOR2X1 U573 ( .A(n1289), .B(n1228), .Y(n783) );
  XNOR2X1 U574 ( .A(n1287), .B(n1228), .Y(n784) );
  XNOR2X1 U575 ( .A(n1285), .B(n1228), .Y(n785) );
  XNOR2X1 U576 ( .A(n1283), .B(n1228), .Y(n786) );
  XNOR2X1 U577 ( .A(n1281), .B(n1228), .Y(n787) );
  XNOR2X1 U578 ( .A(n1279), .B(n1228), .Y(n788) );
  XNOR2X1 U579 ( .A(n1277), .B(n1228), .Y(n789) );
  XNOR2X1 U580 ( .A(n1309), .B(n1228), .Y(n790) );
  OR2X1 U581 ( .A(n1309), .B(n1236), .Y(n791) );
  OAI22X1 U583 ( .A(n1321), .B(n1262), .C(n1259), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1321), .B(n1259), .C(n1262), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1262), .B(n793), .C(n1007), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1262), .B(n794), .C(n1007), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1261), .B(n795), .C(n1259), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1262), .B(n796), .C(n1259), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1261), .B(n797), .C(n1007), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1261), .B(n798), .C(n1007), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1261), .B(n799), .C(n1259), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1262), .B(n800), .C(n1007), .D(n799), .Y(n646) );
  OAI22X1 U596 ( .A(n1261), .B(n802), .C(n1006), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1261), .B(n803), .C(n1006), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1262), .B(n804), .C(n1259), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1262), .B(n805), .C(n1259), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1262), .B(n806), .C(n1259), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1259), .B(n806), .C(n1262), .D(n807), .Y(n653) );
  XNOR2X1 U604 ( .A(n1305), .B(n1319), .Y(n792) );
  XNOR2X1 U605 ( .A(n1303), .B(n1319), .Y(n793) );
  XNOR2X1 U606 ( .A(n1301), .B(n1319), .Y(n794) );
  XNOR2X1 U607 ( .A(n1299), .B(n1319), .Y(n795) );
  XNOR2X1 U608 ( .A(n1297), .B(n1319), .Y(n796) );
  XNOR2X1 U609 ( .A(n1295), .B(n1319), .Y(n797) );
  XNOR2X1 U610 ( .A(n1293), .B(n1319), .Y(n798) );
  XNOR2X1 U611 ( .A(n1291), .B(n1319), .Y(n799) );
  XNOR2X1 U612 ( .A(n1289), .B(n1320), .Y(n800) );
  XNOR2X1 U613 ( .A(n1287), .B(n1319), .Y(n801) );
  XNOR2X1 U614 ( .A(n1285), .B(n1319), .Y(n802) );
  XNOR2X1 U615 ( .A(n1283), .B(n1319), .Y(n803) );
  XNOR2X1 U616 ( .A(n1281), .B(n1319), .Y(n804) );
  XNOR2X1 U617 ( .A(n1279), .B(n1319), .Y(n805) );
  XNOR2X1 U618 ( .A(n1277), .B(n1319), .Y(n806) );
  XNOR2X1 U619 ( .A(n1309), .B(n1319), .Y(n807) );
  OR2X1 U620 ( .A(n1309), .B(n1321), .Y(n808) );
  OAI22X1 U622 ( .A(n1318), .B(n1093), .C(n1256), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1318), .B(n1256), .C(n24), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n24), .B(n810), .C(n1256), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1257), .B(n811), .C(n1256), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n24), .B(n812), .C(n1256), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1093), .B(n813), .C(n1256), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n24), .B(n814), .C(n1256), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1093), .B(n815), .C(n1256), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1093), .B(n816), .C(n1256), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n24), .B(n817), .C(n1256), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1093), .B(n818), .C(n1256), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n24), .B(n819), .C(n1256), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1093), .B(n820), .C(n1256), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n24), .B(n821), .C(n1256), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1093), .B(n822), .C(n1256), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1091), .B(n823), .C(n1256), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1256), .B(n823), .C(n1091), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1309), .B(n1223), .Y(n672) );
  XNOR2X1 U643 ( .A(n1305), .B(n996), .Y(n809) );
  XNOR2X1 U644 ( .A(n1303), .B(n1317), .Y(n810) );
  XNOR2X1 U645 ( .A(n1301), .B(n997), .Y(n811) );
  XNOR2X1 U646 ( .A(n1299), .B(n1317), .Y(n812) );
  XNOR2X1 U647 ( .A(n1297), .B(n996), .Y(n813) );
  XNOR2X1 U648 ( .A(n1295), .B(n996), .Y(n814) );
  XNOR2X1 U649 ( .A(n1293), .B(n997), .Y(n815) );
  XNOR2X1 U650 ( .A(n1291), .B(n1317), .Y(n816) );
  XNOR2X1 U651 ( .A(n1289), .B(n1317), .Y(n817) );
  XNOR2X1 U652 ( .A(n1287), .B(n1317), .Y(n818) );
  XNOR2X1 U653 ( .A(n1285), .B(n997), .Y(n819) );
  XNOR2X1 U654 ( .A(n1283), .B(n1317), .Y(n820) );
  XNOR2X1 U655 ( .A(n1281), .B(n997), .Y(n821) );
  XNOR2X1 U656 ( .A(n1279), .B(n1317), .Y(n822) );
  XNOR2X1 U657 ( .A(n1277), .B(n997), .Y(n823) );
  XNOR2X1 U658 ( .A(n1309), .B(n1317), .Y(n824) );
  OR2X1 U659 ( .A(n1309), .B(n1318), .Y(n825) );
  OAI22X1 U661 ( .A(n1316), .B(n1255), .C(n1251), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1316), .B(n1252), .C(n1254), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1255), .B(n827), .C(n1252), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1255), .B(n828), .C(n1251), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1254), .B(n829), .C(n1252), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1255), .B(n830), .C(n1251), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1255), .B(n831), .C(n1252), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1255), .B(n832), .C(n1251), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1254), .B(n833), .C(n1252), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1255), .B(n834), .C(n1251), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1255), .B(n835), .C(n1252), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1255), .B(n836), .C(n1251), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1255), .B(n837), .C(n1252), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1255), .B(n838), .C(n1251), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1255), .B(n839), .C(n1252), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1255), .B(n840), .C(n1251), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1252), .B(n840), .C(n1255), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n49), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n1305), .B(n1315), .Y(n826) );
  XNOR2X1 U683 ( .A(n1303), .B(n1315), .Y(n827) );
  XNOR2X1 U684 ( .A(n1301), .B(n1315), .Y(n828) );
  XNOR2X1 U685 ( .A(n1299), .B(n1229), .Y(n829) );
  XNOR2X1 U686 ( .A(n1297), .B(n1229), .Y(n830) );
  XNOR2X1 U687 ( .A(n1295), .B(n1229), .Y(n831) );
  XNOR2X1 U688 ( .A(n1293), .B(n1231), .Y(n832) );
  XNOR2X1 U689 ( .A(n1291), .B(n1230), .Y(n833) );
  XNOR2X1 U690 ( .A(n1289), .B(n1231), .Y(n834) );
  XNOR2X1 U691 ( .A(n1287), .B(n1230), .Y(n835) );
  XNOR2X1 U692 ( .A(n1285), .B(n1231), .Y(n836) );
  XNOR2X1 U693 ( .A(n1283), .B(n1230), .Y(n837) );
  XNOR2X1 U694 ( .A(n1281), .B(n1231), .Y(n838) );
  XNOR2X1 U695 ( .A(n1279), .B(n1230), .Y(n839) );
  XNOR2X1 U696 ( .A(n1277), .B(n1231), .Y(n840) );
  XNOR2X1 U697 ( .A(n1309), .B(n1230), .Y(n841) );
  OR2X1 U698 ( .A(n1309), .B(n1316), .Y(n842) );
  OAI22X1 U700 ( .A(n1313), .B(n1205), .C(n1249), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1313), .B(n1249), .C(n998), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1250), .B(n844), .C(n1249), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1250), .B(n845), .C(n1249), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1205), .B(n846), .C(n1249), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1250), .B(n847), .C(n1249), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1205), .B(n848), .C(n1249), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n998), .B(n849), .C(n1249), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n998), .B(n850), .C(n1249), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1205), .B(n851), .C(n1249), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n998), .B(n852), .C(n1249), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1205), .B(n853), .C(n1249), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n998), .B(n854), .C(n1249), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1205), .B(n855), .C(n1249), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1205), .B(n856), .C(n1249), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n998), .B(n857), .C(n1249), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1249), .B(n857), .C(n998), .D(n858), .Y(n707) );
  XNOR2X1 U721 ( .A(n1305), .B(n1003), .Y(n843) );
  XNOR2X1 U722 ( .A(n1303), .B(n1004), .Y(n844) );
  XNOR2X1 U723 ( .A(n1301), .B(n1004), .Y(n845) );
  XNOR2X1 U724 ( .A(n1299), .B(n1004), .Y(n846) );
  XNOR2X1 U725 ( .A(n1297), .B(n1003), .Y(n847) );
  XNOR2X1 U726 ( .A(n1295), .B(n1004), .Y(n848) );
  XNOR2X1 U727 ( .A(n1293), .B(n1004), .Y(n849) );
  XNOR2X1 U728 ( .A(n1291), .B(n1003), .Y(n850) );
  XNOR2X1 U729 ( .A(n1289), .B(n1004), .Y(n851) );
  XNOR2X1 U730 ( .A(n1287), .B(n1004), .Y(n852) );
  XNOR2X1 U731 ( .A(n1285), .B(n1004), .Y(n853) );
  XNOR2X1 U732 ( .A(n1283), .B(n1004), .Y(n854) );
  XNOR2X1 U733 ( .A(n1281), .B(n1003), .Y(n855) );
  XNOR2X1 U734 ( .A(n1279), .B(n1004), .Y(n856) );
  XNOR2X1 U735 ( .A(n1277), .B(n1003), .Y(n857) );
  XNOR2X1 U736 ( .A(n1309), .B(n1004), .Y(n858) );
  OR2X1 U737 ( .A(n1309), .B(n1313), .Y(n859) );
  OAI22X1 U739 ( .A(n1019), .B(n1246), .C(n1044), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n1044), .B(n1046), .C(n1247), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1247), .B(n861), .C(n1044), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1247), .B(n862), .C(n1044), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1247), .B(n863), .C(n1044), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1246), .B(n864), .C(n1044), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1246), .B(n865), .C(n1044), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1246), .B(n866), .C(n1044), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1246), .B(n867), .C(n1044), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1246), .B(n868), .C(n1044), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1246), .B(n869), .C(n1044), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1246), .B(n870), .C(n1044), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1246), .B(n871), .C(n1044), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1246), .B(n872), .C(n1044), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1246), .B(n873), .C(n1044), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1246), .B(n874), .C(n1044), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n1044), .B(n874), .C(n1246), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1305), .B(n1200), .Y(n860) );
  XNOR2X1 U759 ( .A(n1303), .B(n1207), .Y(n861) );
  XNOR2X1 U760 ( .A(n1301), .B(n1074), .Y(n862) );
  XNOR2X1 U761 ( .A(n1299), .B(n1074), .Y(n863) );
  XNOR2X1 U762 ( .A(n1297), .B(n1074), .Y(n864) );
  XNOR2X1 U763 ( .A(n1295), .B(n1074), .Y(n865) );
  XNOR2X1 U764 ( .A(n1293), .B(n1181), .Y(n866) );
  XNOR2X1 U765 ( .A(n1291), .B(n1180), .Y(n867) );
  XNOR2X1 U766 ( .A(n1289), .B(n1180), .Y(n868) );
  XNOR2X1 U767 ( .A(n1287), .B(n1181), .Y(n869) );
  XNOR2X1 U768 ( .A(n1285), .B(n1180), .Y(n870) );
  XNOR2X1 U769 ( .A(n1283), .B(n1181), .Y(n871) );
  XNOR2X1 U770 ( .A(n1281), .B(n1181), .Y(n872) );
  XNOR2X1 U771 ( .A(n1279), .B(n1180), .Y(n873) );
  XNOR2X1 U772 ( .A(n1277), .B(n1181), .Y(n874) );
  XNOR2X1 U773 ( .A(n1309), .B(n1180), .Y(n875) );
  OR2X1 U774 ( .A(n1309), .B(n1046), .Y(n876) );
  NAND2X1 U801 ( .A(n1270), .B(n893), .Y(n48) );
  XOR2X1 U805 ( .A(n37), .B(a[27]), .Y(n894) );
  XOR2X1 U820 ( .A(n1062), .B(a[17]), .Y(n899) );
  XNOR2X1 U821 ( .A(n1078), .B(a[17]), .Y(n9) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  BUFX4 U828 ( .A(n383), .Y(n1005) );
  INVX4 U829 ( .A(n1082), .Y(n995) );
  INVX4 U830 ( .A(n995), .Y(n996) );
  INVX4 U831 ( .A(n995), .Y(n997) );
  BUFX2 U832 ( .A(n1013), .Y(n998) );
  BUFX4 U833 ( .A(n379), .Y(n999) );
  INVX4 U834 ( .A(n1265), .Y(n1041) );
  INVX4 U835 ( .A(n1245), .Y(n1246) );
  INVX2 U836 ( .A(n31), .Y(n1322) );
  INVX8 U837 ( .A(n1015), .Y(n1268) );
  INVX8 U838 ( .A(n1322), .Y(n1228) );
  INVX4 U839 ( .A(n1304), .Y(n1305) );
  INVX4 U840 ( .A(n541), .Y(n1306) );
  INVX4 U841 ( .A(n1312), .Y(n1002) );
  INVX2 U842 ( .A(n1313), .Y(n1312) );
  INVX2 U843 ( .A(n1010), .Y(n1011) );
  INVX2 U844 ( .A(n1271), .Y(n1273) );
  BUFX2 U845 ( .A(n1314), .Y(n1230) );
  INVX4 U846 ( .A(n1002), .Y(n1003) );
  BUFX2 U847 ( .A(n1314), .Y(n1231) );
  INVX2 U848 ( .A(n437), .Y(n1080) );
  BUFX2 U849 ( .A(n36), .Y(n1040) );
  INVX2 U850 ( .A(n1043), .Y(n1044) );
  BUFX2 U851 ( .A(n375), .Y(n1116) );
  BUFX2 U852 ( .A(n464), .Y(n1009) );
  BUFX2 U853 ( .A(n212), .Y(n1008) );
  INVX4 U854 ( .A(n1225), .Y(n1267) );
  BUFX2 U855 ( .A(n648), .Y(n1000) );
  AND2X2 U856 ( .A(n1309), .B(n1239), .Y(n636) );
  BUFX2 U857 ( .A(n439), .Y(n1001) );
  INVX2 U858 ( .A(n1), .Y(n1311) );
  INVX8 U859 ( .A(n1002), .Y(n1004) );
  INVX2 U860 ( .A(n7), .Y(n1313) );
  AND2X2 U861 ( .A(n1309), .B(n1258), .Y(n654) );
  BUFX2 U862 ( .A(n1076), .Y(n1006) );
  BUFX2 U863 ( .A(n1076), .Y(n1007) );
  INVX1 U864 ( .A(n1258), .Y(n1076) );
  BUFX4 U865 ( .A(n1), .Y(n1078) );
  AND2X2 U866 ( .A(n49), .B(n1248), .Y(n708) );
  INVX4 U867 ( .A(n1227), .Y(n1205) );
  INVX2 U868 ( .A(n1198), .Y(n1010) );
  INVX4 U869 ( .A(n1298), .Y(n1299) );
  INVX4 U870 ( .A(n1300), .Y(n1301) );
  INVX4 U871 ( .A(n1302), .Y(n1303) );
  INVX2 U872 ( .A(n49), .Y(n1310) );
  OR2X2 U873 ( .A(n1136), .B(n80), .Y(n1012) );
  NAND2X1 U874 ( .A(n9), .B(n899), .Y(n1013) );
  AND2X2 U875 ( .A(n711), .B(n615), .Y(n1014) );
  INVX2 U876 ( .A(n1045), .Y(n1074) );
  AND2X2 U877 ( .A(n894), .B(n1027), .Y(n1015) );
  AND2X2 U878 ( .A(n149), .B(n281), .Y(n1016) );
  INVX2 U879 ( .A(n1253), .Y(n1254) );
  INVX4 U880 ( .A(n1292), .Y(n1293) );
  INVX4 U881 ( .A(n1296), .Y(n1297) );
  OR2X2 U882 ( .A(n308), .B(n313), .Y(n1017) );
  INVX4 U883 ( .A(n1276), .Y(n1277) );
  INVX4 U884 ( .A(n1294), .Y(n1295) );
  INVX4 U885 ( .A(n1284), .Y(n1285) );
  INVX4 U886 ( .A(n1282), .Y(n1283) );
  INVX2 U887 ( .A(n888), .Y(n1282) );
  INVX4 U888 ( .A(n1286), .Y(n1287) );
  INVX2 U889 ( .A(n886), .Y(n1286) );
  INVX2 U890 ( .A(n880), .Y(n1298) );
  INVX4 U891 ( .A(n1288), .Y(n1289) );
  INVX2 U892 ( .A(n885), .Y(n1288) );
  INVX2 U893 ( .A(n917), .Y(n1043) );
  INVX2 U894 ( .A(a[15]), .Y(n917) );
  INVX2 U895 ( .A(n879), .Y(n1300) );
  OR2X2 U896 ( .A(n292), .B(n293), .Y(n1018) );
  INVX2 U897 ( .A(n877), .Y(n1304) );
  INVX1 U898 ( .A(n1207), .Y(n1019) );
  XOR2X1 U899 ( .A(n616), .B(n648), .Y(n1020) );
  XOR2X1 U900 ( .A(n696), .B(n1020), .Y(n466) );
  NAND2X1 U901 ( .A(n696), .B(n616), .Y(n1021) );
  NAND2X1 U902 ( .A(n696), .B(n648), .Y(n1022) );
  NAND2X1 U903 ( .A(n616), .B(n1000), .Y(n1023) );
  NAND3X1 U904 ( .A(n1022), .B(n1021), .C(n1023), .Y(n465) );
  INVX2 U905 ( .A(n459), .Y(n1024) );
  INVX4 U906 ( .A(n1024), .Y(n1025) );
  XNOR2X1 U907 ( .A(n1026), .B(n433), .Y(n418) );
  XNOR2X1 U908 ( .A(n1079), .B(n435), .Y(n1026) );
  INVX2 U909 ( .A(n1052), .Y(n1247) );
  XNOR2X1 U910 ( .A(n31), .B(a[27]), .Y(n1027) );
  INVX2 U911 ( .A(n1027), .Y(n1225) );
  XNOR2X1 U912 ( .A(n1290), .B(n1324), .Y(n765) );
  INVX4 U913 ( .A(n1290), .Y(n1291) );
  XOR2X1 U914 ( .A(n1289), .B(n1324), .Y(n766) );
  BUFX2 U915 ( .A(n370), .Y(n1028) );
  INVX4 U916 ( .A(n1278), .Y(n1279) );
  XNOR2X1 U917 ( .A(n123), .B(n1029), .Y(product[42]) );
  AND2X2 U918 ( .A(n122), .B(n1085), .Y(n1029) );
  XNOR2X1 U919 ( .A(n86), .B(n1030), .Y(product[45]) );
  AND2X2 U920 ( .A(n85), .B(n275), .Y(n1030) );
  XNOR2X1 U921 ( .A(n145), .B(n1031), .Y(product[40]) );
  AND2X2 U922 ( .A(n144), .B(n1210), .Y(n1031) );
  XOR2X1 U923 ( .A(n1235), .B(n580), .Y(n1032) );
  XOR2X1 U924 ( .A(n1032), .B(n692), .Y(n414) );
  XOR2X1 U925 ( .A(n427), .B(n425), .Y(n1033) );
  XOR2X1 U926 ( .A(n1033), .B(n414), .Y(n408) );
  NAND2X1 U927 ( .A(n1235), .B(n580), .Y(n1034) );
  NAND2X1 U928 ( .A(n1235), .B(n692), .Y(n1035) );
  NAND2X1 U929 ( .A(n580), .B(n692), .Y(n1036) );
  NAND3X1 U930 ( .A(n1034), .B(n1035), .C(n1036), .Y(n413) );
  NAND2X1 U931 ( .A(n427), .B(n425), .Y(n1037) );
  NAND2X1 U932 ( .A(n427), .B(n414), .Y(n1038) );
  NAND2X1 U933 ( .A(n425), .B(n414), .Y(n1039) );
  NAND3X1 U934 ( .A(n1037), .B(n1038), .C(n1039), .Y(n407) );
  INVX8 U935 ( .A(n1316), .Y(n1315) );
  INVX4 U936 ( .A(n36), .Y(n1265) );
  AND2X2 U937 ( .A(n1064), .B(n897), .Y(n1042) );
  INVX4 U938 ( .A(n1042), .Y(n24) );
  INVX1 U939 ( .A(n1), .Y(n1045) );
  INVX1 U940 ( .A(n1), .Y(n1046) );
  XNOR2X1 U941 ( .A(n19), .B(a[23]), .Y(n28) );
  NAND2X1 U942 ( .A(n1089), .B(n1090), .Y(n1047) );
  XOR2X1 U943 ( .A(n436), .B(n449), .Y(n1048) );
  XOR2X1 U944 ( .A(n447), .B(n1048), .Y(n432) );
  NAND2X1 U945 ( .A(n447), .B(n436), .Y(n1049) );
  NAND2X1 U946 ( .A(n447), .B(n449), .Y(n1050) );
  NAND2X1 U947 ( .A(n436), .B(n449), .Y(n1051) );
  NAND3X1 U948 ( .A(n1050), .B(n1049), .C(n1051), .Y(n431) );
  OR2X2 U949 ( .A(n1261), .B(n801), .Y(n1089) );
  INVX2 U950 ( .A(n891), .Y(n1276) );
  INVX2 U951 ( .A(n1316), .Y(n1314) );
  XNOR2X1 U952 ( .A(n1311), .B(a[15]), .Y(n900) );
  INVX2 U953 ( .A(n6), .Y(n1052) );
  INVX1 U954 ( .A(n6), .Y(n1245) );
  INVX8 U955 ( .A(n1223), .Y(n1256) );
  XOR2X1 U956 ( .A(n25), .B(a[25]), .Y(n1053) );
  XNOR2X1 U957 ( .A(n154), .B(n1016), .Y(product[39]) );
  XOR2X1 U958 ( .A(n368), .B(n999), .Y(n1054) );
  XOR2X1 U959 ( .A(n1054), .B(n377), .Y(n364) );
  XOR2X1 U960 ( .A(n1116), .B(n366), .Y(n1055) );
  XOR2X1 U961 ( .A(n1055), .B(n364), .Y(n362) );
  NAND2X1 U962 ( .A(n368), .B(n999), .Y(n1056) );
  NAND2X1 U963 ( .A(n368), .B(n377), .Y(n1057) );
  NAND2X1 U964 ( .A(n999), .B(n377), .Y(n1058) );
  NAND3X1 U965 ( .A(n1056), .B(n1057), .C(n1058), .Y(n363) );
  NAND2X1 U966 ( .A(n1116), .B(n366), .Y(n1059) );
  NAND2X1 U967 ( .A(n1116), .B(n364), .Y(n1060) );
  NAND2X1 U968 ( .A(n366), .B(n364), .Y(n1061) );
  NAND3X1 U969 ( .A(n1059), .B(n1060), .C(n1061), .Y(n361) );
  BUFX2 U970 ( .A(n7), .Y(n1062) );
  XNOR2X1 U971 ( .A(n163), .B(n1063), .Y(product[38]) );
  AND2X2 U972 ( .A(n162), .B(n282), .Y(n1063) );
  XNOR2X1 U973 ( .A(n1077), .B(a[21]), .Y(n1064) );
  INVX2 U974 ( .A(n1064), .Y(n1223) );
  XNOR2X1 U975 ( .A(n1318), .B(a[21]), .Y(n897) );
  XOR2X1 U976 ( .A(n409), .B(n398), .Y(n1065) );
  XOR2X1 U977 ( .A(n1065), .B(n396), .Y(n392) );
  NAND2X1 U978 ( .A(n409), .B(n398), .Y(n1066) );
  NAND2X1 U979 ( .A(n409), .B(n396), .Y(n1067) );
  NAND2X1 U980 ( .A(n398), .B(n396), .Y(n1068) );
  NAND3X1 U981 ( .A(n1066), .B(n1067), .C(n1068), .Y(n391) );
  XOR2X1 U982 ( .A(n380), .B(n393), .Y(n1069) );
  XOR2X1 U983 ( .A(n1069), .B(n391), .Y(n376) );
  NAND2X1 U984 ( .A(n393), .B(n380), .Y(n1070) );
  NAND2X1 U985 ( .A(n393), .B(n391), .Y(n1071) );
  NAND2X1 U986 ( .A(n380), .B(n391), .Y(n1072) );
  NAND3X1 U987 ( .A(n1070), .B(n1071), .C(n1072), .Y(n375) );
  INVX2 U988 ( .A(n174), .Y(n1073) );
  INVX2 U989 ( .A(n1046), .Y(n1075) );
  INVX4 U990 ( .A(n1316), .Y(n1077) );
  XOR2X1 U991 ( .A(n1092), .B(n1080), .Y(n1079) );
  XNOR2X1 U992 ( .A(n1047), .B(n1081), .Y(n454) );
  XNOR2X1 U993 ( .A(n599), .B(n695), .Y(n1081) );
  INVX4 U994 ( .A(n1318), .Y(n1082) );
  XNOR2X1 U995 ( .A(n1321), .B(a[23]), .Y(n1086) );
  INVX1 U996 ( .A(n1321), .Y(n1320) );
  AOI22X1 U997 ( .A(n1248), .B(n1004), .C(n1227), .D(n1003), .Y(n1083) );
  INVX2 U998 ( .A(n9), .Y(n1248) );
  INVX4 U999 ( .A(n25), .Y(n1321) );
  BUFX4 U1000 ( .A(n477), .Y(n1232) );
  INVX8 U1001 ( .A(n1253), .Y(n1255) );
  XNOR2X1 U1002 ( .A(n1084), .B(n390), .Y(n388) );
  XNOR2X1 U1003 ( .A(n392), .B(n403), .Y(n1084) );
  INVX4 U1004 ( .A(n1237), .Y(n627) );
  BUFX2 U1005 ( .A(n1017), .Y(n1085) );
  NAND2X1 U1006 ( .A(n1086), .B(n28), .Y(n30) );
  INVX2 U1007 ( .A(n28), .Y(n1258) );
  INVX2 U1008 ( .A(n475), .Y(n1087) );
  INVX4 U1009 ( .A(n1087), .Y(n1088) );
  NAND2X1 U1010 ( .A(n1089), .B(n1090), .Y(n647) );
  OR2X1 U1011 ( .A(n1259), .B(n800), .Y(n1090) );
  INVX1 U1012 ( .A(n130), .Y(n279) );
  INVX8 U1013 ( .A(n1265), .Y(n1266) );
  BUFX2 U1014 ( .A(n24), .Y(n1091) );
  XNOR2X1 U1015 ( .A(n428), .B(n441), .Y(n1092) );
  INVX4 U1016 ( .A(n1126), .Y(n1093) );
  XOR2X1 U1017 ( .A(n622), .B(n606), .Y(n1094) );
  XOR2X1 U1018 ( .A(n347), .B(n1094), .Y(n334) );
  NAND2X1 U1019 ( .A(n347), .B(n622), .Y(n1095) );
  NAND2X1 U1020 ( .A(n347), .B(n606), .Y(n1096) );
  NAND2X1 U1021 ( .A(n622), .B(n606), .Y(n1097) );
  NAND3X1 U1022 ( .A(n1096), .B(n1095), .C(n1097), .Y(n333) );
  INVX2 U1023 ( .A(n1126), .Y(n1257) );
  INVX1 U1024 ( .A(n444), .Y(n1098) );
  INVX1 U1025 ( .A(n1098), .Y(n1099) );
  XOR2X1 U1026 ( .A(n487), .B(n480), .Y(n1100) );
  XOR2X1 U1027 ( .A(n489), .B(n1100), .Y(n474) );
  NAND2X1 U1028 ( .A(n489), .B(n487), .Y(n1101) );
  NAND2X1 U1029 ( .A(n489), .B(n480), .Y(n1102) );
  NAND2X1 U1030 ( .A(n487), .B(n480), .Y(n1103) );
  NAND3X1 U1031 ( .A(n1102), .B(n1101), .C(n1103), .Y(n473) );
  XOR2X1 U1032 ( .A(n385), .B(n578), .Y(n1104) );
  XOR2X1 U1033 ( .A(n1104), .B(n1169), .Y(n372) );
  XOR2X1 U1034 ( .A(n625), .B(n593), .Y(n1105) );
  XOR2X1 U1035 ( .A(n1105), .B(n372), .Y(n368) );
  NAND2X1 U1036 ( .A(n385), .B(n578), .Y(n1106) );
  NAND2X1 U1037 ( .A(n385), .B(n1169), .Y(n1107) );
  NAND2X1 U1038 ( .A(n578), .B(n1169), .Y(n1108) );
  NAND3X1 U1039 ( .A(n1106), .B(n1107), .C(n1108), .Y(n371) );
  NAND2X1 U1040 ( .A(n625), .B(n593), .Y(n1109) );
  NAND2X1 U1041 ( .A(n625), .B(n372), .Y(n1110) );
  NAND2X1 U1042 ( .A(n593), .B(n372), .Y(n1111) );
  NAND3X1 U1043 ( .A(n1109), .B(n1110), .C(n1111), .Y(n367) );
  INVX2 U1044 ( .A(n1251), .Y(n558) );
  XOR2X1 U1045 ( .A(n483), .B(n474), .Y(n1112) );
  XOR2X1 U1046 ( .A(n472), .B(n1112), .Y(n470) );
  NAND2X1 U1047 ( .A(n472), .B(n483), .Y(n1113) );
  NAND2X1 U1048 ( .A(n472), .B(n474), .Y(n1114) );
  NAND2X1 U1049 ( .A(n483), .B(n474), .Y(n1115) );
  NAND3X1 U1050 ( .A(n1114), .B(n1113), .C(n1115), .Y(n469) );
  XOR2X1 U1051 ( .A(n679), .B(n631), .Y(n1117) );
  XOR2X1 U1052 ( .A(n1117), .B(n565), .Y(n452) );
  NAND2X1 U1053 ( .A(n679), .B(n631), .Y(n1118) );
  NAND2X1 U1054 ( .A(n679), .B(n565), .Y(n1119) );
  NAND2X1 U1055 ( .A(n631), .B(n565), .Y(n1120) );
  NAND3X1 U1056 ( .A(n1118), .B(n1119), .C(n1120), .Y(n451) );
  XOR2X1 U1057 ( .A(n453), .B(n1014), .Y(n1121) );
  XOR2X1 U1058 ( .A(n1121), .B(n451), .Y(n436) );
  NAND2X1 U1059 ( .A(n1014), .B(n453), .Y(n1122) );
  NAND2X1 U1060 ( .A(n1014), .B(n451), .Y(n1123) );
  NAND2X1 U1061 ( .A(n453), .B(n451), .Y(n1124) );
  NAND3X1 U1062 ( .A(n1122), .B(n1123), .C(n1124), .Y(n435) );
  INVX8 U1063 ( .A(n1310), .Y(n1309) );
  XNOR2X1 U1064 ( .A(n1306), .B(a[29]), .Y(n893) );
  OR2X2 U1065 ( .A(n1125), .B(n1053), .Y(n36) );
  XOR2X1 U1066 ( .A(n1322), .B(a[25]), .Y(n1125) );
  INVX2 U1067 ( .A(n1053), .Y(n1264) );
  AND2X2 U1068 ( .A(n897), .B(n1064), .Y(n1126) );
  XOR2X1 U1069 ( .A(n355), .B(n346), .Y(n1127) );
  XOR2X1 U1070 ( .A(n344), .B(n1127), .Y(n342) );
  XOR2X1 U1071 ( .A(n353), .B(n351), .Y(n1128) );
  XOR2X1 U1072 ( .A(n1128), .B(n342), .Y(n340) );
  NAND2X1 U1073 ( .A(n355), .B(n346), .Y(n1129) );
  NAND2X1 U1074 ( .A(n355), .B(n344), .Y(n1130) );
  NAND2X1 U1075 ( .A(n346), .B(n344), .Y(n1131) );
  NAND3X1 U1076 ( .A(n1129), .B(n1130), .C(n1131), .Y(n341) );
  NAND2X1 U1077 ( .A(n353), .B(n351), .Y(n1132) );
  NAND2X1 U1078 ( .A(n353), .B(n342), .Y(n1133) );
  NAND2X1 U1079 ( .A(n351), .B(n342), .Y(n1134) );
  NAND3X1 U1080 ( .A(n1132), .B(n1133), .C(n1134), .Y(n339) );
  INVX1 U1081 ( .A(n1233), .Y(n155) );
  INVX8 U1082 ( .A(n1271), .Y(n1272) );
  NAND2X1 U1083 ( .A(n1210), .B(n281), .Y(n1135) );
  NAND2X1 U1084 ( .A(n1210), .B(n281), .Y(n1136) );
  XNOR2X1 U1085 ( .A(n112), .B(n1137), .Y(product[43]) );
  AND2X2 U1086 ( .A(n111), .B(n1211), .Y(n1137) );
  BUFX2 U1087 ( .A(n52), .Y(n1138) );
  INVX1 U1088 ( .A(n173), .Y(n1139) );
  INVX2 U1089 ( .A(n1274), .Y(n1140) );
  XOR2X1 U1090 ( .A(n407), .B(n394), .Y(n1141) );
  XOR2X1 U1091 ( .A(n1141), .B(n405), .Y(n390) );
  NAND2X1 U1092 ( .A(n407), .B(n394), .Y(n1142) );
  NAND2X1 U1093 ( .A(n407), .B(n405), .Y(n1143) );
  NAND2X1 U1094 ( .A(n394), .B(n405), .Y(n1144) );
  NAND3X1 U1095 ( .A(n1142), .B(n1143), .C(n1144), .Y(n389) );
  NAND2X1 U1096 ( .A(n392), .B(n403), .Y(n1145) );
  NAND2X1 U1097 ( .A(n392), .B(n390), .Y(n1146) );
  NAND2X1 U1098 ( .A(n403), .B(n390), .Y(n1147) );
  NAND3X1 U1099 ( .A(n1145), .B(n1146), .C(n1147), .Y(n387) );
  XOR2X1 U1100 ( .A(n423), .B(n412), .Y(n1148) );
  XOR2X1 U1101 ( .A(n410), .B(n1148), .Y(n406) );
  NAND2X1 U1102 ( .A(n410), .B(n423), .Y(n1149) );
  NAND2X1 U1103 ( .A(n410), .B(n412), .Y(n1150) );
  NAND2X1 U1104 ( .A(n423), .B(n412), .Y(n1151) );
  NAND3X1 U1105 ( .A(n1150), .B(n1149), .C(n1151), .Y(n405) );
  XNOR2X1 U1106 ( .A(n1152), .B(n418), .Y(n416) );
  XNOR2X1 U1107 ( .A(n420), .B(n431), .Y(n1152) );
  NAND2X1 U1108 ( .A(n435), .B(n1079), .Y(n1153) );
  NAND2X1 U1109 ( .A(n435), .B(n433), .Y(n1154) );
  NAND2X1 U1110 ( .A(n1079), .B(n433), .Y(n1155) );
  NAND3X1 U1111 ( .A(n1153), .B(n1154), .C(n1155), .Y(n417) );
  NAND2X1 U1112 ( .A(n420), .B(n431), .Y(n1156) );
  NAND2X1 U1113 ( .A(n420), .B(n418), .Y(n1157) );
  NAND2X1 U1114 ( .A(n431), .B(n418), .Y(n1158) );
  NAND3X1 U1115 ( .A(n1156), .B(n1157), .C(n1158), .Y(n415) );
  XOR2X1 U1116 ( .A(n662), .B(n630), .Y(n1159) );
  XOR2X1 U1117 ( .A(n1159), .B(n646), .Y(n438) );
  NAND2X1 U1118 ( .A(n662), .B(n630), .Y(n1160) );
  NAND2X1 U1119 ( .A(n646), .B(n662), .Y(n1161) );
  NAND2X1 U1120 ( .A(n630), .B(n646), .Y(n1162) );
  NAND3X1 U1121 ( .A(n1160), .B(n1161), .C(n1162), .Y(n437) );
  NAND2X1 U1122 ( .A(n428), .B(n441), .Y(n1163) );
  NAND2X1 U1123 ( .A(n428), .B(n437), .Y(n1164) );
  NAND2X1 U1124 ( .A(n441), .B(n437), .Y(n1165) );
  NAND3X1 U1125 ( .A(n1163), .B(n1164), .C(n1165), .Y(n421) );
  INVX4 U1126 ( .A(n1234), .Y(n1166) );
  INVX2 U1127 ( .A(n52), .Y(n1234) );
  INVX8 U1128 ( .A(n1321), .Y(n1319) );
  XNOR2X1 U1129 ( .A(n73), .B(n1167), .Y(product[46]) );
  AND2X2 U1130 ( .A(n72), .B(n1018), .Y(n1167) );
  OR2X2 U1131 ( .A(n1168), .B(n1226), .Y(n18) );
  XNOR2X1 U1132 ( .A(n1315), .B(a[19]), .Y(n1168) );
  AOI22X1 U1133 ( .A(n558), .B(n1170), .C(n1253), .D(n1170), .Y(n1169) );
  INVX1 U1134 ( .A(n1316), .Y(n1170) );
  INVX2 U1135 ( .A(n1226), .Y(n1252) );
  INVX1 U1136 ( .A(n222), .Y(n221) );
  XOR2X1 U1137 ( .A(n711), .B(n615), .Y(n456) );
  NOR2X1 U1138 ( .A(n401), .B(n388), .Y(n1171) );
  XOR2X1 U1139 ( .A(n400), .B(n413), .Y(n1172) );
  XOR2X1 U1140 ( .A(n411), .B(n1172), .Y(n394) );
  NAND2X1 U1141 ( .A(n411), .B(n400), .Y(n1173) );
  NAND2X1 U1142 ( .A(n411), .B(n413), .Y(n1174) );
  NAND2X1 U1143 ( .A(n400), .B(n413), .Y(n1175) );
  NAND3X1 U1144 ( .A(n1174), .B(n1173), .C(n1175), .Y(n393) );
  XOR2X1 U1145 ( .A(n490), .B(n488), .Y(n1176) );
  XOR2X1 U1146 ( .A(n495), .B(n1176), .Y(n484) );
  NAND2X1 U1147 ( .A(n495), .B(n490), .Y(n1177) );
  NAND2X1 U1148 ( .A(n495), .B(n488), .Y(n1178) );
  NAND2X1 U1149 ( .A(n490), .B(n488), .Y(n1179) );
  NAND3X1 U1150 ( .A(n1178), .B(n1177), .C(n1179), .Y(n483) );
  BUFX4 U1151 ( .A(n1075), .Y(n1180) );
  BUFX4 U1152 ( .A(n1075), .Y(n1181) );
  INVX1 U1153 ( .A(n202), .Y(n1182) );
  XOR2X1 U1154 ( .A(n658), .B(n610), .Y(n1183) );
  XOR2X1 U1155 ( .A(n1183), .B(n642), .Y(n382) );
  NAND2X1 U1156 ( .A(n658), .B(n1191), .Y(n1184) );
  NAND2X1 U1157 ( .A(n658), .B(n642), .Y(n1185) );
  NAND2X1 U1158 ( .A(n1191), .B(n642), .Y(n1186) );
  NAND3X1 U1159 ( .A(n1184), .B(n1185), .C(n1186), .Y(n381) );
  XOR2X1 U1160 ( .A(n1005), .B(n1028), .Y(n1187) );
  XOR2X1 U1161 ( .A(n1187), .B(n381), .Y(n366) );
  NAND2X1 U1162 ( .A(n1005), .B(n370), .Y(n1188) );
  NAND2X1 U1163 ( .A(n1005), .B(n381), .Y(n1189) );
  NAND2X1 U1164 ( .A(n370), .B(n381), .Y(n1190) );
  NAND3X1 U1165 ( .A(n1190), .B(n1189), .C(n1188), .Y(n365) );
  BUFX2 U1166 ( .A(n610), .Y(n1191) );
  INVX1 U1167 ( .A(n201), .Y(n1192) );
  XOR2X1 U1168 ( .A(n37), .B(a[29]), .Y(n1193) );
  XOR2X1 U1169 ( .A(n419), .B(n421), .Y(n1194) );
  XOR2X1 U1170 ( .A(n1194), .B(n408), .Y(n404) );
  NAND2X1 U1171 ( .A(n408), .B(n419), .Y(n1195) );
  NAND2X1 U1172 ( .A(n408), .B(n421), .Y(n1196) );
  NAND2X1 U1173 ( .A(n419), .B(n421), .Y(n1197) );
  NAND3X1 U1174 ( .A(n1196), .B(n1195), .C(n1197), .Y(n403) );
  INVX4 U1175 ( .A(n1306), .Y(n1307) );
  INVX1 U1176 ( .A(n917), .Y(n1199) );
  AOI22X1 U1177 ( .A(n1199), .B(n1200), .C(n1052), .D(n1075), .Y(n1198) );
  INVX1 U1178 ( .A(n1045), .Y(n1200) );
  NOR2X1 U1179 ( .A(n429), .B(n416), .Y(n1201) );
  NAND2X1 U1180 ( .A(n647), .B(n599), .Y(n1202) );
  NAND2X1 U1181 ( .A(n647), .B(n695), .Y(n1203) );
  NAND2X1 U1182 ( .A(n599), .B(n695), .Y(n1204) );
  NAND3X1 U1183 ( .A(n1203), .B(n1202), .C(n1204), .Y(n453) );
  OR2X2 U1184 ( .A(n481), .B(n470), .Y(n1208) );
  OR2X2 U1185 ( .A(n322), .B(n329), .Y(n1210) );
  OR2X2 U1186 ( .A(n302), .B(n307), .Y(n1211) );
  INVX4 U1187 ( .A(n1224), .Y(n1270) );
  AND2X1 U1188 ( .A(n572), .B(n725), .Y(n1222) );
  INVX2 U1189 ( .A(n884), .Y(n1290) );
  INVX2 U1190 ( .A(n882), .Y(n1294) );
  INVX2 U1191 ( .A(n878), .Y(n1302) );
  INVX2 U1192 ( .A(n883), .Y(n1292) );
  INVX2 U1193 ( .A(n881), .Y(n1296) );
  INVX2 U1194 ( .A(n887), .Y(n1284) );
  INVX2 U1195 ( .A(n287), .Y(n1206) );
  INVX1 U1196 ( .A(n1045), .Y(n1207) );
  AND2X2 U1197 ( .A(n481), .B(n470), .Y(n1209) );
  OR2X1 U1198 ( .A(n523), .B(n518), .Y(n1212) );
  AND2X2 U1199 ( .A(n491), .B(n482), .Y(n1213) );
  OR2X1 U1200 ( .A(n491), .B(n482), .Y(n1214) );
  AND2X2 U1201 ( .A(n523), .B(n518), .Y(n1215) );
  OR2X1 U1202 ( .A(n533), .B(n530), .Y(n1216) );
  AND2X2 U1203 ( .A(n533), .B(n530), .Y(n1217) );
  INVX4 U1204 ( .A(n1011), .Y(n1235) );
  OR2X1 U1205 ( .A(n539), .B(n538), .Y(n1218) );
  OR2X1 U1206 ( .A(n708), .B(n724), .Y(n1219) );
  AND2X2 U1207 ( .A(n708), .B(n724), .Y(n1220) );
  AND2X2 U1208 ( .A(n539), .B(n538), .Y(n1221) );
  XNOR2X1 U1209 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1210 ( .A(n782), .Y(n1238) );
  INVX2 U1211 ( .A(n781), .Y(n1240) );
  INVX2 U1212 ( .A(n545), .Y(n601) );
  INVX2 U1213 ( .A(n548), .Y(n619) );
  INVX2 U1214 ( .A(n1227), .Y(n1250) );
  INVX2 U1215 ( .A(n551), .Y(n637) );
  INVX4 U1216 ( .A(n1280), .Y(n1281) );
  INVX1 U1217 ( .A(n890), .Y(n1278) );
  XOR2X1 U1218 ( .A(n37), .B(a[29]), .Y(n1224) );
  XOR2X1 U1219 ( .A(n7), .B(a[19]), .Y(n1226) );
  AND2X2 U1220 ( .A(n9), .B(n899), .Y(n1227) );
  INVX1 U1221 ( .A(n1264), .Y(n1239) );
  INVX4 U1222 ( .A(n1318), .Y(n1317) );
  INVX4 U1223 ( .A(n1260), .Y(n1262) );
  INVX1 U1224 ( .A(n889), .Y(n1280) );
  BUFX2 U1225 ( .A(n1314), .Y(n1229) );
  INVX4 U1226 ( .A(n37), .Y(n1324) );
  INVX8 U1227 ( .A(n1324), .Y(n1323) );
  INVX2 U1228 ( .A(n1258), .Y(n1259) );
  INVX2 U1229 ( .A(n1053), .Y(n1263) );
  INVX1 U1230 ( .A(n213), .Y(n212) );
  INVX1 U1231 ( .A(n216), .Y(n290) );
  INVX2 U1232 ( .A(n1193), .Y(n1269) );
  INVX1 U1233 ( .A(n200), .Y(n202) );
  INVX1 U1234 ( .A(n1171), .Y(n286) );
  INVX1 U1235 ( .A(n199), .Y(n201) );
  BUFX4 U1236 ( .A(n53), .Y(n1233) );
  INVX1 U1237 ( .A(n31), .Y(n1236) );
  AOI22X1 U1238 ( .A(n1265), .B(n1238), .C(n1239), .D(n1240), .Y(n1237) );
  XOR2X1 U1239 ( .A(n352), .B(n354), .Y(n1241) );
  XOR2X1 U1240 ( .A(n363), .B(n1241), .Y(n350) );
  NAND2X1 U1241 ( .A(n363), .B(n352), .Y(n1242) );
  NAND2X1 U1242 ( .A(n363), .B(n354), .Y(n1243) );
  NAND2X1 U1243 ( .A(n352), .B(n354), .Y(n1244) );
  NAND3X1 U1244 ( .A(n1243), .B(n1242), .C(n1244), .Y(n349) );
  INVX4 U1245 ( .A(n30), .Y(n1260) );
  INVX1 U1246 ( .A(n194), .Y(n287) );
  INVX2 U1247 ( .A(n1226), .Y(n1251) );
  INVX1 U1248 ( .A(n1201), .Y(n288) );
  INVX1 U1249 ( .A(n166), .Y(n283) );
  INVX4 U1250 ( .A(n48), .Y(n1271) );
  INVX2 U1251 ( .A(n554), .Y(n655) );
  INVX1 U1252 ( .A(n177), .Y(n284) );
  INVX1 U1253 ( .A(n172), .Y(n174) );
  INVX1 U1254 ( .A(n171), .Y(n173) );
  INVX4 U1255 ( .A(n51), .Y(n1274) );
  INVX1 U1256 ( .A(n161), .Y(n282) );
  INVX1 U1257 ( .A(n1138), .Y(n156) );
  INVX4 U1258 ( .A(n18), .Y(n1253) );
  INVX8 U1259 ( .A(n1308), .Y(n918) );
  INVX8 U1260 ( .A(n1248), .Y(n1249) );
  INVX8 U1261 ( .A(n1260), .Y(n1261) );
  INVX8 U1262 ( .A(n1274), .Y(n1275) );
  INVX8 U1263 ( .A(n1306), .Y(n1308) );
  INVX8 U1264 ( .A(n13), .Y(n1316) );
  INVX8 U1265 ( .A(n19), .Y(n1318) );
  INVX2 U1266 ( .A(n101), .Y(n99) );
  INVX2 U1267 ( .A(n100), .Y(n98) );
  INVX2 U1268 ( .A(n94), .Y(n92) );
  INVX2 U1269 ( .A(n79), .Y(n77) );
  OAI22X1 U1270 ( .A(n1256), .B(n1318), .C(n1257), .D(n1318), .Y(n554) );
  OAI22X1 U1271 ( .A(n1007), .B(n1321), .C(n1262), .D(n1321), .Y(n551) );
  OAI22X1 U1272 ( .A(n1263), .B(n1236), .C(n1266), .D(n1236), .Y(n548) );
  OAI22X1 U1273 ( .A(n1267), .B(n1324), .C(n1268), .D(n1324), .Y(n545) );
  OAI22X1 U1274 ( .A(n1269), .B(n918), .C(n1272), .D(n918), .Y(n542) );
  INVX2 U1275 ( .A(n385), .Y(n386) );
  INVX2 U1276 ( .A(n359), .Y(n360) );
  INVX2 U1277 ( .A(n337), .Y(n338) );
  INVX2 U1278 ( .A(n319), .Y(n320) );
  INVX2 U1279 ( .A(n305), .Y(n306) );
  INVX2 U1280 ( .A(n295), .Y(n296) );
  INVX2 U1281 ( .A(n93), .Y(n91) );
  INVX2 U1282 ( .A(n84), .Y(n275) );
  INVX2 U1283 ( .A(n211), .Y(n209) );
  INVX2 U1284 ( .A(n210), .Y(n289) );
  INVX2 U1285 ( .A(n183), .Y(n181) );
  INVX2 U1286 ( .A(n182), .Y(n285) );
  INVX2 U1287 ( .A(n149), .Y(n151) );
  INVX2 U1288 ( .A(n148), .Y(n281) );
  INVX2 U1289 ( .A(n144), .Y(n142) );
  INVX2 U1290 ( .A(n129), .Y(n127) );
  INVX2 U1291 ( .A(n128), .Y(n126) );
  INVX2 U1292 ( .A(n122), .Y(n120) );
  INVX2 U1293 ( .A(n111), .Y(n109) );
  INVX2 U1294 ( .A(n105), .Y(n103) );
  INVX2 U1295 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n2, n7, n4, n10, 
        n6, src1_data[10:8], n16, src1_data[6], n14, src1_data[4:1], n15}), 
        .B({src2_data[16], src2_data[16], n9, src2_data[14:0]}), .CI(1'b0), 
        .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n2, n7, n4, n10, 
        n6, src1_data[10:8], n16, src1_data[6], n14, src1_data[4:1], n15}), 
        .B({src2_data[16], src2_data[16], n9, src2_data[14:0]}), .CI(1'b0), 
        .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:8], n16, src1_data[6:0], 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .b(src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  BUFX2 U3 ( .A(src1_data[0]), .Y(n15) );
  AND2X2 U4 ( .A(n21), .B(n20), .Y(n1) );
  BUFX2 U6 ( .A(src1_data[15]), .Y(n2) );
  INVX1 U7 ( .A(src1_data[13]), .Y(n3) );
  INVX2 U9 ( .A(n3), .Y(n4) );
  INVX1 U10 ( .A(src1_data[11]), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n6) );
  BUFX2 U12 ( .A(src1_data[14]), .Y(n7) );
  INVX1 U13 ( .A(src2_data[15]), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n9) );
  BUFX2 U15 ( .A(src1_data[12]), .Y(n10) );
  INVX1 U16 ( .A(large_sum[16]), .Y(n61) );
  NAND2X1 U17 ( .A(n22), .B(n1), .Y(overflow) );
  INVX2 U18 ( .A(n62), .Y(n57) );
  AND2X2 U19 ( .A(n24), .B(n23), .Y(n11) );
  AND2X2 U20 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n12) );
  AND2X2 U21 ( .A(alu_op[1]), .B(n23), .Y(n13) );
  BUFX2 U22 ( .A(src1_data[5]), .Y(n14) );
  INVX4 U23 ( .A(src1_data[7]), .Y(n17) );
  INVX8 U24 ( .A(n17), .Y(n16) );
  NAND2X1 U25 ( .A(N26), .B(n12), .Y(n22) );
  INVX2 U26 ( .A(alu_op[0]), .Y(n23) );
  XOR2X1 U27 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n18) );
  NAND2X1 U28 ( .A(n13), .B(n18), .Y(n21) );
  INVX2 U29 ( .A(alu_op[1]), .Y(n24) );
  NAND2X1 U30 ( .A(alu_op[0]), .B(n24), .Y(n62) );
  XOR2X1 U31 ( .A(large_sum[16]), .B(large_sum[17]), .Y(n19) );
  NAND2X1 U32 ( .A(n57), .B(n19), .Y(n20) );
  AOI22X1 U33 ( .A(n15), .B(n11), .C(full_mult[30]), .D(n12), .Y(n26) );
  AOI22X1 U34 ( .A(large_dif[0]), .B(n13), .C(large_sum[0]), .D(n57), .Y(n25)
         );
  NAND2X1 U35 ( .A(n26), .B(n25), .Y(result[0]) );
  AOI22X1 U36 ( .A(src1_data[1]), .B(n11), .C(full_mult[31]), .D(n12), .Y(n30)
         );
  AOI22X1 U37 ( .A(large_dif[1]), .B(n13), .C(large_sum[1]), .D(n57), .Y(n29)
         );
  NAND2X1 U38 ( .A(n30), .B(n29), .Y(result[1]) );
  AOI22X1 U39 ( .A(src1_data[2]), .B(n11), .C(full_mult[32]), .D(n12), .Y(n32)
         );
  AOI22X1 U40 ( .A(large_dif[2]), .B(n13), .C(large_sum[2]), .D(n57), .Y(n31)
         );
  NAND2X1 U41 ( .A(n32), .B(n31), .Y(result[2]) );
  AOI22X1 U42 ( .A(src1_data[3]), .B(n11), .C(full_mult[33]), .D(n12), .Y(n34)
         );
  AOI22X1 U43 ( .A(large_dif[3]), .B(n13), .C(large_sum[3]), .D(n57), .Y(n33)
         );
  NAND2X1 U44 ( .A(n34), .B(n33), .Y(result[3]) );
  AOI22X1 U45 ( .A(src1_data[4]), .B(n11), .C(full_mult[34]), .D(n12), .Y(n36)
         );
  AOI22X1 U46 ( .A(large_dif[4]), .B(n13), .C(large_sum[4]), .D(n57), .Y(n35)
         );
  NAND2X1 U47 ( .A(n36), .B(n35), .Y(result[4]) );
  AOI22X1 U48 ( .A(n14), .B(n11), .C(full_mult[35]), .D(n12), .Y(n38) );
  AOI22X1 U49 ( .A(large_dif[5]), .B(n13), .C(large_sum[5]), .D(n57), .Y(n37)
         );
  NAND2X1 U50 ( .A(n38), .B(n37), .Y(result[5]) );
  AOI22X1 U51 ( .A(src1_data[6]), .B(n11), .C(full_mult[36]), .D(n12), .Y(n40)
         );
  AOI22X1 U52 ( .A(large_dif[6]), .B(n13), .C(large_sum[6]), .D(n57), .Y(n39)
         );
  NAND2X1 U53 ( .A(n39), .B(n40), .Y(result[6]) );
  AOI22X1 U54 ( .A(n16), .B(n11), .C(full_mult[37]), .D(n12), .Y(n42) );
  AOI22X1 U55 ( .A(large_dif[7]), .B(n13), .C(large_sum[7]), .D(n57), .Y(n41)
         );
  NAND2X1 U56 ( .A(n41), .B(n42), .Y(result[7]) );
  AOI22X1 U57 ( .A(src1_data[8]), .B(n11), .C(full_mult[38]), .D(n12), .Y(n44)
         );
  AOI22X1 U58 ( .A(large_dif[8]), .B(n13), .C(large_sum[8]), .D(n57), .Y(n43)
         );
  NAND2X1 U59 ( .A(n43), .B(n44), .Y(result[8]) );
  AOI22X1 U60 ( .A(src1_data[9]), .B(n11), .C(full_mult[39]), .D(n12), .Y(n46)
         );
  AOI22X1 U61 ( .A(large_dif[9]), .B(n13), .C(large_sum[9]), .D(n57), .Y(n45)
         );
  NAND2X1 U62 ( .A(n46), .B(n45), .Y(result[9]) );
  AOI22X1 U63 ( .A(src1_data[10]), .B(n11), .C(full_mult[40]), .D(n12), .Y(n48) );
  AOI22X1 U64 ( .A(large_dif[10]), .B(n13), .C(large_sum[10]), .D(n57), .Y(n47) );
  NAND2X1 U65 ( .A(n47), .B(n48), .Y(result[10]) );
  AOI22X1 U66 ( .A(n6), .B(n11), .C(full_mult[41]), .D(n12), .Y(n50) );
  AOI22X1 U67 ( .A(large_dif[11]), .B(n13), .C(large_sum[11]), .D(n57), .Y(n49) );
  NAND2X1 U68 ( .A(n50), .B(n49), .Y(result[11]) );
  AOI22X1 U69 ( .A(n10), .B(n11), .C(full_mult[42]), .D(n12), .Y(n52) );
  AOI22X1 U70 ( .A(large_dif[12]), .B(n13), .C(large_sum[12]), .D(n57), .Y(n51) );
  NAND2X1 U71 ( .A(n52), .B(n51), .Y(result[12]) );
  AOI22X1 U72 ( .A(n4), .B(n11), .C(full_mult[43]), .D(n12), .Y(n54) );
  AOI22X1 U73 ( .A(large_dif[13]), .B(n13), .C(large_sum[13]), .D(n57), .Y(n53) );
  NAND2X1 U74 ( .A(n53), .B(n54), .Y(result[13]) );
  AOI22X1 U75 ( .A(n7), .B(n11), .C(full_mult[44]), .D(n12), .Y(n56) );
  AOI22X1 U76 ( .A(large_dif[14]), .B(n13), .C(large_sum[14]), .D(n57), .Y(n55) );
  NAND2X1 U77 ( .A(n55), .B(n56), .Y(result[14]) );
  AOI22X1 U78 ( .A(n2), .B(n11), .C(full_mult[45]), .D(n12), .Y(n59) );
  AOI22X1 U79 ( .A(large_dif[15]), .B(n13), .C(large_sum[15]), .D(n57), .Y(n58) );
  NAND2X1 U80 ( .A(n59), .B(n58), .Y(result[15]) );
  AOI22X1 U81 ( .A(src1_data[16]), .B(n11), .C(large_dif[16]), .D(n13), .Y(n60) );
  OAI21X1 U82 ( .A(n62), .B(n61), .C(n60), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n11), .Y(n46) );
  INVX1 U3 ( .A(n14), .Y(n40) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n22), .Y(n28) );
  INVX1 U9 ( .A(n18), .Y(n32) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U32 ( .A(n16), .Y(n36) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n22), .Y(n28) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n18), .Y(n32) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n22), .Y(n28) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n18), .Y(n32) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n22), .Y(n28) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n18), .Y(n32) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n22), .Y(n28) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n18), .Y(n32) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n758), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n755), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n757), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n758), .Y(n10) );
  NOR2X1 U29 ( .A(n756), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n755), .B(n757), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n754), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n746, n743, 
        n740, n737, n62, n732, n730, n727, n725, n722, n719, n716, n713, n710, 
        n707, n704}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n747), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n66, n72, n68, 
        n70, n734, n732, n77, n79, n81, n75, n718, n715, n712, n709, n706, 
        n704}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n747), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n746, n743, 
        n740, n737, n734, n732, n730, n727, n725, n722, n719, n716, n713, n710, 
        n707, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n748), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n745, n742, 
        n739, n736, n734, n732, n729, n727, n724, n721, n718, n715, n712, n709, 
        n706, n704}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n748), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n746, n743, 
        n740, n737, n734, n732, n730, n727, n725, n722, n719, n716, n713, n710, 
        n707, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n749), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n67, n73, n69, 
        n71, n734, n732, n78, n80, n82, n76, n718, n715, n712, n709, n706, 
        n704}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n749), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n746, n743, 
        n740, n737, n734, n732, n730, n727, n725, n722, n719, n716, n713, n710, 
        n707, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n750), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n66, n72, n68, 
        n70, n734, n732, n77, n79, n81, n75, n718, n715, n712, n709, n706, 
        n704}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n750), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n67, n73, n69, 
        n71, n734, n732, n78, n80, n82, n76, n719, n716, n713, n710, n707, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n751), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n745, n742, 
        n739, n736, n734, n732, n729, n79, n724, n721, n718, n715, n712, n709, 
        n706, n704}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n751), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n66, n72, 
        n68, n70, n734, n732, n77, n79, n81, n75, n719, n716, n713, n710, n707, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n752), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n67, n73, 
        n69, n71, n734, n732, n78, n80, n82, n76, n718, n715, n712, n709, n706, 
        n704}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n752), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n745, n742, 
        n739, n736, n734, n732, n729, n80, n724, n721, n719, n716, n713, n710, 
        n707, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n753), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n745, n72, 
        n68, n70, n734, n732, n77, n79, n81, n75, n718, n715, n712, n709, n706, 
        n704}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n753), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n67, n73, 
        n69, n71, n734, n732, n78, n80, n82, n76, n719, n716, n713, n710, n707, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n754), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n66, n742, 
        n739, n736, n734, n732, n729, n80, n724, n721, n718, n715, n712, n709, 
        n706, n704}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n380), .Y(n44) );
  INVX4 U3 ( .A(n414), .Y(n413) );
  INVX4 U4 ( .A(n434), .Y(n682) );
  INVX8 U5 ( .A(n682), .Y(n684) );
  INVX1 U31 ( .A(n679), .Y(n1) );
  INVX1 U32 ( .A(n679), .Y(n2) );
  INVX1 U33 ( .A(n679), .Y(n3) );
  INVX1 U34 ( .A(n679), .Y(n4) );
  INVX1 U35 ( .A(n679), .Y(n14) );
  INVX1 U36 ( .A(n679), .Y(n15) );
  INVX1 U37 ( .A(n681), .Y(n16) );
  INVX1 U38 ( .A(n681), .Y(n17) );
  INVX1 U39 ( .A(n681), .Y(n18) );
  INVX1 U40 ( .A(n681), .Y(n19) );
  INVX1 U41 ( .A(n681), .Y(n20) );
  INVX2 U42 ( .A(n681), .Y(n21) );
  INVX1 U43 ( .A(n680), .Y(n22) );
  INVX1 U44 ( .A(n680), .Y(n23) );
  INVX1 U45 ( .A(n680), .Y(n24) );
  INVX1 U46 ( .A(n680), .Y(n25) );
  INVX1 U47 ( .A(n680), .Y(n26) );
  INVX2 U48 ( .A(n680), .Y(n27) );
  INVX1 U49 ( .A(n433), .Y(n28) );
  INVX4 U50 ( .A(n433), .Y(n679) );
  BUFX4 U51 ( .A(n679), .Y(n681) );
  BUFX4 U52 ( .A(N16), .Y(n29) );
  INVX2 U53 ( .A(n693), .Y(n30) );
  INVX2 U54 ( .A(n693), .Y(n31) );
  INVX2 U55 ( .A(n693), .Y(n32) );
  INVX2 U56 ( .A(n693), .Y(n33) );
  INVX2 U57 ( .A(n693), .Y(n34) );
  INVX2 U58 ( .A(n693), .Y(n35) );
  INVX1 U59 ( .A(n693), .Y(n36) );
  BUFX2 U60 ( .A(n439), .Y(n37) );
  BUFX2 U61 ( .A(n439), .Y(n38) );
  BUFX2 U62 ( .A(n439), .Y(n39) );
  BUFX2 U63 ( .A(n439), .Y(n40) );
  BUFX2 U64 ( .A(n439), .Y(n41) );
  BUFX2 U65 ( .A(n439), .Y(n42) );
  BUFX2 U66 ( .A(n439), .Y(n43) );
  INVX4 U67 ( .A(n439), .Y(n693) );
  INVX4 U68 ( .A(n201), .Y(r1_data[6]) );
  INVX4 U69 ( .A(w_data[13]), .Y(n738) );
  INVX4 U70 ( .A(w_data[8]), .Y(n726) );
  INVX4 U71 ( .A(n440), .Y(n694) );
  INVX8 U72 ( .A(n694), .Y(n696) );
  INVX8 U73 ( .A(n694), .Y(n695) );
  INVX4 U74 ( .A(w_data[6]), .Y(n720) );
  INVX4 U75 ( .A(n689), .Y(n692) );
  INVX2 U76 ( .A(n29), .Y(n670) );
  INVX2 U77 ( .A(n108), .Y(n418) );
  INVX2 U78 ( .A(n395), .Y(n414) );
  BUFX2 U79 ( .A(n58), .Y(n46) );
  INVX2 U80 ( .A(n49), .Y(n50) );
  BUFX2 U81 ( .A(n116), .Y(n45) );
  INVX2 U82 ( .A(n438), .Y(n689) );
  INVX2 U83 ( .A(n441), .Y(n697) );
  INVX2 U84 ( .A(n689), .Y(n690) );
  BUFX2 U85 ( .A(n59), .Y(n51) );
  INVX2 U86 ( .A(n97), .Y(n386) );
  INVX2 U87 ( .A(n354), .Y(r1_data[15]) );
  INVX2 U88 ( .A(n697), .Y(n698) );
  INVX2 U89 ( .A(n90), .Y(r1_data[0]) );
  INVX2 U90 ( .A(n133), .Y(r1_data[2]) );
  INVX2 U91 ( .A(n286), .Y(r1_data[11]) );
  INVX2 U92 ( .A(n386), .Y(n388) );
  BUFX2 U93 ( .A(n57), .Y(n48) );
  INVX2 U94 ( .A(n714), .Y(n715) );
  INVX2 U95 ( .A(n714), .Y(n716) );
  INVX2 U96 ( .A(n396), .Y(n397) );
  INVX2 U97 ( .A(n102), .Y(n396) );
  BUFX4 U98 ( .A(n687), .Y(n47) );
  INVX2 U99 ( .A(n64), .Y(n74) );
  INVX8 U100 ( .A(n676), .Y(n677) );
  INVX8 U101 ( .A(n675), .Y(n678) );
  INVX4 U102 ( .A(n117), .Y(r1_data[1]) );
  INVX2 U103 ( .A(n420), .Y(n49) );
  AND2X2 U104 ( .A(N15), .B(N14), .Y(n52) );
  INVX1 U105 ( .A(n413), .Y(n53) );
  INVX2 U106 ( .A(n53), .Y(n54) );
  INVX1 U107 ( .A(n417), .Y(n55) );
  INVX8 U108 ( .A(N12), .Y(n381) );
  INVX2 U109 ( .A(n418), .Y(n56) );
  INVX1 U110 ( .A(n418), .Y(n57) );
  INVX8 U111 ( .A(n731), .Y(n732) );
  INVX4 U112 ( .A(n150), .Y(r1_data[3]) );
  INVX2 U113 ( .A(n385), .Y(n411) );
  INVX4 U114 ( .A(N11), .Y(n380) );
  NAND2X1 U115 ( .A(N12), .B(n411), .Y(n58) );
  NAND2X1 U116 ( .A(N12), .B(n411), .Y(n59) );
  INVX4 U117 ( .A(n252), .Y(r1_data[9]) );
  INVX4 U118 ( .A(n401), .Y(n60) );
  INVX1 U119 ( .A(n401), .Y(n404) );
  BUFX2 U120 ( .A(n399), .Y(n401) );
  INVX4 U121 ( .A(n682), .Y(n683) );
  INVX4 U122 ( .A(n320), .Y(r1_data[13]) );
  INVX4 U123 ( .A(n689), .Y(n691) );
  INVX4 U124 ( .A(n390), .Y(n391) );
  BUFX2 U125 ( .A(n405), .Y(n61) );
  INVX4 U126 ( .A(n402), .Y(n403) );
  INVX1 U127 ( .A(n733), .Y(n62) );
  INVX8 U128 ( .A(n733), .Y(n734) );
  INVX8 U129 ( .A(n104), .Y(n63) );
  INVX8 U130 ( .A(n63), .Y(n64) );
  INVX8 U131 ( .A(n63), .Y(n65) );
  INVX4 U132 ( .A(n337), .Y(r1_data[14]) );
  INVX2 U133 ( .A(n744), .Y(n66) );
  INVX2 U134 ( .A(n744), .Y(n67) );
  INVX4 U135 ( .A(w_data[15]), .Y(n744) );
  INVX2 U136 ( .A(n738), .Y(n68) );
  INVX2 U137 ( .A(n738), .Y(n69) );
  INVX2 U138 ( .A(n735), .Y(n70) );
  INVX2 U139 ( .A(n735), .Y(n71) );
  INVX4 U140 ( .A(w_data[12]), .Y(n735) );
  INVX4 U141 ( .A(w_data[10]), .Y(n731) );
  INVX2 U142 ( .A(n741), .Y(n72) );
  INVX2 U143 ( .A(n741), .Y(n73) );
  INVX4 U144 ( .A(w_data[14]), .Y(n741) );
  INVX4 U145 ( .A(w_data[11]), .Y(n733) );
  INVX2 U146 ( .A(n720), .Y(n75) );
  INVX2 U147 ( .A(n720), .Y(n76) );
  INVX2 U148 ( .A(n728), .Y(n77) );
  INVX2 U149 ( .A(n728), .Y(n78) );
  INVX4 U150 ( .A(w_data[9]), .Y(n728) );
  INVX2 U151 ( .A(n726), .Y(n79) );
  INVX2 U152 ( .A(n726), .Y(n80) );
  INVX2 U153 ( .A(n723), .Y(n81) );
  INVX2 U154 ( .A(n723), .Y(n82) );
  INVX4 U155 ( .A(w_data[7]), .Y(n723) );
  BUFX2 U156 ( .A(n54), .Y(n83) );
  INVX4 U157 ( .A(n414), .Y(n412) );
  INVX2 U158 ( .A(N17), .Y(n702) );
  INVX2 U159 ( .A(n435), .Y(n685) );
  INVX2 U160 ( .A(w_data[3]), .Y(n711) );
  INVX2 U161 ( .A(w_data[2]), .Y(n708) );
  INVX2 U162 ( .A(w_data[4]), .Y(n714) );
  INVX2 U163 ( .A(w_data[5]), .Y(n717) );
  INVX2 U164 ( .A(w_data[1]), .Y(n705) );
  INVX2 U165 ( .A(w_data[0]), .Y(n703) );
  INVX2 U166 ( .A(n393), .Y(n394) );
  BUFX2 U167 ( .A(n679), .Y(n680) );
  BUFX2 U168 ( .A(n674), .Y(n675) );
  INVX2 U169 ( .A(n702), .Y(n701) );
  INVX2 U170 ( .A(n702), .Y(n700) );
  INVX2 U171 ( .A(n393), .Y(n395) );
  INVX2 U172 ( .A(n685), .Y(n687) );
  INVX2 U173 ( .A(n685), .Y(n688) );
  INVX2 U174 ( .A(n685), .Y(n686) );
  INVX2 U175 ( .A(n99), .Y(n393) );
  INVX2 U176 ( .A(n738), .Y(n740) );
  INVX2 U177 ( .A(n744), .Y(n746) );
  INVX2 U178 ( .A(n738), .Y(n739) );
  INVX2 U179 ( .A(n744), .Y(n745) );
  INVX2 U180 ( .A(n735), .Y(n737) );
  INVX2 U181 ( .A(n735), .Y(n736) );
  INVX2 U182 ( .A(n741), .Y(n743) );
  INVX2 U183 ( .A(n723), .Y(n725) );
  INVX2 U184 ( .A(n726), .Y(n727) );
  INVX2 U185 ( .A(n741), .Y(n742) );
  INVX2 U186 ( .A(n728), .Y(n730) );
  INVX2 U187 ( .A(n720), .Y(n722) );
  INVX2 U188 ( .A(n723), .Y(n724) );
  INVX2 U189 ( .A(n728), .Y(n729) );
  INVX2 U190 ( .A(n720), .Y(n721) );
  INVX2 U191 ( .A(n711), .Y(n713) );
  INVX2 U192 ( .A(n708), .Y(n710) );
  INVX2 U193 ( .A(n711), .Y(n712) );
  INVX2 U194 ( .A(n708), .Y(n709) );
  INVX2 U195 ( .A(n717), .Y(n719) );
  INVX2 U196 ( .A(n717), .Y(n718) );
  INVX2 U197 ( .A(n705), .Y(n707) );
  INVX2 U198 ( .A(n705), .Y(n706) );
  INVX2 U199 ( .A(n703), .Y(n704) );
  BUFX2 U200 ( .A(n_reset), .Y(n747) );
  BUFX2 U201 ( .A(n_reset), .Y(n748) );
  BUFX2 U202 ( .A(n_reset), .Y(n749) );
  BUFX2 U203 ( .A(n_reset), .Y(n750) );
  BUFX2 U204 ( .A(n_reset), .Y(n751) );
  BUFX2 U205 ( .A(n_reset), .Y(n752) );
  BUFX2 U206 ( .A(n_reset), .Y(n753) );
  BUFX2 U207 ( .A(n_reset), .Y(n754) );
  AOI22X1 U208 ( .A(n87), .B(n86), .C(n85), .D(n84), .Y(n88) );
  INVX2 U209 ( .A(N13), .Y(n89) );
  INVX2 U210 ( .A(n88), .Y(r1_data[16]) );
  AOI22X1 U211 ( .A(n91), .B(n92), .C(n93), .D(n94), .Y(n90) );
  NOR2X1 U212 ( .A(n95), .B(n96), .Y(n94) );
  OAI22X1 U213 ( .A(\regs_matrix[6][0] ), .B(n387), .C(outreg_data[0]), .D(
        n392), .Y(n96) );
  OAI21X1 U214 ( .A(\regs_matrix[4][0] ), .B(n412), .C(n89), .Y(n95) );
  NOR2X1 U215 ( .A(n100), .B(n101), .Y(n93) );
  OAI21X1 U216 ( .A(\regs_matrix[7][0] ), .B(n397), .C(n103), .Y(n101) );
  AOI22X1 U217 ( .A(n65), .B(n105), .C(n106), .D(n408), .Y(n103) );
  INVX2 U218 ( .A(\regs_matrix[3][0] ), .Y(n106) );
  INVX2 U219 ( .A(\regs_matrix[1][0] ), .Y(n105) );
  OAI22X1 U220 ( .A(\regs_matrix[2][0] ), .B(n403), .C(\regs_matrix[5][0] ), 
        .D(n415), .Y(n100) );
  NOR2X1 U221 ( .A(n109), .B(n110), .Y(n92) );
  OAI22X1 U222 ( .A(\regs_matrix[14][0] ), .B(n388), .C(\regs_matrix[8][0] ), 
        .D(n392), .Y(n110) );
  OAI21X1 U223 ( .A(\regs_matrix[12][0] ), .B(n54), .C(N13), .Y(n109) );
  NOR2X1 U224 ( .A(n111), .B(n112), .Y(n91) );
  OAI21X1 U225 ( .A(\regs_matrix[15][0] ), .B(n407), .C(n113), .Y(n112) );
  AOI22X1 U226 ( .A(n410), .B(n114), .C(n406), .D(n115), .Y(n113) );
  INVX2 U227 ( .A(\regs_matrix[11][0] ), .Y(n115) );
  INVX2 U228 ( .A(\regs_matrix[9][0] ), .Y(n114) );
  OAI22X1 U229 ( .A(\regs_matrix[10][0] ), .B(n61), .C(\regs_matrix[13][0] ), 
        .D(n416), .Y(n111) );
  AOI22X1 U230 ( .A(n118), .B(n119), .C(n120), .D(n121), .Y(n117) );
  NOR2X1 U231 ( .A(n122), .B(n123), .Y(n121) );
  OAI22X1 U232 ( .A(\regs_matrix[8][1] ), .B(n392), .C(\regs_matrix[10][1] ), 
        .D(n405), .Y(n123) );
  OAI22X1 U233 ( .A(\regs_matrix[12][1] ), .B(n54), .C(\regs_matrix[14][1] ), 
        .D(n388), .Y(n122) );
  NOR3X1 U234 ( .A(n124), .B(n125), .C(n126), .Y(n120) );
  OAI21X1 U235 ( .A(\regs_matrix[9][1] ), .B(n398), .C(N13), .Y(n126) );
  NOR2X1 U236 ( .A(\regs_matrix[11][1] ), .B(n409), .Y(n125) );
  OAI22X1 U237 ( .A(\regs_matrix[13][1] ), .B(n415), .C(\regs_matrix[15][1] ), 
        .D(n407), .Y(n124) );
  NOR2X1 U238 ( .A(n128), .B(n129), .Y(n119) );
  OAI22X1 U239 ( .A(outreg_data[1]), .B(n392), .C(\regs_matrix[2][1] ), .D(
        n405), .Y(n129) );
  OAI22X1 U240 ( .A(\regs_matrix[4][1] ), .B(n413), .C(\regs_matrix[6][1] ), 
        .D(n387), .Y(n128) );
  NOR3X1 U241 ( .A(n130), .B(n131), .C(n132), .Y(n118) );
  OAI21X1 U242 ( .A(\regs_matrix[1][1] ), .B(n74), .C(n89), .Y(n132) );
  NOR2X1 U243 ( .A(\regs_matrix[3][1] ), .B(n50), .Y(n131) );
  OAI22X1 U244 ( .A(\regs_matrix[5][1] ), .B(n56), .C(\regs_matrix[7][1] ), 
        .D(n51), .Y(n130) );
  AOI22X1 U245 ( .A(n134), .B(n135), .C(n136), .D(n137), .Y(n133) );
  NOR2X1 U246 ( .A(n138), .B(n139), .Y(n137) );
  OAI22X1 U247 ( .A(outreg_data[2]), .B(n392), .C(\regs_matrix[2][2] ), .D(
        n405), .Y(n139) );
  OAI22X1 U248 ( .A(\regs_matrix[4][2] ), .B(n412), .C(\regs_matrix[6][2] ), 
        .D(n387), .Y(n138) );
  NOR2X1 U249 ( .A(n140), .B(n141), .Y(n136) );
  OAI21X1 U250 ( .A(\regs_matrix[3][2] ), .B(n419), .C(n142), .Y(n141) );
  AOI21X1 U251 ( .A(n64), .B(n143), .C(N13), .Y(n142) );
  INVX2 U252 ( .A(\regs_matrix[1][2] ), .Y(n143) );
  OAI22X1 U253 ( .A(\regs_matrix[5][2] ), .B(n417), .C(\regs_matrix[7][2] ), 
        .D(n46), .Y(n140) );
  NOR2X1 U254 ( .A(n144), .B(n145), .Y(n135) );
  OAI22X1 U255 ( .A(\regs_matrix[8][2] ), .B(n392), .C(\regs_matrix[10][2] ), 
        .D(n405), .Y(n145) );
  OAI22X1 U256 ( .A(\regs_matrix[12][2] ), .B(n54), .C(\regs_matrix[14][2] ), 
        .D(n388), .Y(n144) );
  NOR2X1 U257 ( .A(n146), .B(n147), .Y(n134) );
  OAI21X1 U258 ( .A(\regs_matrix[11][2] ), .B(n409), .C(n148), .Y(n147) );
  AOI21X1 U259 ( .A(n410), .B(n149), .C(n89), .Y(n148) );
  INVX2 U260 ( .A(\regs_matrix[9][2] ), .Y(n149) );
  OAI22X1 U261 ( .A(\regs_matrix[13][2] ), .B(n417), .C(\regs_matrix[15][2] ), 
        .D(n407), .Y(n146) );
  AOI22X1 U262 ( .A(n151), .B(n152), .C(n153), .D(n154), .Y(n150) );
  NOR2X1 U263 ( .A(n155), .B(n156), .Y(n154) );
  OAI22X1 U264 ( .A(outreg_data[3]), .B(n391), .C(\regs_matrix[2][3] ), .D(
        n405), .Y(n156) );
  OAI22X1 U265 ( .A(\regs_matrix[4][3] ), .B(n413), .C(\regs_matrix[6][3] ), 
        .D(n387), .Y(n155) );
  NOR2X1 U266 ( .A(n158), .B(n157), .Y(n153) );
  OAI21X1 U267 ( .A(\regs_matrix[3][3] ), .B(n419), .C(n159), .Y(n158) );
  AOI21X1 U268 ( .A(n65), .B(n160), .C(N13), .Y(n159) );
  INVX2 U269 ( .A(\regs_matrix[1][3] ), .Y(n160) );
  OAI22X1 U270 ( .A(\regs_matrix[5][3] ), .B(n417), .C(\regs_matrix[7][3] ), 
        .D(n51), .Y(n157) );
  NOR2X1 U271 ( .A(n161), .B(n162), .Y(n152) );
  OAI22X1 U272 ( .A(\regs_matrix[8][3] ), .B(n392), .C(\regs_matrix[10][3] ), 
        .D(n405), .Y(n162) );
  OAI22X1 U273 ( .A(\regs_matrix[12][3] ), .B(n54), .C(\regs_matrix[14][3] ), 
        .D(n388), .Y(n161) );
  NOR2X1 U274 ( .A(n163), .B(n164), .Y(n151) );
  OAI21X1 U275 ( .A(\regs_matrix[11][3] ), .B(n409), .C(n165), .Y(n164) );
  AOI21X1 U276 ( .A(n410), .B(n166), .C(n89), .Y(n165) );
  INVX2 U277 ( .A(\regs_matrix[9][3] ), .Y(n166) );
  OAI22X1 U278 ( .A(\regs_matrix[13][3] ), .B(n415), .C(\regs_matrix[15][3] ), 
        .D(n407), .Y(n163) );
  AOI22X1 U279 ( .A(n168), .B(n169), .C(n170), .D(n171), .Y(n167) );
  NOR2X1 U280 ( .A(n172), .B(n173), .Y(n171) );
  OAI22X1 U281 ( .A(outreg_data[4]), .B(n391), .C(\regs_matrix[2][4] ), .D(n60), .Y(n173) );
  OAI22X1 U282 ( .A(\regs_matrix[4][4] ), .B(n412), .C(\regs_matrix[6][4] ), 
        .D(n389), .Y(n172) );
  NOR2X1 U283 ( .A(n174), .B(n175), .Y(n170) );
  OAI21X1 U284 ( .A(\regs_matrix[3][4] ), .B(n419), .C(n176), .Y(n175) );
  AOI21X1 U285 ( .A(n64), .B(n177), .C(N13), .Y(n176) );
  INVX2 U286 ( .A(\regs_matrix[1][4] ), .Y(n177) );
  OAI22X1 U287 ( .A(\regs_matrix[5][4] ), .B(n415), .C(\regs_matrix[7][4] ), 
        .D(n51), .Y(n174) );
  NOR2X1 U288 ( .A(n178), .B(n179), .Y(n169) );
  OAI22X1 U289 ( .A(\regs_matrix[8][4] ), .B(n392), .C(\regs_matrix[10][4] ), 
        .D(n405), .Y(n179) );
  OAI22X1 U290 ( .A(\regs_matrix[12][4] ), .B(n54), .C(\regs_matrix[14][4] ), 
        .D(n388), .Y(n178) );
  NOR2X1 U291 ( .A(n180), .B(n181), .Y(n168) );
  OAI21X1 U292 ( .A(\regs_matrix[11][4] ), .B(n409), .C(n182), .Y(n181) );
  AOI21X1 U293 ( .A(n410), .B(n183), .C(n89), .Y(n182) );
  INVX2 U294 ( .A(\regs_matrix[9][4] ), .Y(n183) );
  OAI22X1 U295 ( .A(\regs_matrix[13][4] ), .B(n415), .C(\regs_matrix[15][4] ), 
        .D(n407), .Y(n180) );
  AOI22X1 U296 ( .A(n185), .B(n186), .C(n187), .D(n188), .Y(n184) );
  NOR2X1 U297 ( .A(n189), .B(n190), .Y(n188) );
  OAI22X1 U298 ( .A(outreg_data[5]), .B(n391), .C(\regs_matrix[2][5] ), .D(
        n405), .Y(n190) );
  OAI22X1 U299 ( .A(\regs_matrix[4][5] ), .B(n412), .C(\regs_matrix[6][5] ), 
        .D(n387), .Y(n189) );
  NOR2X1 U300 ( .A(n192), .B(n191), .Y(n187) );
  OAI21X1 U301 ( .A(\regs_matrix[3][5] ), .B(n419), .C(n193), .Y(n192) );
  AOI21X1 U302 ( .A(n65), .B(n194), .C(N13), .Y(n193) );
  INVX2 U303 ( .A(\regs_matrix[1][5] ), .Y(n194) );
  OAI22X1 U304 ( .A(\regs_matrix[5][5] ), .B(n415), .C(\regs_matrix[7][5] ), 
        .D(n102), .Y(n191) );
  NOR2X1 U305 ( .A(n195), .B(n196), .Y(n186) );
  OAI22X1 U306 ( .A(\regs_matrix[8][5] ), .B(n392), .C(\regs_matrix[10][5] ), 
        .D(n405), .Y(n196) );
  OAI22X1 U307 ( .A(\regs_matrix[12][5] ), .B(n54), .C(\regs_matrix[14][5] ), 
        .D(n388), .Y(n195) );
  NOR2X1 U308 ( .A(n197), .B(n198), .Y(n185) );
  OAI21X1 U309 ( .A(\regs_matrix[11][5] ), .B(n409), .C(n199), .Y(n198) );
  AOI21X1 U310 ( .A(n410), .B(n200), .C(n89), .Y(n199) );
  INVX2 U311 ( .A(\regs_matrix[9][5] ), .Y(n200) );
  OAI22X1 U312 ( .A(\regs_matrix[13][5] ), .B(n417), .C(\regs_matrix[15][5] ), 
        .D(n407), .Y(n197) );
  AOI22X1 U313 ( .A(n202), .B(n203), .C(n204), .D(n205), .Y(n201) );
  NOR2X1 U314 ( .A(n206), .B(n207), .Y(n205) );
  OAI22X1 U315 ( .A(outreg_data[6]), .B(n392), .C(\regs_matrix[2][6] ), .D(
        n405), .Y(n207) );
  OAI22X1 U316 ( .A(\regs_matrix[4][6] ), .B(n412), .C(\regs_matrix[6][6] ), 
        .D(n387), .Y(n206) );
  NOR2X1 U317 ( .A(n209), .B(n208), .Y(n204) );
  OAI21X1 U318 ( .A(\regs_matrix[3][6] ), .B(n45), .C(n210), .Y(n209) );
  AOI21X1 U319 ( .A(n64), .B(n211), .C(N13), .Y(n210) );
  INVX2 U320 ( .A(\regs_matrix[1][6] ), .Y(n211) );
  OAI22X1 U321 ( .A(\regs_matrix[5][6] ), .B(n48), .C(\regs_matrix[7][6] ), 
        .D(n397), .Y(n208) );
  NOR2X1 U322 ( .A(n212), .B(n213), .Y(n203) );
  OAI22X1 U323 ( .A(\regs_matrix[8][6] ), .B(n392), .C(\regs_matrix[10][6] ), 
        .D(n405), .Y(n213) );
  OAI22X1 U324 ( .A(\regs_matrix[12][6] ), .B(n54), .C(\regs_matrix[14][6] ), 
        .D(n388), .Y(n212) );
  NOR2X1 U325 ( .A(n214), .B(n215), .Y(n202) );
  OAI21X1 U326 ( .A(\regs_matrix[11][6] ), .B(n409), .C(n216), .Y(n215) );
  AOI21X1 U327 ( .A(n410), .B(n217), .C(n89), .Y(n216) );
  INVX2 U328 ( .A(\regs_matrix[9][6] ), .Y(n217) );
  OAI22X1 U329 ( .A(\regs_matrix[13][6] ), .B(n416), .C(\regs_matrix[15][6] ), 
        .D(n407), .Y(n214) );
  INVX2 U330 ( .A(n218), .Y(r1_data[7]) );
  AOI22X1 U331 ( .A(n219), .B(n220), .C(n221), .D(n222), .Y(n218) );
  NOR2X1 U332 ( .A(n223), .B(n224), .Y(n222) );
  OAI22X1 U333 ( .A(outreg_data[7]), .B(n391), .C(\regs_matrix[2][7] ), .D(
        n405), .Y(n224) );
  OAI22X1 U334 ( .A(\regs_matrix[4][7] ), .B(n394), .C(\regs_matrix[6][7] ), 
        .D(n389), .Y(n223) );
  NOR2X1 U335 ( .A(n225), .B(n226), .Y(n221) );
  OAI21X1 U336 ( .A(\regs_matrix[3][7] ), .B(n50), .C(n227), .Y(n226) );
  AOI21X1 U337 ( .A(n65), .B(n228), .C(N13), .Y(n227) );
  INVX2 U338 ( .A(\regs_matrix[1][7] ), .Y(n228) );
  OAI22X1 U339 ( .A(\regs_matrix[5][7] ), .B(n417), .C(\regs_matrix[7][7] ), 
        .D(n46), .Y(n225) );
  NOR2X1 U340 ( .A(n229), .B(n230), .Y(n220) );
  OAI22X1 U341 ( .A(\regs_matrix[8][7] ), .B(n392), .C(\regs_matrix[10][7] ), 
        .D(n61), .Y(n230) );
  OAI22X1 U342 ( .A(\regs_matrix[12][7] ), .B(n54), .C(\regs_matrix[14][7] ), 
        .D(n388), .Y(n229) );
  NOR2X1 U343 ( .A(n231), .B(n232), .Y(n219) );
  OAI21X1 U344 ( .A(\regs_matrix[11][7] ), .B(n409), .C(n233), .Y(n232) );
  AOI21X1 U345 ( .A(n410), .B(n234), .C(n89), .Y(n233) );
  INVX2 U346 ( .A(\regs_matrix[9][7] ), .Y(n234) );
  OAI22X1 U347 ( .A(\regs_matrix[13][7] ), .B(n416), .C(\regs_matrix[15][7] ), 
        .D(n407), .Y(n231) );
  AOI22X1 U348 ( .A(n236), .B(n237), .C(n238), .D(n239), .Y(n235) );
  NOR2X1 U349 ( .A(n240), .B(n241), .Y(n239) );
  OAI22X1 U350 ( .A(outreg_data[8]), .B(n392), .C(\regs_matrix[2][8] ), .D(n60), .Y(n241) );
  OAI22X1 U351 ( .A(\regs_matrix[4][8] ), .B(n413), .C(\regs_matrix[6][8] ), 
        .D(n387), .Y(n240) );
  NOR2X1 U352 ( .A(n242), .B(n243), .Y(n238) );
  OAI21X1 U353 ( .A(\regs_matrix[3][8] ), .B(n50), .C(n244), .Y(n243) );
  AOI21X1 U354 ( .A(n64), .B(n245), .C(N13), .Y(n244) );
  INVX2 U355 ( .A(\regs_matrix[1][8] ), .Y(n245) );
  OAI22X1 U356 ( .A(\regs_matrix[5][8] ), .B(n48), .C(\regs_matrix[7][8] ), 
        .D(n102), .Y(n242) );
  NOR2X1 U357 ( .A(n246), .B(n247), .Y(n237) );
  OAI22X1 U358 ( .A(\regs_matrix[8][8] ), .B(n392), .C(\regs_matrix[10][8] ), 
        .D(n61), .Y(n247) );
  OAI22X1 U359 ( .A(\regs_matrix[12][8] ), .B(n54), .C(\regs_matrix[14][8] ), 
        .D(n388), .Y(n246) );
  NOR2X1 U360 ( .A(n248), .B(n249), .Y(n236) );
  OAI21X1 U361 ( .A(\regs_matrix[11][8] ), .B(n409), .C(n250), .Y(n249) );
  AOI21X1 U362 ( .A(n410), .B(n251), .C(n89), .Y(n250) );
  INVX2 U363 ( .A(\regs_matrix[9][8] ), .Y(n251) );
  OAI22X1 U364 ( .A(\regs_matrix[13][8] ), .B(n416), .C(\regs_matrix[15][8] ), 
        .D(n407), .Y(n248) );
  AOI22X1 U365 ( .A(n253), .B(n254), .C(n255), .D(n256), .Y(n252) );
  NOR2X1 U366 ( .A(n257), .B(n258), .Y(n256) );
  OAI22X1 U367 ( .A(outreg_data[9]), .B(n391), .C(\regs_matrix[2][9] ), .D(
        n403), .Y(n258) );
  OAI22X1 U368 ( .A(\regs_matrix[4][9] ), .B(n394), .C(\regs_matrix[6][9] ), 
        .D(n389), .Y(n257) );
  NOR2X1 U369 ( .A(n259), .B(n260), .Y(n255) );
  OAI21X1 U370 ( .A(\regs_matrix[3][9] ), .B(n45), .C(n261), .Y(n260) );
  AOI21X1 U371 ( .A(n64), .B(n262), .C(N13), .Y(n261) );
  INVX2 U372 ( .A(\regs_matrix[1][9] ), .Y(n262) );
  OAI22X1 U373 ( .A(\regs_matrix[5][9] ), .B(n415), .C(\regs_matrix[7][9] ), 
        .D(n46), .Y(n259) );
  NOR2X1 U374 ( .A(n263), .B(n264), .Y(n254) );
  OAI22X1 U375 ( .A(\regs_matrix[8][9] ), .B(n392), .C(\regs_matrix[10][9] ), 
        .D(n61), .Y(n264) );
  OAI22X1 U376 ( .A(\regs_matrix[12][9] ), .B(n54), .C(\regs_matrix[14][9] ), 
        .D(n388), .Y(n263) );
  NOR2X1 U377 ( .A(n265), .B(n266), .Y(n253) );
  OAI21X1 U378 ( .A(\regs_matrix[11][9] ), .B(n409), .C(n267), .Y(n266) );
  AOI21X1 U379 ( .A(n410), .B(n268), .C(n89), .Y(n267) );
  INVX2 U380 ( .A(\regs_matrix[9][9] ), .Y(n268) );
  OAI22X1 U381 ( .A(\regs_matrix[13][9] ), .B(n416), .C(\regs_matrix[15][9] ), 
        .D(n407), .Y(n265) );
  AOI22X1 U382 ( .A(n270), .B(n271), .C(n272), .D(n273), .Y(n269) );
  NOR2X1 U383 ( .A(n274), .B(n275), .Y(n273) );
  OAI22X1 U384 ( .A(outreg_data[10]), .B(n391), .C(\regs_matrix[2][10] ), .D(
        n60), .Y(n275) );
  OAI22X1 U385 ( .A(\regs_matrix[4][10] ), .B(n394), .C(\regs_matrix[6][10] ), 
        .D(n389), .Y(n274) );
  NOR2X1 U386 ( .A(n276), .B(n277), .Y(n272) );
  OAI21X1 U387 ( .A(\regs_matrix[3][10] ), .B(n419), .C(n278), .Y(n277) );
  AOI21X1 U388 ( .A(n65), .B(n279), .C(N13), .Y(n278) );
  INVX2 U389 ( .A(\regs_matrix[1][10] ), .Y(n279) );
  OAI22X1 U390 ( .A(\regs_matrix[5][10] ), .B(n415), .C(\regs_matrix[7][10] ), 
        .D(n51), .Y(n276) );
  NOR2X1 U391 ( .A(n280), .B(n281), .Y(n271) );
  OAI22X1 U392 ( .A(\regs_matrix[8][10] ), .B(n392), .C(\regs_matrix[10][10] ), 
        .D(n61), .Y(n281) );
  OAI22X1 U393 ( .A(\regs_matrix[12][10] ), .B(n54), .C(\regs_matrix[14][10] ), 
        .D(n388), .Y(n280) );
  NOR2X1 U394 ( .A(n282), .B(n283), .Y(n270) );
  OAI21X1 U395 ( .A(\regs_matrix[11][10] ), .B(n409), .C(n284), .Y(n283) );
  AOI21X1 U396 ( .A(n410), .B(n285), .C(n89), .Y(n284) );
  INVX2 U397 ( .A(\regs_matrix[9][10] ), .Y(n285) );
  OAI22X1 U398 ( .A(\regs_matrix[13][10] ), .B(n416), .C(\regs_matrix[15][10] ), .D(n407), .Y(n282) );
  AOI22X1 U399 ( .A(n287), .B(n288), .C(n289), .D(n290), .Y(n286) );
  NOR2X1 U400 ( .A(n291), .B(n292), .Y(n290) );
  OAI22X1 U401 ( .A(outreg_data[11]), .B(n391), .C(\regs_matrix[2][11] ), .D(
        n404), .Y(n292) );
  OAI22X1 U402 ( .A(\regs_matrix[4][11] ), .B(n413), .C(\regs_matrix[6][11] ), 
        .D(n389), .Y(n291) );
  NOR2X1 U403 ( .A(n293), .B(n294), .Y(n289) );
  OAI21X1 U404 ( .A(\regs_matrix[3][11] ), .B(n50), .C(n295), .Y(n294) );
  AOI21X1 U405 ( .A(n64), .B(n296), .C(N13), .Y(n295) );
  INVX2 U406 ( .A(\regs_matrix[1][11] ), .Y(n296) );
  OAI22X1 U407 ( .A(\regs_matrix[5][11] ), .B(n417), .C(\regs_matrix[7][11] ), 
        .D(n46), .Y(n293) );
  NOR2X1 U408 ( .A(n297), .B(n298), .Y(n288) );
  OAI22X1 U409 ( .A(\regs_matrix[8][11] ), .B(n392), .C(\regs_matrix[10][11] ), 
        .D(n61), .Y(n298) );
  OAI22X1 U410 ( .A(\regs_matrix[12][11] ), .B(n54), .C(\regs_matrix[14][11] ), 
        .D(n388), .Y(n297) );
  NOR2X1 U411 ( .A(n299), .B(n300), .Y(n287) );
  OAI21X1 U412 ( .A(\regs_matrix[11][11] ), .B(n409), .C(n301), .Y(n300) );
  AOI21X1 U413 ( .A(n410), .B(n302), .C(n89), .Y(n301) );
  INVX2 U414 ( .A(\regs_matrix[9][11] ), .Y(n302) );
  OAI22X1 U415 ( .A(\regs_matrix[13][11] ), .B(n416), .C(\regs_matrix[15][11] ), .D(n407), .Y(n299) );
  AOI22X1 U416 ( .A(n304), .B(n305), .C(n306), .D(n307), .Y(n303) );
  NOR2X1 U417 ( .A(n308), .B(n309), .Y(n307) );
  OAI22X1 U418 ( .A(outreg_data[12]), .B(n392), .C(\regs_matrix[2][12] ), .D(
        n60), .Y(n309) );
  OAI22X1 U419 ( .A(\regs_matrix[4][12] ), .B(n394), .C(\regs_matrix[6][12] ), 
        .D(n387), .Y(n308) );
  NOR2X1 U420 ( .A(n310), .B(n311), .Y(n306) );
  OAI21X1 U421 ( .A(\regs_matrix[3][12] ), .B(n45), .C(n312), .Y(n311) );
  AOI21X1 U422 ( .A(n65), .B(n313), .C(N13), .Y(n312) );
  INVX2 U423 ( .A(\regs_matrix[1][12] ), .Y(n313) );
  OAI22X1 U424 ( .A(\regs_matrix[5][12] ), .B(n415), .C(\regs_matrix[7][12] ), 
        .D(n51), .Y(n310) );
  NOR2X1 U425 ( .A(n314), .B(n315), .Y(n305) );
  OAI22X1 U426 ( .A(\regs_matrix[8][12] ), .B(n392), .C(\regs_matrix[10][12] ), 
        .D(n61), .Y(n315) );
  OAI22X1 U427 ( .A(\regs_matrix[12][12] ), .B(n54), .C(\regs_matrix[14][12] ), 
        .D(n388), .Y(n314) );
  NOR2X1 U428 ( .A(n316), .B(n317), .Y(n304) );
  OAI21X1 U429 ( .A(\regs_matrix[11][12] ), .B(n409), .C(n318), .Y(n317) );
  AOI21X1 U430 ( .A(n410), .B(n319), .C(n89), .Y(n318) );
  INVX2 U431 ( .A(\regs_matrix[9][12] ), .Y(n319) );
  OAI22X1 U432 ( .A(\regs_matrix[13][12] ), .B(n416), .C(\regs_matrix[15][12] ), .D(n407), .Y(n316) );
  AOI22X1 U433 ( .A(n321), .B(n322), .C(n323), .D(n324), .Y(n320) );
  NOR2X1 U434 ( .A(n325), .B(n326), .Y(n324) );
  OAI22X1 U435 ( .A(outreg_data[13]), .B(n391), .C(\regs_matrix[2][13] ), .D(
        n60), .Y(n326) );
  OAI22X1 U436 ( .A(\regs_matrix[4][13] ), .B(n394), .C(\regs_matrix[6][13] ), 
        .D(n389), .Y(n325) );
  NOR2X1 U437 ( .A(n327), .B(n328), .Y(n323) );
  OAI21X1 U438 ( .A(\regs_matrix[3][13] ), .B(n419), .C(n329), .Y(n328) );
  AOI21X1 U439 ( .A(n65), .B(n330), .C(N13), .Y(n329) );
  INVX2 U440 ( .A(\regs_matrix[1][13] ), .Y(n330) );
  OAI22X1 U441 ( .A(\regs_matrix[5][13] ), .B(n415), .C(\regs_matrix[7][13] ), 
        .D(n46), .Y(n327) );
  NOR2X1 U442 ( .A(n331), .B(n332), .Y(n322) );
  OAI22X1 U443 ( .A(\regs_matrix[8][13] ), .B(n392), .C(\regs_matrix[10][13] ), 
        .D(n61), .Y(n332) );
  OAI22X1 U444 ( .A(\regs_matrix[12][13] ), .B(n83), .C(\regs_matrix[14][13] ), 
        .D(n388), .Y(n331) );
  NOR2X1 U445 ( .A(n333), .B(n334), .Y(n321) );
  OAI21X1 U446 ( .A(\regs_matrix[11][13] ), .B(n409), .C(n335), .Y(n334) );
  AOI21X1 U447 ( .A(n410), .B(n336), .C(n89), .Y(n335) );
  INVX2 U448 ( .A(\regs_matrix[9][13] ), .Y(n336) );
  OAI22X1 U449 ( .A(\regs_matrix[13][13] ), .B(n416), .C(\regs_matrix[15][13] ), .D(n407), .Y(n333) );
  AOI22X1 U450 ( .A(n338), .B(n339), .C(n340), .D(n341), .Y(n337) );
  NOR2X1 U451 ( .A(n342), .B(n343), .Y(n341) );
  OAI22X1 U452 ( .A(outreg_data[14]), .B(n391), .C(\regs_matrix[2][14] ), .D(
        n403), .Y(n343) );
  OAI22X1 U453 ( .A(\regs_matrix[4][14] ), .B(n394), .C(\regs_matrix[6][14] ), 
        .D(n389), .Y(n342) );
  NOR2X1 U454 ( .A(n344), .B(n345), .Y(n340) );
  OAI21X1 U455 ( .A(\regs_matrix[3][14] ), .B(n45), .C(n346), .Y(n345) );
  AOI21X1 U456 ( .A(n65), .B(n347), .C(N13), .Y(n346) );
  INVX2 U457 ( .A(\regs_matrix[1][14] ), .Y(n347) );
  OAI22X1 U458 ( .A(\regs_matrix[5][14] ), .B(n415), .C(\regs_matrix[7][14] ), 
        .D(n102), .Y(n344) );
  NOR2X1 U459 ( .A(n348), .B(n349), .Y(n339) );
  OAI22X1 U460 ( .A(\regs_matrix[8][14] ), .B(n392), .C(\regs_matrix[10][14] ), 
        .D(n61), .Y(n349) );
  OAI22X1 U461 ( .A(\regs_matrix[12][14] ), .B(n83), .C(\regs_matrix[14][14] ), 
        .D(n388), .Y(n348) );
  NOR2X1 U462 ( .A(n350), .B(n351), .Y(n338) );
  OAI21X1 U463 ( .A(\regs_matrix[11][14] ), .B(n409), .C(n352), .Y(n351) );
  AOI21X1 U464 ( .A(n410), .B(n353), .C(n89), .Y(n352) );
  INVX2 U465 ( .A(\regs_matrix[9][14] ), .Y(n353) );
  OAI22X1 U466 ( .A(\regs_matrix[13][14] ), .B(n416), .C(\regs_matrix[15][14] ), .D(n407), .Y(n350) );
  AOI22X1 U467 ( .A(n355), .B(n356), .C(n357), .D(n358), .Y(n354) );
  NOR2X1 U468 ( .A(n359), .B(n360), .Y(n358) );
  OAI22X1 U469 ( .A(outreg_data[15]), .B(n392), .C(\regs_matrix[2][15] ), .D(
        n403), .Y(n360) );
  OAI22X1 U470 ( .A(\regs_matrix[4][15] ), .B(n394), .C(\regs_matrix[6][15] ), 
        .D(n387), .Y(n359) );
  NOR2X1 U471 ( .A(n361), .B(n362), .Y(n357) );
  OAI21X1 U472 ( .A(\regs_matrix[3][15] ), .B(n50), .C(n363), .Y(n362) );
  AOI21X1 U473 ( .A(n64), .B(n364), .C(N13), .Y(n363) );
  INVX2 U474 ( .A(\regs_matrix[1][15] ), .Y(n364) );
  OAI22X1 U475 ( .A(\regs_matrix[5][15] ), .B(n415), .C(\regs_matrix[7][15] ), 
        .D(n46), .Y(n361) );
  NOR2X1 U476 ( .A(n365), .B(n366), .Y(n356) );
  OAI22X1 U477 ( .A(\regs_matrix[8][15] ), .B(n392), .C(\regs_matrix[10][15] ), 
        .D(n61), .Y(n366) );
  OAI22X1 U478 ( .A(\regs_matrix[12][15] ), .B(n83), .C(\regs_matrix[14][15] ), 
        .D(n388), .Y(n365) );
  NOR2X1 U479 ( .A(n367), .B(n368), .Y(n355) );
  OAI21X1 U480 ( .A(\regs_matrix[11][15] ), .B(n409), .C(n369), .Y(n368) );
  AOI21X1 U481 ( .A(n410), .B(n370), .C(n89), .Y(n369) );
  INVX2 U482 ( .A(\regs_matrix[9][15] ), .Y(n370) );
  OAI22X1 U483 ( .A(\regs_matrix[13][15] ), .B(n416), .C(\regs_matrix[15][15] ), .D(n407), .Y(n367) );
  NOR2X1 U484 ( .A(n371), .B(n372), .Y(n84) );
  OAI21X1 U485 ( .A(outreg_data[16]), .B(n392), .C(n373), .Y(n372) );
  AOI21X1 U486 ( .A(n402), .B(n374), .C(N13), .Y(n373) );
  INVX2 U487 ( .A(\regs_matrix[2][16] ), .Y(n374) );
  OAI22X1 U488 ( .A(\regs_matrix[4][16] ), .B(n83), .C(\regs_matrix[6][16] ), 
        .D(n387), .Y(n371) );
  NOR2X1 U489 ( .A(n375), .B(n376), .Y(n85) );
  OAI22X1 U490 ( .A(\regs_matrix[3][16] ), .B(n409), .C(\regs_matrix[1][16] ), 
        .D(n398), .Y(n376) );
  OAI22X1 U491 ( .A(\regs_matrix[5][16] ), .B(n416), .C(\regs_matrix[7][16] ), 
        .D(n407), .Y(n375) );
  NOR3X1 U492 ( .A(n377), .B(n378), .C(n379), .Y(n86) );
  OAI22X1 U493 ( .A(\regs_matrix[10][16] ), .B(n61), .C(\regs_matrix[8][16] ), 
        .D(n392), .Y(n379) );
  NAND3X1 U494 ( .A(n380), .B(n381), .C(n382), .Y(n98) );
  NAND3X1 U495 ( .A(n44), .B(n381), .C(n382), .Y(n107) );
  NOR2X1 U496 ( .A(\regs_matrix[12][16] ), .B(n83), .Y(n378) );
  NAND3X1 U497 ( .A(N12), .B(n380), .C(n382), .Y(n99) );
  OAI22X1 U498 ( .A(\regs_matrix[9][16] ), .B(n398), .C(\regs_matrix[14][16] ), 
        .D(n388), .Y(n377) );
  NAND3X1 U499 ( .A(N12), .B(n44), .C(n382), .Y(n97) );
  INVX2 U500 ( .A(N10), .Y(n382) );
  NAND3X1 U501 ( .A(N10), .B(n381), .C(n380), .Y(n127) );
  NOR2X1 U502 ( .A(n383), .B(n384), .Y(n87) );
  OAI21X1 U503 ( .A(\regs_matrix[11][16] ), .B(n409), .C(N13), .Y(n384) );
  NAND2X1 U504 ( .A(n381), .B(n411), .Y(n116) );
  OAI22X1 U505 ( .A(\regs_matrix[15][16] ), .B(n407), .C(\regs_matrix[13][16] ), .D(n48), .Y(n383) );
  NAND3X1 U506 ( .A(N12), .B(N10), .C(n380), .Y(n108) );
  NAND2X1 U507 ( .A(N12), .B(n411), .Y(n102) );
  NAND2X1 U508 ( .A(N10), .B(N11), .Y(n385) );
  BUFX4 U509 ( .A(n399), .Y(n400) );
  INVX8 U510 ( .A(n400), .Y(n405) );
  INVX4 U511 ( .A(n127), .Y(n104) );
  INVX2 U512 ( .A(n107), .Y(n399) );
  BUFX2 U513 ( .A(n397), .Y(n407) );
  INVX1 U514 ( .A(n45), .Y(n406) );
  INVX4 U515 ( .A(n98), .Y(n390) );
  INVX2 U516 ( .A(n398), .Y(n410) );
  INVX2 U517 ( .A(n45), .Y(n408) );
  INVX4 U518 ( .A(n386), .Y(n387) );
  INVX4 U519 ( .A(n386), .Y(n389) );
  INVX4 U520 ( .A(n184), .Y(r1_data[5]) );
  INVX4 U521 ( .A(n167), .Y(r1_data[4]) );
  INVX4 U522 ( .A(n269), .Y(r1_data[10]) );
  INVX4 U523 ( .A(n235), .Y(r1_data[8]) );
  INVX4 U524 ( .A(n303), .Y(r1_data[12]) );
  INVX8 U525 ( .A(n418), .Y(n415) );
  INVX1 U526 ( .A(n55), .Y(n416) );
  INVX4 U527 ( .A(n418), .Y(n417) );
  INVX1 U528 ( .A(n64), .Y(n398) );
  INVX2 U529 ( .A(n406), .Y(n409) );
  NAND2X1 U530 ( .A(n411), .B(n381), .Y(n419) );
  NAND2X1 U531 ( .A(n411), .B(n381), .Y(n420) );
  BUFX2 U532 ( .A(n399), .Y(n402) );
  INVX8 U533 ( .A(n390), .Y(n392) );
  AOI22X1 U534 ( .A(n424), .B(n423), .C(n422), .D(n421), .Y(n425) );
  INVX2 U535 ( .A(n425), .Y(r2_data[16]) );
  MUX2X1 U536 ( .B(n426), .A(n427), .S(n700), .Y(r2_data[0]) );
  NAND2X1 U537 ( .A(n428), .B(n429), .Y(n427) );
  NOR2X1 U538 ( .A(n430), .B(n431), .Y(n429) );
  OAI22X1 U539 ( .A(\regs_matrix[8][0] ), .B(n677), .C(\regs_matrix[10][0] ), 
        .D(n4), .Y(n431) );
  OAI22X1 U540 ( .A(\regs_matrix[12][0] ), .B(n684), .C(\regs_matrix[14][0] ), 
        .D(n47), .Y(n430) );
  NOR2X1 U541 ( .A(n436), .B(n437), .Y(n428) );
  OAI22X1 U542 ( .A(\regs_matrix[11][0] ), .B(n690), .C(\regs_matrix[9][0] ), 
        .D(n43), .Y(n437) );
  OAI22X1 U543 ( .A(\regs_matrix[13][0] ), .B(n695), .C(\regs_matrix[15][0] ), 
        .D(n699), .Y(n436) );
  NAND2X1 U544 ( .A(n442), .B(n443), .Y(n426) );
  NOR2X1 U545 ( .A(n444), .B(n445), .Y(n443) );
  OAI22X1 U546 ( .A(outreg_data[0]), .B(n677), .C(\regs_matrix[2][0] ), .D(n3), 
        .Y(n445) );
  OAI22X1 U547 ( .A(\regs_matrix[4][0] ), .B(n683), .C(\regs_matrix[6][0] ), 
        .D(n688), .Y(n444) );
  NOR2X1 U548 ( .A(n446), .B(n447), .Y(n442) );
  OAI22X1 U549 ( .A(\regs_matrix[3][0] ), .B(n690), .C(\regs_matrix[1][0] ), 
        .D(n32), .Y(n447) );
  OAI22X1 U550 ( .A(\regs_matrix[5][0] ), .B(n696), .C(\regs_matrix[7][0] ), 
        .D(n699), .Y(n446) );
  MUX2X1 U551 ( .B(n448), .A(n449), .S(n701), .Y(r2_data[1]) );
  NAND2X1 U552 ( .A(n450), .B(n451), .Y(n449) );
  NOR2X1 U553 ( .A(n452), .B(n453), .Y(n451) );
  OAI22X1 U554 ( .A(\regs_matrix[8][1] ), .B(n677), .C(\regs_matrix[10][1] ), 
        .D(n21), .Y(n453) );
  OAI22X1 U555 ( .A(\regs_matrix[12][1] ), .B(n684), .C(\regs_matrix[14][1] ), 
        .D(n688), .Y(n452) );
  NOR2X1 U556 ( .A(n454), .B(n455), .Y(n450) );
  OAI22X1 U557 ( .A(\regs_matrix[11][1] ), .B(n690), .C(\regs_matrix[9][1] ), 
        .D(n34), .Y(n455) );
  OAI22X1 U558 ( .A(\regs_matrix[13][1] ), .B(n695), .C(\regs_matrix[15][1] ), 
        .D(n699), .Y(n454) );
  NAND2X1 U559 ( .A(n456), .B(n457), .Y(n448) );
  NOR2X1 U560 ( .A(n458), .B(n459), .Y(n457) );
  OAI22X1 U561 ( .A(outreg_data[1]), .B(n677), .C(\regs_matrix[2][1] ), .D(n16), .Y(n459) );
  OAI22X1 U562 ( .A(\regs_matrix[4][1] ), .B(n683), .C(\regs_matrix[6][1] ), 
        .D(n688), .Y(n458) );
  NOR2X1 U563 ( .A(n460), .B(n461), .Y(n456) );
  OAI22X1 U564 ( .A(\regs_matrix[3][1] ), .B(n690), .C(\regs_matrix[1][1] ), 
        .D(n42), .Y(n461) );
  OAI22X1 U565 ( .A(\regs_matrix[5][1] ), .B(n696), .C(\regs_matrix[7][1] ), 
        .D(n699), .Y(n460) );
  MUX2X1 U566 ( .B(n462), .A(n463), .S(n700), .Y(r2_data[2]) );
  NAND2X1 U567 ( .A(n464), .B(n465), .Y(n463) );
  NOR2X1 U568 ( .A(n466), .B(n467), .Y(n465) );
  OAI22X1 U569 ( .A(\regs_matrix[8][2] ), .B(n677), .C(\regs_matrix[10][2] ), 
        .D(n17), .Y(n467) );
  OAI22X1 U570 ( .A(\regs_matrix[12][2] ), .B(n684), .C(\regs_matrix[14][2] ), 
        .D(n688), .Y(n466) );
  NOR2X1 U571 ( .A(n468), .B(n469), .Y(n464) );
  OAI22X1 U572 ( .A(\regs_matrix[11][2] ), .B(n690), .C(\regs_matrix[9][2] ), 
        .D(n42), .Y(n469) );
  OAI22X1 U573 ( .A(\regs_matrix[13][2] ), .B(n696), .C(\regs_matrix[15][2] ), 
        .D(n699), .Y(n468) );
  NAND2X1 U574 ( .A(n470), .B(n471), .Y(n462) );
  NOR2X1 U575 ( .A(n472), .B(n473), .Y(n471) );
  OAI22X1 U576 ( .A(outreg_data[2]), .B(n677), .C(\regs_matrix[2][2] ), .D(n14), .Y(n473) );
  OAI22X1 U577 ( .A(\regs_matrix[4][2] ), .B(n684), .C(\regs_matrix[6][2] ), 
        .D(n688), .Y(n472) );
  NOR2X1 U578 ( .A(n474), .B(n475), .Y(n470) );
  OAI22X1 U579 ( .A(\regs_matrix[3][2] ), .B(n690), .C(\regs_matrix[1][2] ), 
        .D(n39), .Y(n475) );
  OAI22X1 U580 ( .A(\regs_matrix[5][2] ), .B(n696), .C(\regs_matrix[7][2] ), 
        .D(n699), .Y(n474) );
  MUX2X1 U581 ( .B(n476), .A(n477), .S(n701), .Y(r2_data[3]) );
  NAND2X1 U582 ( .A(n478), .B(n479), .Y(n477) );
  NOR2X1 U583 ( .A(n480), .B(n481), .Y(n479) );
  OAI22X1 U584 ( .A(\regs_matrix[8][3] ), .B(n677), .C(\regs_matrix[10][3] ), 
        .D(n16), .Y(n481) );
  OAI22X1 U585 ( .A(\regs_matrix[12][3] ), .B(n684), .C(\regs_matrix[14][3] ), 
        .D(n688), .Y(n480) );
  NOR2X1 U586 ( .A(n482), .B(n483), .Y(n478) );
  OAI22X1 U587 ( .A(\regs_matrix[11][3] ), .B(n690), .C(\regs_matrix[9][3] ), 
        .D(n41), .Y(n483) );
  OAI22X1 U588 ( .A(\regs_matrix[13][3] ), .B(n696), .C(\regs_matrix[15][3] ), 
        .D(n699), .Y(n482) );
  NAND2X1 U589 ( .A(n484), .B(n485), .Y(n476) );
  NOR2X1 U590 ( .A(n486), .B(n487), .Y(n485) );
  OAI22X1 U591 ( .A(outreg_data[3]), .B(n677), .C(\regs_matrix[2][3] ), .D(n4), 
        .Y(n487) );
  OAI22X1 U592 ( .A(\regs_matrix[4][3] ), .B(n684), .C(\regs_matrix[6][3] ), 
        .D(n688), .Y(n486) );
  NOR2X1 U593 ( .A(n488), .B(n489), .Y(n484) );
  OAI22X1 U594 ( .A(\regs_matrix[3][3] ), .B(n690), .C(\regs_matrix[1][3] ), 
        .D(n40), .Y(n489) );
  OAI22X1 U595 ( .A(\regs_matrix[5][3] ), .B(n696), .C(\regs_matrix[7][3] ), 
        .D(n699), .Y(n488) );
  MUX2X1 U596 ( .B(n490), .A(n491), .S(n700), .Y(r2_data[4]) );
  NAND2X1 U597 ( .A(n492), .B(n493), .Y(n491) );
  NOR2X1 U598 ( .A(n494), .B(n495), .Y(n493) );
  OAI22X1 U599 ( .A(\regs_matrix[8][4] ), .B(n678), .C(\regs_matrix[10][4] ), 
        .D(n2), .Y(n495) );
  OAI22X1 U600 ( .A(\regs_matrix[12][4] ), .B(n683), .C(\regs_matrix[14][4] ), 
        .D(n688), .Y(n494) );
  NOR2X1 U601 ( .A(n496), .B(n497), .Y(n492) );
  OAI22X1 U602 ( .A(\regs_matrix[11][4] ), .B(n691), .C(\regs_matrix[9][4] ), 
        .D(n37), .Y(n497) );
  OAI22X1 U603 ( .A(\regs_matrix[13][4] ), .B(n695), .C(\regs_matrix[15][4] ), 
        .D(n699), .Y(n496) );
  NAND2X1 U604 ( .A(n498), .B(n499), .Y(n490) );
  NOR2X1 U605 ( .A(n500), .B(n501), .Y(n499) );
  OAI22X1 U606 ( .A(outreg_data[4]), .B(n678), .C(\regs_matrix[2][4] ), .D(n14), .Y(n501) );
  OAI22X1 U607 ( .A(\regs_matrix[4][4] ), .B(n683), .C(\regs_matrix[6][4] ), 
        .D(n688), .Y(n500) );
  NOR2X1 U608 ( .A(n502), .B(n503), .Y(n498) );
  OAI22X1 U609 ( .A(\regs_matrix[3][4] ), .B(n691), .C(\regs_matrix[1][4] ), 
        .D(n39), .Y(n503) );
  OAI22X1 U610 ( .A(\regs_matrix[5][4] ), .B(n695), .C(\regs_matrix[7][4] ), 
        .D(n699), .Y(n502) );
  MUX2X1 U611 ( .B(n504), .A(n505), .S(n701), .Y(r2_data[5]) );
  NAND2X1 U612 ( .A(n506), .B(n507), .Y(n505) );
  NOR2X1 U613 ( .A(n508), .B(n509), .Y(n507) );
  OAI22X1 U614 ( .A(\regs_matrix[8][5] ), .B(n678), .C(\regs_matrix[10][5] ), 
        .D(n20), .Y(n509) );
  OAI22X1 U615 ( .A(\regs_matrix[12][5] ), .B(n683), .C(\regs_matrix[14][5] ), 
        .D(n688), .Y(n508) );
  NOR2X1 U616 ( .A(n510), .B(n511), .Y(n506) );
  OAI22X1 U617 ( .A(\regs_matrix[11][5] ), .B(n691), .C(\regs_matrix[9][5] ), 
        .D(n38), .Y(n511) );
  OAI22X1 U618 ( .A(\regs_matrix[13][5] ), .B(n695), .C(\regs_matrix[15][5] ), 
        .D(n699), .Y(n510) );
  NAND2X1 U619 ( .A(n512), .B(n513), .Y(n504) );
  NOR2X1 U620 ( .A(n514), .B(n515), .Y(n513) );
  OAI22X1 U621 ( .A(outreg_data[5]), .B(n678), .C(\regs_matrix[2][5] ), .D(n15), .Y(n515) );
  OAI22X1 U622 ( .A(\regs_matrix[4][5] ), .B(n683), .C(\regs_matrix[6][5] ), 
        .D(n688), .Y(n514) );
  NOR2X1 U623 ( .A(n516), .B(n517), .Y(n512) );
  OAI22X1 U624 ( .A(\regs_matrix[3][5] ), .B(n691), .C(\regs_matrix[1][5] ), 
        .D(n40), .Y(n517) );
  OAI22X1 U625 ( .A(\regs_matrix[5][5] ), .B(n695), .C(\regs_matrix[7][5] ), 
        .D(n699), .Y(n516) );
  MUX2X1 U626 ( .B(n518), .A(n519), .S(n700), .Y(r2_data[6]) );
  NAND2X1 U627 ( .A(n520), .B(n521), .Y(n519) );
  NOR2X1 U628 ( .A(n522), .B(n523), .Y(n521) );
  OAI22X1 U629 ( .A(\regs_matrix[8][6] ), .B(n678), .C(\regs_matrix[10][6] ), 
        .D(n23), .Y(n523) );
  OAI22X1 U630 ( .A(\regs_matrix[12][6] ), .B(n683), .C(\regs_matrix[14][6] ), 
        .D(n47), .Y(n522) );
  NOR2X1 U631 ( .A(n524), .B(n525), .Y(n520) );
  OAI22X1 U632 ( .A(\regs_matrix[11][6] ), .B(n691), .C(\regs_matrix[9][6] ), 
        .D(n35), .Y(n525) );
  OAI22X1 U633 ( .A(\regs_matrix[13][6] ), .B(n695), .C(\regs_matrix[15][6] ), 
        .D(n699), .Y(n524) );
  NAND2X1 U634 ( .A(n526), .B(n527), .Y(n518) );
  NOR2X1 U635 ( .A(n528), .B(n529), .Y(n527) );
  OAI22X1 U636 ( .A(outreg_data[6]), .B(n678), .C(\regs_matrix[2][6] ), .D(n20), .Y(n529) );
  OAI22X1 U637 ( .A(\regs_matrix[4][6] ), .B(n683), .C(\regs_matrix[6][6] ), 
        .D(n47), .Y(n528) );
  NOR2X1 U638 ( .A(n530), .B(n531), .Y(n526) );
  OAI22X1 U639 ( .A(\regs_matrix[3][6] ), .B(n691), .C(\regs_matrix[1][6] ), 
        .D(n33), .Y(n531) );
  OAI22X1 U640 ( .A(\regs_matrix[5][6] ), .B(n695), .C(\regs_matrix[7][6] ), 
        .D(n699), .Y(n530) );
  MUX2X1 U641 ( .B(n532), .A(n533), .S(n701), .Y(r2_data[7]) );
  NAND2X1 U642 ( .A(n534), .B(n535), .Y(n533) );
  NOR2X1 U643 ( .A(n536), .B(n537), .Y(n535) );
  OAI22X1 U644 ( .A(\regs_matrix[8][7] ), .B(n678), .C(\regs_matrix[10][7] ), 
        .D(n15), .Y(n537) );
  OAI22X1 U645 ( .A(\regs_matrix[12][7] ), .B(n683), .C(\regs_matrix[14][7] ), 
        .D(n47), .Y(n536) );
  NOR2X1 U646 ( .A(n538), .B(n539), .Y(n534) );
  OAI22X1 U647 ( .A(\regs_matrix[11][7] ), .B(n691), .C(\regs_matrix[9][7] ), 
        .D(n38), .Y(n539) );
  OAI22X1 U648 ( .A(\regs_matrix[13][7] ), .B(n695), .C(\regs_matrix[15][7] ), 
        .D(n699), .Y(n538) );
  NAND2X1 U649 ( .A(n540), .B(n541), .Y(n532) );
  NOR2X1 U650 ( .A(n542), .B(n543), .Y(n541) );
  OAI22X1 U651 ( .A(outreg_data[7]), .B(n678), .C(\regs_matrix[2][7] ), .D(n3), 
        .Y(n543) );
  OAI22X1 U652 ( .A(\regs_matrix[4][7] ), .B(n683), .C(\regs_matrix[6][7] ), 
        .D(n47), .Y(n542) );
  NOR2X1 U653 ( .A(n544), .B(n545), .Y(n540) );
  OAI22X1 U654 ( .A(\regs_matrix[3][7] ), .B(n691), .C(\regs_matrix[1][7] ), 
        .D(n37), .Y(n545) );
  OAI22X1 U655 ( .A(\regs_matrix[5][7] ), .B(n695), .C(\regs_matrix[7][7] ), 
        .D(n699), .Y(n544) );
  MUX2X1 U656 ( .B(n546), .A(n547), .S(n700), .Y(r2_data[8]) );
  NAND2X1 U657 ( .A(n548), .B(n549), .Y(n547) );
  NOR2X1 U658 ( .A(n550), .B(n551), .Y(n549) );
  OAI22X1 U659 ( .A(\regs_matrix[8][8] ), .B(n678), .C(\regs_matrix[10][8] ), 
        .D(n18), .Y(n551) );
  OAI22X1 U660 ( .A(\regs_matrix[12][8] ), .B(n683), .C(\regs_matrix[14][8] ), 
        .D(n47), .Y(n550) );
  NOR2X1 U661 ( .A(n552), .B(n553), .Y(n548) );
  OAI22X1 U662 ( .A(\regs_matrix[11][8] ), .B(n691), .C(\regs_matrix[9][8] ), 
        .D(n31), .Y(n553) );
  OAI22X1 U663 ( .A(\regs_matrix[13][8] ), .B(n695), .C(\regs_matrix[15][8] ), 
        .D(n699), .Y(n552) );
  NAND2X1 U664 ( .A(n554), .B(n555), .Y(n546) );
  NOR2X1 U665 ( .A(n556), .B(n557), .Y(n555) );
  OAI22X1 U666 ( .A(outreg_data[8]), .B(n678), .C(\regs_matrix[2][8] ), .D(n1), 
        .Y(n557) );
  OAI22X1 U667 ( .A(\regs_matrix[4][8] ), .B(n683), .C(\regs_matrix[6][8] ), 
        .D(n47), .Y(n556) );
  NOR2X1 U668 ( .A(n558), .B(n559), .Y(n554) );
  OAI22X1 U669 ( .A(\regs_matrix[3][8] ), .B(n691), .C(\regs_matrix[1][8] ), 
        .D(n43), .Y(n559) );
  OAI22X1 U670 ( .A(\regs_matrix[5][8] ), .B(n695), .C(\regs_matrix[7][8] ), 
        .D(n699), .Y(n558) );
  MUX2X1 U671 ( .B(n560), .A(n561), .S(n701), .Y(r2_data[9]) );
  NAND2X1 U672 ( .A(n562), .B(n563), .Y(n561) );
  NOR2X1 U673 ( .A(n564), .B(n565), .Y(n563) );
  OAI22X1 U674 ( .A(\regs_matrix[8][9] ), .B(n678), .C(\regs_matrix[10][9] ), 
        .D(n24), .Y(n565) );
  OAI22X1 U675 ( .A(\regs_matrix[12][9] ), .B(n683), .C(\regs_matrix[14][9] ), 
        .D(n47), .Y(n564) );
  NOR2X1 U676 ( .A(n566), .B(n567), .Y(n562) );
  OAI22X1 U677 ( .A(\regs_matrix[11][9] ), .B(n691), .C(\regs_matrix[9][9] ), 
        .D(n36), .Y(n567) );
  OAI22X1 U678 ( .A(\regs_matrix[13][9] ), .B(n695), .C(\regs_matrix[15][9] ), 
        .D(n699), .Y(n566) );
  NAND2X1 U679 ( .A(n568), .B(n569), .Y(n560) );
  NOR2X1 U680 ( .A(n570), .B(n571), .Y(n569) );
  OAI22X1 U681 ( .A(outreg_data[9]), .B(n678), .C(\regs_matrix[2][9] ), .D(n22), .Y(n571) );
  OAI22X1 U682 ( .A(\regs_matrix[4][9] ), .B(n683), .C(\regs_matrix[6][9] ), 
        .D(n47), .Y(n570) );
  NOR2X1 U683 ( .A(n572), .B(n573), .Y(n568) );
  OAI22X1 U684 ( .A(\regs_matrix[3][9] ), .B(n691), .C(\regs_matrix[1][9] ), 
        .D(n34), .Y(n573) );
  OAI22X1 U685 ( .A(\regs_matrix[5][9] ), .B(n695), .C(\regs_matrix[7][9] ), 
        .D(n699), .Y(n572) );
  MUX2X1 U686 ( .B(n574), .A(n575), .S(n700), .Y(r2_data[10]) );
  NAND2X1 U687 ( .A(n576), .B(n577), .Y(n575) );
  NOR2X1 U688 ( .A(n578), .B(n579), .Y(n577) );
  OAI22X1 U689 ( .A(\regs_matrix[8][10] ), .B(n677), .C(\regs_matrix[10][10] ), 
        .D(n22), .Y(n579) );
  OAI22X1 U690 ( .A(\regs_matrix[12][10] ), .B(n683), .C(\regs_matrix[14][10] ), .D(n47), .Y(n578) );
  NOR2X1 U691 ( .A(n580), .B(n581), .Y(n576) );
  OAI22X1 U692 ( .A(\regs_matrix[11][10] ), .B(n691), .C(\regs_matrix[9][10] ), 
        .D(n30), .Y(n581) );
  OAI22X1 U693 ( .A(\regs_matrix[13][10] ), .B(n695), .C(\regs_matrix[15][10] ), .D(n699), .Y(n580) );
  NAND2X1 U694 ( .A(n582), .B(n583), .Y(n574) );
  NOR2X1 U695 ( .A(n584), .B(n585), .Y(n583) );
  OAI22X1 U696 ( .A(outreg_data[10]), .B(n677), .C(\regs_matrix[2][10] ), .D(
        n17), .Y(n585) );
  OAI22X1 U697 ( .A(\regs_matrix[4][10] ), .B(n684), .C(\regs_matrix[6][10] ), 
        .D(n47), .Y(n584) );
  NOR2X1 U698 ( .A(n586), .B(n587), .Y(n582) );
  OAI22X1 U699 ( .A(\regs_matrix[3][10] ), .B(n692), .C(\regs_matrix[1][10] ), 
        .D(n41), .Y(n587) );
  OAI22X1 U700 ( .A(\regs_matrix[5][10] ), .B(n696), .C(\regs_matrix[7][10] ), 
        .D(n699), .Y(n586) );
  MUX2X1 U701 ( .B(n588), .A(n589), .S(n701), .Y(r2_data[11]) );
  NAND2X1 U702 ( .A(n590), .B(n591), .Y(n589) );
  NOR2X1 U703 ( .A(n592), .B(n593), .Y(n591) );
  OAI22X1 U704 ( .A(\regs_matrix[8][11] ), .B(n678), .C(\regs_matrix[10][11] ), 
        .D(n23), .Y(n593) );
  OAI22X1 U705 ( .A(\regs_matrix[12][11] ), .B(n684), .C(\regs_matrix[14][11] ), .D(n47), .Y(n592) );
  NOR2X1 U706 ( .A(n594), .B(n595), .Y(n590) );
  OAI22X1 U707 ( .A(\regs_matrix[11][11] ), .B(n692), .C(\regs_matrix[9][11] ), 
        .D(n32), .Y(n595) );
  OAI22X1 U708 ( .A(\regs_matrix[13][11] ), .B(n696), .C(\regs_matrix[15][11] ), .D(n699), .Y(n594) );
  NAND2X1 U709 ( .A(n596), .B(n597), .Y(n588) );
  NOR2X1 U710 ( .A(n598), .B(n599), .Y(n597) );
  OAI22X1 U711 ( .A(outreg_data[11]), .B(n677), .C(\regs_matrix[2][11] ), .D(
        n19), .Y(n599) );
  OAI22X1 U712 ( .A(\regs_matrix[4][11] ), .B(n684), .C(\regs_matrix[6][11] ), 
        .D(n686), .Y(n598) );
  NOR2X1 U713 ( .A(n600), .B(n601), .Y(n596) );
  OAI22X1 U714 ( .A(\regs_matrix[3][11] ), .B(n692), .C(\regs_matrix[1][11] ), 
        .D(n36), .Y(n601) );
  OAI22X1 U715 ( .A(\regs_matrix[5][11] ), .B(n696), .C(\regs_matrix[7][11] ), 
        .D(n699), .Y(n600) );
  MUX2X1 U716 ( .B(n602), .A(n603), .S(n700), .Y(r2_data[12]) );
  NAND2X1 U717 ( .A(n604), .B(n605), .Y(n603) );
  NOR2X1 U718 ( .A(n606), .B(n607), .Y(n605) );
  OAI22X1 U719 ( .A(\regs_matrix[8][12] ), .B(n678), .C(\regs_matrix[10][12] ), 
        .D(n27), .Y(n607) );
  OAI22X1 U720 ( .A(\regs_matrix[12][12] ), .B(n684), .C(\regs_matrix[14][12] ), .D(n686), .Y(n606) );
  NOR2X1 U721 ( .A(n608), .B(n609), .Y(n604) );
  OAI22X1 U722 ( .A(\regs_matrix[11][12] ), .B(n692), .C(\regs_matrix[9][12] ), 
        .D(n37), .Y(n609) );
  OAI22X1 U723 ( .A(\regs_matrix[13][12] ), .B(n696), .C(\regs_matrix[15][12] ), .D(n698), .Y(n608) );
  NAND2X1 U724 ( .A(n610), .B(n611), .Y(n602) );
  NOR2X1 U725 ( .A(n612), .B(n613), .Y(n611) );
  OAI22X1 U726 ( .A(outreg_data[12]), .B(n677), .C(\regs_matrix[2][12] ), .D(
        n26), .Y(n613) );
  OAI22X1 U727 ( .A(\regs_matrix[4][12] ), .B(n684), .C(\regs_matrix[6][12] ), 
        .D(n686), .Y(n612) );
  NOR2X1 U728 ( .A(n614), .B(n615), .Y(n610) );
  OAI22X1 U729 ( .A(\regs_matrix[3][12] ), .B(n692), .C(\regs_matrix[1][12] ), 
        .D(n38), .Y(n615) );
  OAI22X1 U730 ( .A(\regs_matrix[5][12] ), .B(n696), .C(\regs_matrix[7][12] ), 
        .D(n698), .Y(n614) );
  MUX2X1 U731 ( .B(n616), .A(n617), .S(n701), .Y(r2_data[13]) );
  NAND2X1 U732 ( .A(n618), .B(n619), .Y(n617) );
  NOR2X1 U733 ( .A(n620), .B(n621), .Y(n619) );
  OAI22X1 U734 ( .A(\regs_matrix[8][13] ), .B(n678), .C(\regs_matrix[10][13] ), 
        .D(n25), .Y(n621) );
  OAI22X1 U735 ( .A(\regs_matrix[12][13] ), .B(n684), .C(\regs_matrix[14][13] ), .D(n686), .Y(n620) );
  NOR2X1 U736 ( .A(n622), .B(n623), .Y(n618) );
  OAI22X1 U737 ( .A(\regs_matrix[11][13] ), .B(n692), .C(\regs_matrix[9][13] ), 
        .D(n31), .Y(n623) );
  OAI22X1 U738 ( .A(\regs_matrix[13][13] ), .B(n696), .C(\regs_matrix[15][13] ), .D(n698), .Y(n622) );
  NAND2X1 U739 ( .A(n624), .B(n625), .Y(n616) );
  NOR2X1 U740 ( .A(n626), .B(n627), .Y(n625) );
  OAI22X1 U741 ( .A(outreg_data[13]), .B(n677), .C(\regs_matrix[2][13] ), .D(
        n19), .Y(n627) );
  OAI22X1 U742 ( .A(\regs_matrix[4][13] ), .B(n684), .C(\regs_matrix[6][13] ), 
        .D(n686), .Y(n626) );
  NOR2X1 U743 ( .A(n628), .B(n629), .Y(n624) );
  OAI22X1 U744 ( .A(\regs_matrix[3][13] ), .B(n692), .C(\regs_matrix[1][13] ), 
        .D(n35), .Y(n629) );
  OAI22X1 U745 ( .A(\regs_matrix[5][13] ), .B(n696), .C(\regs_matrix[7][13] ), 
        .D(n698), .Y(n628) );
  MUX2X1 U746 ( .B(n630), .A(n631), .S(n700), .Y(r2_data[14]) );
  NAND2X1 U747 ( .A(n632), .B(n633), .Y(n631) );
  NOR2X1 U748 ( .A(n634), .B(n635), .Y(n633) );
  OAI22X1 U749 ( .A(\regs_matrix[8][14] ), .B(n677), .C(\regs_matrix[10][14] ), 
        .D(n21), .Y(n635) );
  OAI22X1 U750 ( .A(\regs_matrix[12][14] ), .B(n684), .C(\regs_matrix[14][14] ), .D(n686), .Y(n634) );
  NOR2X1 U751 ( .A(n636), .B(n637), .Y(n632) );
  OAI22X1 U752 ( .A(\regs_matrix[11][14] ), .B(n692), .C(\regs_matrix[9][14] ), 
        .D(n30), .Y(n637) );
  OAI22X1 U753 ( .A(\regs_matrix[13][14] ), .B(n696), .C(\regs_matrix[15][14] ), .D(n698), .Y(n636) );
  NAND2X1 U754 ( .A(n638), .B(n639), .Y(n630) );
  NOR2X1 U755 ( .A(n640), .B(n641), .Y(n639) );
  OAI22X1 U756 ( .A(outreg_data[14]), .B(n677), .C(\regs_matrix[2][14] ), .D(
        n18), .Y(n641) );
  OAI22X1 U757 ( .A(\regs_matrix[4][14] ), .B(n684), .C(\regs_matrix[6][14] ), 
        .D(n686), .Y(n640) );
  NOR2X1 U758 ( .A(n642), .B(n643), .Y(n638) );
  OAI22X1 U759 ( .A(\regs_matrix[3][14] ), .B(n692), .C(\regs_matrix[1][14] ), 
        .D(n33), .Y(n643) );
  OAI22X1 U760 ( .A(\regs_matrix[5][14] ), .B(n696), .C(\regs_matrix[7][14] ), 
        .D(n698), .Y(n642) );
  MUX2X1 U761 ( .B(n644), .A(n645), .S(n701), .Y(r2_data[15]) );
  NAND2X1 U762 ( .A(n646), .B(n647), .Y(n645) );
  NOR2X1 U763 ( .A(n648), .B(n649), .Y(n647) );
  OAI22X1 U764 ( .A(\regs_matrix[8][15] ), .B(n678), .C(\regs_matrix[10][15] ), 
        .D(n2), .Y(n649) );
  OAI22X1 U765 ( .A(\regs_matrix[12][15] ), .B(n684), .C(\regs_matrix[14][15] ), .D(n686), .Y(n648) );
  NOR2X1 U766 ( .A(n650), .B(n651), .Y(n646) );
  OAI22X1 U767 ( .A(\regs_matrix[11][15] ), .B(n692), .C(\regs_matrix[9][15] ), 
        .D(n40), .Y(n651) );
  OAI22X1 U768 ( .A(\regs_matrix[13][15] ), .B(n696), .C(\regs_matrix[15][15] ), .D(n698), .Y(n650) );
  NAND2X1 U769 ( .A(n652), .B(n653), .Y(n644) );
  NOR2X1 U770 ( .A(n654), .B(n655), .Y(n653) );
  OAI22X1 U771 ( .A(outreg_data[15]), .B(n677), .C(\regs_matrix[2][15] ), .D(
        n1), .Y(n655) );
  OAI22X1 U772 ( .A(\regs_matrix[4][15] ), .B(n684), .C(\regs_matrix[6][15] ), 
        .D(n686), .Y(n654) );
  NOR2X1 U773 ( .A(n656), .B(n657), .Y(n652) );
  OAI22X1 U774 ( .A(\regs_matrix[3][15] ), .B(n692), .C(\regs_matrix[1][15] ), 
        .D(n39), .Y(n657) );
  OAI22X1 U775 ( .A(\regs_matrix[5][15] ), .B(n696), .C(\regs_matrix[7][15] ), 
        .D(n698), .Y(n656) );
  NOR2X1 U776 ( .A(n658), .B(n659), .Y(n421) );
  OAI21X1 U777 ( .A(\regs_matrix[6][16] ), .B(n686), .C(n660), .Y(n659) );
  AOI22X1 U778 ( .A(n28), .B(n374), .C(n676), .D(n661), .Y(n660) );
  INVX2 U779 ( .A(outreg_data[16]), .Y(n661) );
  OAI21X1 U780 ( .A(\regs_matrix[4][16] ), .B(n684), .C(n702), .Y(n658) );
  NOR2X1 U781 ( .A(n662), .B(n663), .Y(n422) );
  OAI22X1 U782 ( .A(\regs_matrix[3][16] ), .B(n692), .C(\regs_matrix[1][16] ), 
        .D(n42), .Y(n663) );
  OAI22X1 U783 ( .A(\regs_matrix[5][16] ), .B(n696), .C(\regs_matrix[7][16] ), 
        .D(n698), .Y(n662) );
  NOR2X1 U784 ( .A(n664), .B(n665), .Y(n423) );
  OAI21X1 U785 ( .A(\regs_matrix[12][16] ), .B(n684), .C(n666), .Y(n665) );
  AOI22X1 U786 ( .A(n28), .B(n667), .C(n676), .D(n668), .Y(n666) );
  INVX2 U787 ( .A(\regs_matrix[8][16] ), .Y(n668) );
  NAND3X1 U788 ( .A(n669), .B(n670), .C(n671), .Y(n432) );
  INVX2 U789 ( .A(\regs_matrix[10][16] ), .Y(n667) );
  NAND3X1 U790 ( .A(N15), .B(n670), .C(n671), .Y(n433) );
  NAND3X1 U791 ( .A(n29), .B(n669), .C(n671), .Y(n434) );
  OAI22X1 U792 ( .A(\regs_matrix[9][16] ), .B(n41), .C(\regs_matrix[14][16] ), 
        .D(n688), .Y(n664) );
  NAND3X1 U793 ( .A(n29), .B(N15), .C(n671), .Y(n435) );
  INVX2 U794 ( .A(N14), .Y(n671) );
  NAND3X1 U795 ( .A(N14), .B(n670), .C(n669), .Y(n439) );
  NOR2X1 U796 ( .A(n672), .B(n673), .Y(n424) );
  OAI21X1 U797 ( .A(\regs_matrix[11][16] ), .B(n692), .C(n700), .Y(n673) );
  NAND2X1 U798 ( .A(n52), .B(n670), .Y(n438) );
  OAI22X1 U799 ( .A(\regs_matrix[15][16] ), .B(n698), .C(\regs_matrix[13][16] ), .D(n696), .Y(n672) );
  NAND3X1 U800 ( .A(n29), .B(N14), .C(n669), .Y(n440) );
  INVX2 U801 ( .A(N15), .Y(n669) );
  NAND2X1 U802 ( .A(n29), .B(n52), .Y(n441) );
  BUFX4 U803 ( .A(n674), .Y(n676) );
  INVX8 U804 ( .A(n697), .Y(n699) );
  INVX2 U805 ( .A(n432), .Y(n674) );
  INVX2 U806 ( .A(w_sel[1]), .Y(n755) );
  INVX2 U807 ( .A(w_en), .Y(n756) );
  INVX2 U808 ( .A(w_sel[2]), .Y(n757) );
  INVX2 U809 ( .A(w_sel[3]), .Y(n758) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U3 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U4 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   \count[0] , N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N23, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n1, n2, n3, n4, n16, n17, n18, n19, n20, n21, n22, n23;

  DFFSR \count_out_reg[0]  ( .D(\count[0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[5]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[1]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[6]  ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  NOR2X1 U26 ( .A(n36), .B(n37), .Y(N23) );
  NAND3X1 U27 ( .A(count_enable), .B(n38), .C(n39), .Y(n37) );
  NOR2X1 U28 ( .A(n40), .B(n41), .Y(n39) );
  NAND2X1 U29 ( .A(n42), .B(n43), .Y(n41) );
  XOR2X1 U30 ( .A(rollover_val[5]), .B(n32), .Y(n43) );
  AOI22X1 U31 ( .A(count_out[5]), .B(n21), .C(N12), .D(n44), .Y(n32) );
  XOR2X1 U32 ( .A(rollover_val[2]), .B(n35), .Y(n42) );
  AOI22X1 U33 ( .A(count_out[2]), .B(n21), .C(N9), .D(n44), .Y(n35) );
  XOR2X1 U34 ( .A(n20), .B(rollover_val[1]), .Y(n40) );
  AOI22X1 U35 ( .A(count_out[1]), .B(n21), .C(N8), .D(n44), .Y(n45) );
  XNOR2X1 U36 ( .A(rollover_val[0]), .B(\count[0] ), .Y(n38) );
  OAI21X1 U37 ( .A(clear), .B(n46), .C(n47), .Y(\count[0] ) );
  AOI22X1 U38 ( .A(count_out[0]), .B(n21), .C(N7), .D(n44), .Y(n47) );
  OR2X1 U39 ( .A(n48), .B(n49), .Y(n36) );
  NAND3X1 U40 ( .A(n50), .B(n51), .C(n52), .Y(n49) );
  XOR2X1 U41 ( .A(rollover_val[4]), .B(n33), .Y(n52) );
  AOI22X1 U42 ( .A(count_out[4]), .B(n21), .C(N11), .D(n44), .Y(n33) );
  XOR2X1 U43 ( .A(rollover_val[7]), .B(n30), .Y(n51) );
  AOI22X1 U44 ( .A(count_out[7]), .B(n21), .C(N14), .D(n44), .Y(n30) );
  XOR2X1 U45 ( .A(rollover_val[9]), .B(n28), .Y(n50) );
  AOI22X1 U46 ( .A(count_out[9]), .B(n21), .C(N16), .D(n44), .Y(n28) );
  NAND3X1 U47 ( .A(n53), .B(n54), .C(n55), .Y(n48) );
  XOR2X1 U48 ( .A(rollover_val[6]), .B(n31), .Y(n55) );
  AOI22X1 U49 ( .A(count_out[6]), .B(n21), .C(N13), .D(n44), .Y(n31) );
  XOR2X1 U50 ( .A(rollover_val[3]), .B(n34), .Y(n54) );
  AOI22X1 U51 ( .A(count_out[3]), .B(n21), .C(N10), .D(n44), .Y(n34) );
  XOR2X1 U52 ( .A(rollover_val[8]), .B(n29), .Y(n53) );
  AOI22X1 U53 ( .A(count_out[8]), .B(n21), .C(N15), .D(n44), .Y(n29) );
  NOR2X1 U54 ( .A(n56), .B(clear), .Y(n44) );
  NAND3X1 U55 ( .A(n46), .B(n23), .C(n56), .Y(n57) );
  NAND2X1 U56 ( .A(count_enable), .B(n22), .Y(n56) );
  NAND2X1 U57 ( .A(rollover_flag), .B(count_enable), .Y(n46) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_50 ( .A(count_out), .SUM({N16, 
        N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  INVX2 U14 ( .A(n57), .Y(n21) );
  INVX2 U15 ( .A(n28), .Y(n1) );
  INVX2 U16 ( .A(n29), .Y(n2) );
  INVX2 U17 ( .A(n30), .Y(n3) );
  INVX2 U18 ( .A(n31), .Y(n4) );
  INVX2 U19 ( .A(n32), .Y(n16) );
  INVX2 U20 ( .A(n33), .Y(n17) );
  INVX2 U21 ( .A(n34), .Y(n18) );
  INVX2 U22 ( .A(n35), .Y(n19) );
  INVX2 U23 ( .A(n45), .Y(n20) );
  INVX2 U24 ( .A(rollover_flag), .Y(n22) );
  INVX2 U25 ( .A(clear), .Y(n23) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 COUNTER ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, \sub_add_14_b0/carry[15] , \sub_add_14_b0/carry[14] ,
         \sub_add_14_b0/carry[13] , \sub_add_14_b0/carry[12] ,
         \sub_add_14_b0/carry[11] , \sub_add_14_b0/carry[10] ,
         \sub_add_14_b0/carry[9] , \sub_add_14_b0/carry[8] ,
         \sub_add_14_b0/carry[7] , \sub_add_14_b0/carry[6] ,
         \sub_add_14_b0/carry[5] , \sub_add_14_b0/carry[4] ,
         \sub_add_14_b0/carry[3] , \sub_add_14_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign N2 = in[0];

  AOI22X1 U22 ( .A(n2), .B(N11), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(N10), .B(in[16]), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(N9), .B(in[16]), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(N8), .B(in[16]), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(N7), .B(in[16]), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(N5), .B(in[16]), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(N17), .B(n2), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(N16), .B(n2), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(N15), .B(n2), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(N14), .B(n2), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(N13), .B(n2), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(N12), .B(n2), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(N2), .B(n2), .C(N2), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_14_b0/carry[15] ), .Y(N17) );
  AND2X1 U5 ( .A(n17), .B(\sub_add_14_b0/carry[14] ), .Y(
        \sub_add_14_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_14_b0/carry[14] ), .B(n17), .Y(N16) );
  AND2X1 U7 ( .A(n16), .B(\sub_add_14_b0/carry[13] ), .Y(
        \sub_add_14_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_14_b0/carry[13] ), .B(n16), .Y(N15) );
  AND2X1 U9 ( .A(n15), .B(\sub_add_14_b0/carry[12] ), .Y(
        \sub_add_14_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_14_b0/carry[12] ), .B(n15), .Y(N14) );
  AND2X1 U11 ( .A(n14), .B(\sub_add_14_b0/carry[11] ), .Y(
        \sub_add_14_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_14_b0/carry[11] ), .B(n14), .Y(N13) );
  AND2X1 U13 ( .A(n13), .B(\sub_add_14_b0/carry[10] ), .Y(
        \sub_add_14_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_14_b0/carry[10] ), .B(n13), .Y(N12) );
  AND2X1 U15 ( .A(n12), .B(\sub_add_14_b0/carry[9] ), .Y(
        \sub_add_14_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_14_b0/carry[9] ), .B(n12), .Y(N11) );
  AND2X1 U17 ( .A(n11), .B(\sub_add_14_b0/carry[8] ), .Y(
        \sub_add_14_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_14_b0/carry[8] ), .B(n11), .Y(N10) );
  AND2X1 U19 ( .A(n10), .B(\sub_add_14_b0/carry[7] ), .Y(
        \sub_add_14_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_14_b0/carry[7] ), .B(n10), .Y(N9) );
  AND2X1 U21 ( .A(n9), .B(\sub_add_14_b0/carry[6] ), .Y(
        \sub_add_14_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_14_b0/carry[6] ), .B(n9), .Y(N8) );
  AND2X1 U39 ( .A(n8), .B(\sub_add_14_b0/carry[5] ), .Y(
        \sub_add_14_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_14_b0/carry[5] ), .B(n8), .Y(N7) );
  AND2X1 U41 ( .A(n7), .B(\sub_add_14_b0/carry[4] ), .Y(
        \sub_add_14_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_14_b0/carry[4] ), .B(n7), .Y(N6) );
  AND2X1 U43 ( .A(n6), .B(\sub_add_14_b0/carry[3] ), .Y(
        \sub_add_14_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_14_b0/carry[3] ), .B(n6), .Y(N5) );
  AND2X1 U45 ( .A(n5), .B(\sub_add_14_b0/carry[2] ), .Y(
        \sub_add_14_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_14_b0/carry[2] ), .B(n5), .Y(N4) );
  AND2X1 U47 ( .A(n4), .B(n3), .Y(\sub_add_14_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(N3) );
  INVX2 U49 ( .A(N2), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   dr, lc, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_1 SYNC ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(
        dr) );
  sync_0 SYNC2 ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(
        lc) );
  controller CONTROL ( .clk(clk), .n_reset(n_reset), .dr(dr), .lc(lc), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), 
        .dest(dest), .err(err) );
  datapath DATA ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
  counter COUNT ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  magnitude MAG ( .in(outreg_data), .out(fir_out) );
endmodule

