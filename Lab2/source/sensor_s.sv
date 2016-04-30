// $Id: $
// File name:   sensor_s.sv
// Created:     1/19/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sensor_s
module sensor_s
(	
	input wire [3:0] sensors,
	output wire error
);
wire temperr1, temperr2;

and A1(temperr1, sensors[3], sensors[1]);
and A2(temperr2, sensors[1], sensors[2]);
or (error, temperr1, temperr2, sensors[0]);
endmodule 