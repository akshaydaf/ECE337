/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb  9 13:57:00 2016
/////////////////////////////////////////////////////////////


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 A2 ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   sbc_clear, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [3:0] currstate;
  wire   [2:0] nxtstate;
  assign enable_timer = sbc_clear;

  DFFSR \currstate_reg[0]  ( .D(nxtstate[0]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(currstate[0]) );
  DFFSR \currstate_reg[1]  ( .D(nxtstate[1]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(currstate[1]) );
  DFFSR \currstate_reg[2]  ( .D(nxtstate[2]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(currstate[2]) );
  NOR2X1 U6 ( .A(n4), .B(n5), .Y(sbc_enable) );
  NAND2X1 U7 ( .A(currstate[0]), .B(n6), .Y(n5) );
  NOR2X1 U8 ( .A(currstate[0]), .B(n7), .Y(sbc_clear) );
  NAND2X1 U9 ( .A(n6), .B(n4), .Y(n7) );
  OAI21X1 U10 ( .A(n8), .B(n4), .C(n9), .Y(nxtstate[2]) );
  NAND2X1 U11 ( .A(n10), .B(n11), .Y(n9) );
  OAI22X1 U12 ( .A(start_bit_detected), .B(n4), .C(n8), .D(n12), .Y(n11) );
  INVX1 U13 ( .A(packet_done), .Y(n12) );
  OAI21X1 U14 ( .A(currstate[1]), .B(currstate[0]), .C(n13), .Y(n10) );
  INVX1 U15 ( .A(currstate[2]), .Y(n4) );
  INVX1 U16 ( .A(n13), .Y(n8) );
  NAND2X1 U17 ( .A(currstate[1]), .B(currstate[0]), .Y(n13) );
  OAI21X1 U18 ( .A(start_bit_detected), .B(n14), .C(n15), .Y(nxtstate[1]) );
  XOR2X1 U19 ( .A(currstate[0]), .B(n16), .Y(n15) );
  NOR2X1 U20 ( .A(currstate[1]), .B(currstate[2]), .Y(n16) );
  OAI21X1 U21 ( .A(currstate[0]), .B(n17), .C(n14), .Y(nxtstate[0]) );
  AND2X1 U22 ( .A(n18), .B(n6), .Y(n17) );
  INVX1 U23 ( .A(currstate[1]), .Y(n6) );
  MUX2X1 U24 ( .B(packet_done), .A(framing_error), .S(currstate[2]), .Y(n18)
         );
  NOR2X1 U25 ( .A(currstate[0]), .B(n14), .Y(load_buffer) );
  NAND2X1 U26 ( .A(currstate[1]), .B(currstate[2]), .Y(n14) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n29, N17, n9, n2, n3, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;
  wire   [3:0] count;

  DFFSR \count_out_reg[0]  ( .D(count[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n29)
         );
  DFFSR \count_out_reg[1]  ( .D(count[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n9), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(count[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  INVX2 U8 ( .A(n28), .Y(rollover_flag) );
  NOR2X1 U9 ( .A(n2), .B(n3), .Y(N17) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(n3) );
  XNOR2X1 U11 ( .A(count[1]), .B(rollover_val[1]), .Y(n11) );
  INVX1 U12 ( .A(n12), .Y(count[1]) );
  MUX2X1 U13 ( .B(n13), .A(n14), .S(n15), .Y(n12) );
  AND2X1 U14 ( .A(n16), .B(count_out[0]), .Y(n14) );
  XNOR2X1 U15 ( .A(count[3]), .B(rollover_val[3]), .Y(n10) );
  INVX1 U16 ( .A(n17), .Y(count[3]) );
  MUX2X1 U17 ( .B(n18), .A(n19), .S(count_out[3]), .Y(n17) );
  OAI21X1 U18 ( .A(count_out[2]), .B(n20), .C(n21), .Y(n19) );
  NOR2X1 U19 ( .A(n22), .B(n23), .Y(n18) );
  NAND3X1 U20 ( .A(n24), .B(n25), .C(count_enable), .Y(n2) );
  XNOR2X1 U21 ( .A(rollover_val[0]), .B(count[0]), .Y(n25) );
  OAI22X1 U22 ( .A(count_out[0]), .B(n20), .C(clear), .D(n26), .Y(count[0]) );
  MUX2X1 U23 ( .B(count_out[0]), .A(n29), .S(count_enable), .Y(n26) );
  XNOR2X1 U24 ( .A(rollover_val[2]), .B(n9), .Y(n24) );
  MUX2X1 U25 ( .B(n21), .A(n23), .S(n22), .Y(n9) );
  INVX1 U26 ( .A(count_out[2]), .Y(n22) );
  NAND3X1 U27 ( .A(count_out[0]), .B(n16), .C(count_out[1]), .Y(n23) );
  AOI21X1 U28 ( .A(n15), .B(n16), .C(n13), .Y(n21) );
  OAI22X1 U29 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n20), .Y(n13) );
  INVX1 U30 ( .A(n20), .Y(n16) );
  NAND3X1 U31 ( .A(n27), .B(n28), .C(count_enable), .Y(n20) );
  INVX1 U32 ( .A(n29), .Y(n28) );
  INVX1 U33 ( .A(clear), .Y(n27) );
  INVX1 U34 ( .A(count_out[1]), .Y(n15) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N17, n1, n2, n3, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28;
  wire   [3:0] count;

  DFFSR \count_out_reg[0]  ( .D(count[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(count[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(count[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(N17) );
  NAND2X1 U9 ( .A(n3), .B(n10), .Y(n2) );
  XNOR2X1 U10 ( .A(count[1]), .B(rollover_val[1]), .Y(n10) );
  INVX1 U11 ( .A(n11), .Y(count[1]) );
  MUX2X1 U12 ( .B(n12), .A(n13), .S(n14), .Y(n11) );
  AND2X1 U13 ( .A(n15), .B(count_out[0]), .Y(n13) );
  XNOR2X1 U14 ( .A(count[3]), .B(rollover_val[3]), .Y(n3) );
  INVX1 U15 ( .A(n16), .Y(count[3]) );
  MUX2X1 U16 ( .B(n17), .A(n18), .S(count_out[3]), .Y(n16) );
  OAI21X1 U17 ( .A(count_out[2]), .B(n19), .C(n20), .Y(n18) );
  NOR2X1 U18 ( .A(n21), .B(n22), .Y(n17) );
  NAND3X1 U19 ( .A(n23), .B(n24), .C(count_enable), .Y(n1) );
  XNOR2X1 U20 ( .A(rollover_val[0]), .B(count[0]), .Y(n24) );
  OAI22X1 U21 ( .A(count_out[0]), .B(n19), .C(clear), .D(n25), .Y(count[0]) );
  MUX2X1 U22 ( .B(count_out[0]), .A(rollover_flag), .S(count_enable), .Y(n25)
         );
  XNOR2X1 U23 ( .A(rollover_val[2]), .B(n28), .Y(n23) );
  MUX2X1 U24 ( .B(n20), .A(n22), .S(n21), .Y(n28) );
  INVX1 U25 ( .A(count_out[2]), .Y(n21) );
  NAND3X1 U26 ( .A(count_out[0]), .B(n15), .C(count_out[1]), .Y(n22) );
  AOI21X1 U27 ( .A(n14), .B(n15), .C(n12), .Y(n20) );
  OAI22X1 U28 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n19), .Y(n12) );
  INVX1 U29 ( .A(n19), .Y(n15) );
  NAND3X1 U30 ( .A(n26), .B(n27), .C(count_enable), .Y(n19) );
  INVX1 U31 ( .A(rollover_flag), .Y(n27) );
  INVX1 U32 ( .A(clear), .Y(n26) );
  INVX1 U33 ( .A(count_out[1]), .Y(n14) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;


  flex_counter_NUM_CNT_BITS4_1 A10 ( .clk(clk), .n_rst(n_rst), .clear(
        packet_done), .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 
        1'b1, 1'b0}), .rollover_flag(shift_strobe) );
  flex_counter_NUM_CNT_BITS4_0 A9 ( .clk(clk), .n_rst(n_rst), .clear(
        packet_done), .count_enable(shift_strobe), .rollover_val({1'b1, 1'b0, 
        1'b0, 1'b1}), .rollover_flag(packet_done) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n15, n17, n19, n21, n23, n25, n27, n29, n30, n31, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  OAI21X1 U3 ( .A(data_read), .B(n1), .C(n2), .Y(n31) );
  INVX1 U4 ( .A(load_buffer), .Y(n2) );
  INVX1 U5 ( .A(data_ready), .Y(n1) );
  NOR2X1 U6 ( .A(data_read), .B(n3), .Y(n30) );
  AOI21X1 U7 ( .A(load_buffer), .B(data_ready), .C(overrun_error), .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(n29) );
  MUX2X1 U9 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(n27) );
  MUX2X1 U11 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n5) );
  INVX1 U12 ( .A(n6), .Y(n25) );
  MUX2X1 U13 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n6) );
  INVX1 U14 ( .A(n7), .Y(n23) );
  MUX2X1 U15 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n7) );
  INVX1 U16 ( .A(n8), .Y(n21) );
  MUX2X1 U17 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n19) );
  MUX2X1 U19 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n17) );
  MUX2X1 U21 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n10) );
  INVX1 U22 ( .A(n11), .Y(n15) );
  MUX2X1 U23 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   shift_strobe, stop_bit, start_bit_detected, packet_done, sbc_clear,
         sbc_enable, load_buffer, enable_timer;
  wire   [7:0] packet_data;

  sr_9bit SHIFTREG ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  start_bit_det STARTBIT ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit_detected) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  stop_bit_chk STOPBIT ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done) );
  rx_data_buff RX ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
endmodule

