// $Id: $
// File name:   sensor_b.sv
// Created:     1/19/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sensor_b
module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);
reg temperr1;
reg temperr2;
always_comb
begin
	if (sensors[3] && sensors[1])
		temperr1 = 1'b1;
	else
		temperr1 = 1'b0;
	if (sensors[1] && sensors[2])
		temperr2 = 1'b1;
	else
		temperr2 = 1'b0;
	if (sensors[0] || temperr1 || temperr2)
		error = 1'b1;
	else
		error = 1'b0;
end
endmodule 		
