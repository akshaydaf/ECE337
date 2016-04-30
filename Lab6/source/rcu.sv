// $Id: $
// File name:   rcu.sv
// Created:     2/27/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: rcu
module rcu
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire eop,
	input wire shift_enable,
	input wire [7:0]rcv_data,
	input wire byte_received,
	output reg rcving,
	output reg w_enable,
	output reg r_error
);
typedef enum logic [4:0] {IDLE, EDGE, /*SYNC*/ RCVBIT1, BYTERCVD, WRITE, DELAY, ERROR, DELAY1, DELAY2, EIDLE} state;
state curr;
state next;
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		 curr <= IDLE;
	end
	else
	begin
		curr <= next;
	end
end

always_comb
begin
	next = curr;
	rcving = 0;
	w_enable = 0;
	r_error = 0;
	case (curr)
	IDLE: 
	begin
		if (d_edge == 1)
		begin
			next = EDGE;
		end
		else
		begin
			next = IDLE;
		end
		rcving = 0;
		w_enable = 0;	
		r_error = 0;
	end
	EDGE:
	begin
		if (byte_received)
		begin
			if(rcv_data == 8'b10000000)
			begin
				next = RCVBIT1;
			end
			else 
			begin
				next = ERROR;
			end
		end
		else
		begin
			next = EDGE;
		end
		rcving = 1;
		w_enable = 0;	
		r_error = 0;
	end
/*	SYNC:
	begin
		if (rcv_data == 8'b10000000)
		begin
			next = RCVBIT1;
		end
		else 
		begin
			next = ERROR;
		end
		rcving = 1;
		w_enable = 0;	
		r_error = 0;
	end*/
	RCVBIT1:
	begin
		if (!eop && shift_enable)
		begin
			next = BYTERCVD;
		end
		else if (eop && shift_enable)
		begin
			next = DELAY;
		end
		rcving = 1;
		w_enable = 0;	
		r_error = 0;
	end
	BYTERCVD:
	begin
		if (!byte_received)
		begin
			next = BYTERCVD;
		end
		else
		begin
			next = WRITE;
		end
		if (eop)
		begin
			next = ERROR;
		end
		rcving = 1;
		w_enable = 0;	
		r_error = 0;
	end
	WRITE:
	begin	
		next = RCVBIT1;
		rcving = 1;
		w_enable = 1;
		r_error = 0;
	end
	DELAY:
	begin
		if (!d_edge)
		begin
			next = DELAY;
		end
		else
		begin
			next = IDLE;
		end
		rcving = 1;
		w_enable = 0;
		r_error = 0;
	end
	ERROR:
	begin
		if (eop && shift_enable)
		begin
			next = DELAY1;
		end
		else
		begin
			next = ERROR;
		end
		rcving = 1;
		w_enable = 0;	
		r_error = 1;
	end
	DELAY1:
	begin
		if (!d_edge)
		begin
			next = DELAY1;
		end
		else
		begin	
			next = EIDLE;
		end
		rcving = 1;
		w_enable = 0;	
		r_error = 1;
	end
	EIDLE:
	begin
		if (!d_edge)
		begin
			next = EIDLE;
		end
		else
		begin
			next = EDGE;
		end
		rcving = 0;
		w_enable = 0;	
		r_error = 1;
	end
	endcase
end
endmodule 
