// $Id: $
// File name:   controller.sv
// Created:     2/14/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: controller
module controller
(
	input wire clk,
	input wire n_reset,
	input wire dr,
	input wire lc,
	input wire overflow,
	output reg cnt_up,
	output reg clear,
	output reg modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

typedef enum logic [4:0] {IDLE, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, MUL1, ADD1, MUL2, SUB1, MUL3, ADD2, MUL4, SUB2, LOAD, COEF1, DUMMY1, COEF2, DUMMY2, COEF3, DUMMY3, COEF4, EIDLE} state;
state curr;
state next;
reg currmod;
reg nextmod;
always_ff @(posedge clk, negedge n_reset)
begin
	if(n_reset == 0)
	begin
		curr <= IDLE;
		currmod <= 0;
	end
	else
	begin
		curr <= next;
		currmod <= nextmod;
	end
end

always_comb
begin
	next = curr;
	cnt_up = 0;
	clear = 0;
	nextmod = currmod;
	op = 4'b0;	
	src1 = 4'b0;
	src2 = 4'b0;
	dest = 4'b0;
	err = 0;
	case(curr)
	IDLE:
	begin
		if (dr == 1)
		begin
			next = STORE;
			nextmod = 1'b1;
		end
		else if (lc == 1)
		begin
			next = COEF1;
			nextmod = 1'b1;
		end
		else
		begin
			next = IDLE;
			nextmod = 1'b0;
		end
		cnt_up = 0;
		clear = 1;
		op = 3'b0;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'b0;
		err = 0;
	end
	STORE:
	begin
		if (dr == 1)
		begin
			next = ZERO;
			nextmod = 1'b1;
		end
		else
		begin
			next = EIDLE;
			nextmod = 1'b0;	
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b010;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'd5;	
		err = 0;
	end
	ZERO:
	begin
		next = SORT1;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op = 3'b101;
		src1 = 4'd0;
		src2 = 4'd0;
		dest = 4'd0;
		err = 0;
	end
	SORT1:
	begin
		next = SORT2;
		cnt_up = 1;
		clear = 0;
		nextmod = 1'b1;
		op[2:0] = 3'b001;
		src1 = 4'd2;
		src2 = 4'b0;
		dest = 4'd1;
		err = 0;
	end
	SORT2:
	begin
		next = SORT3;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op[2:0] = 3'b001;
		src1 = 4'd3;
		src2 = 4'b0;
		dest = 4'd2;
		err = 0;
	end
	SORT3:
	begin
		next = SORT4;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op[2:0] = 3'b001;
		src1 = 4'd4;
		src2 = 4'b0;
		dest = 4'd3;
		err = 0;
	end
	SORT4:
	begin
		next = MUL1;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op[2:0] = 3'b001;
		src1 = 4'd5;
		src2 = 4'b0;
		dest = 4'd4;
		err = 0;
	end
	MUL1:
	begin
		next = ADD1;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op = 3'b110;
		src1 = 4'd1;
		src2 = 4'd6;	
		dest = 4'd7;
		err = 0;
	end
	ADD1:
	begin
		if (overflow == 1)
		begin
			next = EIDLE;
			nextmod = 1'b0;	
		end
		else
		begin
			next = MUL2;
			nextmod = 1'b1;
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b100;
		src1 = 4'd0;
		src2 = 4'd7;
		dest = 4'd0;
		err = 0;
	end
	MUL2:
	begin
		next = SUB1;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op = 3'b110;	
		src1 = 4'd2;
		src2 = 4'd8;
		dest = 4'd7;
		err = 0;
	end
	SUB1:
	begin
		if (overflow == 1)
		begin
			next = EIDLE;
			nextmod = 1'b0;
		end
		else
		begin
			next = MUL3;
			nextmod = 1'b1;
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b101;
		src1 = 4'd0;
		src2 = 4'd7;
		dest = 4'd0;
		err = 0;
	end
	MUL3:
	begin
		next = ADD2;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op = 3'b110;	
		src1 = 4'd3;
		src2 = 4'd9;
		dest = 4'd7;
		err = 0;
	end
	ADD2:
	begin
		if (overflow == 1)
		begin
			next = EIDLE;
			nextmod = 1'b0;	
		end
		else
		begin
			next = MUL4;
			nextmod = 1'b1;
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b100;
		src1 = 4'd0;
		src2 = 4'd7;
		dest = 4'd0;
		err = 0;
	end
	MUL4:
	begin
		next = SUB2;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b1;
		op = 3'b110;	
		src1 = 4'd4;
		src2 = 4'd10;
		dest = 4'd7;
		err = 0;
	end
	SUB2:
	begin
		if (overflow == 1)
		begin
			next = EIDLE;
			nextmod = 1'b0;
		end
		else
		begin
			next = LOAD;
			nextmod = 1'b1;
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b101;
		src1 = 4'd0;
		src2 = 4'd7;
		dest = 4'd0;
		err = 0;
	end
	LOAD:
	begin
		next = IDLE;
		cnt_up = 0;
		clear = 0;
		nextmod = 1;
		op = 3'b0;
		src1 = 3'b0;
		src2 = 4'b0;
		dest = 4'b0;
		err = 0;
	end
	COEF1:
	begin
		next = DUMMY1;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b0;
		op = 3'b011;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'd10;
		err = 0;
	end
	DUMMY1:
	begin
		if (lc == 1)
		begin
			next = COEF2;
			nextmod = 1'b1;
		end
		else
		begin
			next = DUMMY1;
			nextmod = 1'b0;
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b0;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'b0;
		err = 0;
	end
	COEF2:
	begin
		next = DUMMY2;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b0;
		op = 3'b011;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'd9;
		err = 0;
	end
	DUMMY2:
	begin
		if (lc == 1)
		begin
			next = COEF3;
			nextmod = 1'b1;
		end
		else
		begin
			next = DUMMY2;
			nextmod = 1'b0;
		end
		cnt_up = 0;
		clear = 0;
		op = 3'b0;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'b0;
		err = 0;
	end
	COEF3:
	begin
		next = DUMMY3;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b0;
		op = 3'b011;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'd8;
		err = 0;
	end
	DUMMY3:
	begin
		if (lc == 1)
		begin
			next = COEF4;
			nextmod = 1'b1;
		end
		else
		begin
			next = DUMMY3;
			nextmod = 1'b0;
		end		
		cnt_up = 0;
		clear = 0;
		op = 3'b0;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'b0;
		err = 0;
	end
	COEF4:
	begin
		next = IDLE;
		cnt_up = 0;
		clear = 0;
		nextmod = 1'b0;
		op = 3'b011;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'd6;
		err = 0;
	end
	EIDLE:
	begin
		if (dr == 1)
		begin
			next = STORE;
			nextmod = 1'b1;
		end
		else if (lc == 1)
		begin
			next = COEF1;
			nextmod = 1'b1;
		end
		else
		begin	
			next = EIDLE;
			nextmod = 1'b0;
		end
		cnt_up = 0;
		clear = 0;	
		op = 3'b0;
		src1 = 4'b0;
		src2 = 4'b0;
		dest = 4'b0;
		err = 1;
	end
	endcase
end
assign modwait = currmod;
endmodule 
