// $Id: $
// File name:   sensor_d.sv
// Created:     1/19/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sensor_d
module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);

wire temperr1;
wire temperr2;
assign temperr1 = (sensors[3] && sensors[1]) ? 1'b1 : 1'b0;
assign temperr2 = (sensors[2] && sensors[1]) ? 1'b1 : 1'b0;
assign error = (temperr1 || temperr2 || sensors[0]) ? 1'b1 : 1'b0;
endmodule 