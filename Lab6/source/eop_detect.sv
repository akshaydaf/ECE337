// $Id: $
// File name:   eop_detect.sv
// Created:     2/21/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: eop_detect
module eop_detect
(
	input wire d_plus,
	input wire d_minus,
	output wire eop
);
wire notdp;
wire notdm;
assign notdp = ~d_plus;
assign notdm = ~d_minus;
and EOP(eop, notdp, notdm);
endmodule 