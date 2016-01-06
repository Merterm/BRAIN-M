`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hyperflexion
// Engineer: Mert İnan
// 
// Create Date:    16:31:40 12/19/2015 
// Design Name: 
// Module Name:    direction_ganglion 
// Project Name: 	 BRAIN:M
// Target Devices: Basys2 FPGA Board
// Tool versions: 
// Description: This is the direction recognizing neural code that is used in the
//					 BRAIN:M module.
// Revision: 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module direction_ganglion(clk, dist, start, dir, colrcode, flat);
	input clk, start, dir;
	input [99:0] dist;
	output reg colrcode;
	output reg [6:0] flat;
	reg [3:0] state, nextstate;
	reg [25:0] cnt, cntNext;
	reg [6:0] ascnt, ascntNext, dscnt, dscntNext; 
	reg [99:0] dReg, dRegNext, prevReg, prevRegNext;
	
	//Sequential Logic
	always @(posedge clk)
	begin
		state <= nextstate;
		cnt <= cntNext;
		ascnt <= ascntNext;
		dscnt <= dscntNext;
		dReg <= dRegNext;
		prevReg <= prevRegNext;
	end
	
	//Combinational Logic
	always @(state or dir or prevReg or dscnt or dReg or 
				cnt or ascnt or start or dist)
		case(state)
			4'b0000:
			begin
				cntNext = 26'b0;
				ascntNext = 7'b0;
				dscntNext = 7'b0;
				dRegNext = 100'b0;
				prevRegNext = 100'b0;
				nextstate= (start)? 4'b0001:4'b0000; 
			end
			
			4'b0001:
			begin
				dRegNext = dist;
				nextstate = 4'b0010;
			end
			
			4'b0010:
			begin
				cntNext = cnt + 1;
				if(cnt < 26'b10111110101111000001111111)
					nextstate = 4'b0010;
				else
					nextstate = 4'b0011;
			end
			
			4'b0011:
			begin
				prevRegNext = dReg;
				dRegNext = dist;
				cntNext = 26'b0;
				nextstate = 4'b0100;
			end
			
			4'b0100:
			begin
				if	(prevReg > dReg)
					nextstate = 4'b0101;
				else if (prevReg < dReg)
					nextstate = 4'b0110;
				else
					nextstate = 4'b0010;
			end
			
			4'b0101:
			begin
				dscntNext = dscnt + 1;
				nextstate = (start)? 4'b0010:4'b0111;
			end
			
			4'b0110:
			begin
				ascntNext = ascnt + 1;
				nextstate = (start)? 4'b0010:4'b0111;
			end
			
			4'b0111:
				nextstate = (dir)? 4'b1000:4'b1001;
				
			4'b1000:
			begin
				flat = ascnt;
				colrcode = 1'b1;
				nextstate = 4'b0000;
			end
			
			4'b1001:
			begin
				flat = dscnt;
				colrcode = 1'b0;
				nextstate = 4'b0000;
			end
			
			default: 
			begin
				nextstate = 4'b0000;
				cntNext = 26'b0;
				ascntNext = 7'b0;
				dscntNext = 7'b0;
				dRegNext = 100'b0;
				prevRegNext = 100'b0;
				flat = 7'b0;
				colrcode = 1'b0;
			end
		endcase
endmodule
