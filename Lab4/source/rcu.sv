// $Id: $
// File name:   rcu.sv
// Created:     2/6/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: rcu
module rcu
(
	input wire clk,
	input wire n_rst,
	input wire start_bit_detected,
	input wire packet_done,
	input wire framing_error,
	output wire sbc_clear,
	output wire sbc_enable,
	output wire load_buffer,
	output wire enable_timer
);

typedef enum logic [3:0]{STARTBIT, DUMMY1, DUMMY2, DUMMY3, PACKET_DONE, INTER1, LOAD_BUFFER, IDLE} state;
state currstate;
state nxtstate;

always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		currstate <= IDLE;
	end
	else
	begin
		currstate <= nxtstate;
	end
end

always_comb
begin
	case(currstate)
	IDLE:
	begin
		if (start_bit_detected == 1)
		begin
			nxtstate = DUMMY1;
		end
		else
		begin
			nxtstate = IDLE;
		end
	end
	DUMMY1:
	begin
		nxtstate = DUMMY2;
	end
	DUMMY2:
	begin
		nxtstate = DUMMY3;
	end
	DUMMY3:
	begin
		nxtstate = STARTBIT;
	end
	STARTBIT:
	begin
		if (packet_done == 1)
		begin
			nxtstate = INTER1;
		end
		else
		begin
			nxtstate = STARTBIT;
		end
	end
	INTER1:
	begin
		nxtstate = PACKET_DONE;
	end
	PACKET_DONE:
	begin
		if(framing_error == 1)
		begin
			nxtstate = IDLE;
		end
		else
		begin
			nxtstate = LOAD_BUFFER;
		end
	end
	LOAD_BUFFER:
	begin
		nxtstate = IDLE;
	end
	default:
	begin
		nxtstate = IDLE;
	end
	endcase
end

assign sbc_clear = (currstate == STARTBIT);
assign sbc_enable = (currstate == INTER1);
assign load_buffer = (currstate == LOAD_BUFFER);
assign enable_timer = (currstate == STARTBIT);
endmodule 
	
