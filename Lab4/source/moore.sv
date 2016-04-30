// $Id: $
// File name:   moore.sv
// Created:     2/4/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: moore
module moore
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);
parameter [3:0]IDLE = 4'b0000;
parameter [3:0]STATE_1 = 4'b0001;
parameter [3:0]STATE_2 = 4'b0011;
parameter [3:0]STATE_3 = 4'b0110;
parameter [3:0]STATE_4 = 4'b1101;
reg [3:0]nxt_state;
reg [3:0]state;

always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin	
		state <= IDLE;
	end
	else
	begin
		state <= nxt_state;
	end
end
always_comb
begin
	o = 0;
	case(state)
	STATE_1: 
	begin
		if (i == 1)
		begin
			nxt_state = STATE_2;
		end
		else
		begin
			nxt_state = IDLE;
		end
	end
	STATE_2:
	begin
		if (i == 1)
		begin
			nxt_state = STATE_2;
		end
		else
		begin
			nxt_state = STATE_3;
		end
	end
	STATE_3:
	begin
		if (i == 1)
		begin
			nxt_state = STATE_4;
		end
		else
		begin
			nxt_state = IDLE;
		end
	end
	STATE_4:
	begin
		if(i == 1)
		begin
			nxt_state = STATE_2;
			o = 1;
		end
		else
		begin
			nxt_state = IDLE;
			o = 0;
		end
	end
	IDLE:
	begin
		if(i == 1)
		begin
			nxt_state = STATE_1;
		end
		else
		begin
			nxt_state = IDLE;
		end
	end
	default:
	begin
		nxt_state = IDLE;
	end
	endcase
end
endmodule
