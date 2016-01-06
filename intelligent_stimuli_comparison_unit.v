`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:42 12/19/2015 
// Design Name: 
// Module Name:    intelligent_stimuli_comparison_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module intelligent_stimuli_comparison_unit(clk, E, asc, dsc, mode, read1, read2, colr1, colr2, colr, oe, dot_m, r_Addr1, r_Addr2);
	input clk, E, mode, colr1, colr2;
	input [6:0] asc, dsc;
	input [11:0] read1, read2;
	output reg colr, oe;
	output reg [4:0] dot_m, r_Addr1, r_Addr2;
	
	reg [4:0] state, nextstate,  r_Addr1Next,  r_Addr2Next;
	reg [7:0] ascReg, ascRegNext, dscReg, dscRegNext, 
				 remReg1, remReg1Next, remReg2, remReg2Next;
	reg [27:0] cnt, cntNext;
	
	//Sequential Logic
	always @(posedge clk)
	begin
		state <= nextstate;
		ascReg <= ascRegNext;
		dscReg <= dscRegNext;
		remReg1 <= remReg1Next;
		remReg2 <= remReg2Next;
		cnt <= cntNext;
		r_Addr1 <= r_Addr1Next;
		r_Addr2 <= r_Addr2Next;
	end
	
	//Combinational Logic
	always @(*)
		case(state)
			5'b00000:
			begin
				ascRegNext = 8'b0;
				dscRegNext = 8'b0;
				cntNext = 28'b0;
				remReg1Next = 8'b0;
				remReg2Next = 8'b0;
				nextstate = (mode)? 5'b00001: 5'b00000;
			end
			
			5'b00001:
			begin
				ascRegNext = {1'b0, asc[6:0]}; //Concatanation for zero extension
				dscRegNext = {1'b0, dsc[6:0]};
				nextstate = (E)? 5'b00010:5'b00011;
			end
			
			5'b00010:
			begin
				r_Addr1Next = 5'b0;
				r_Addr2Next = 5'b0;
				nextstate = 5'b00100;
			end
			
			5'b00011:
			begin
				r_Addr1Next = 5'b10100;
				r_Addr2Next = 5'b10100;
				nextstate = 5'b10001;
			end
			
			5'b00100:
			begin
				remReg1Next = ascReg - {1'b0, read1[11:5]};
				remReg2Next = dscReg - {1'b0, read2[11:5]};
				if ( !(r_Addr1 < 5'b10100) && !(r_Addr2 < 5'b10100))
					nextstate = 5'b00000;
				else if ( !(r_Addr1 < 5'b10100) && (r_Addr2 < 5'b10100))
					nextstate = 5'b01011;
				else if (r_Addr1 < 5'b10100)
					nextstate = 5'b00101;
				else
				 nextstate = 5'b00100;
			end
			
			5'b00101:
			if (remReg1[7] == 1)
				nextstate = 5'b00110;
			else if (remReg1 == 8'b00000000)
				nextstate = 5'b01000;
			else if (remReg1 > 8'b00000000)
				nextstate = 5'b01001;
			else
				nextstate = 5'b00101;
				
			5'b00110:
			begin
				r_Addr1Next = r_Addr1 + 1;
				nextstate = 5'b00111;
			end
			
			5'b00111:
			if (r_Addr1 < 5'b10100)
				nextstate = 5'b00101;
			else if (!(r_Addr1 < 5'b10100))
				nextstate = 5'b01011;
			else
				nextstate = 5'b00111;
				
			5'b01000:
			begin
				colr = colr1;
				dot_m = read1[4:0];
				cntNext = cnt + 1;
				oe = 1'b1;
				if (cnt < 28'b1000111100001101000101111111)
					nextstate = 5'b01000;
				else if (!(cnt < 28'b1000111100001101000101111111))
					nextstate = 5'b01010;
			end
			
			5'b01001:
			begin
				ascRegNext = remReg1;
				nextstate = 5'b00010;
			end
			
			5'b01010:
			begin
				oe = 1'b0;
				cntNext = 28'b0;
				if (r_Addr1 < 5'b10100)
					nextstate = 5'b00101;
				else if (!(r_Addr1 < 5'b10100))
					nextstate = 5'b01011;
				else 
					nextstate = 5'b01010;
			end
			
			5'b01011:
			if (remReg2[7] == 1)
				nextstate = 5'b01100;
			else if (remReg2 == 8'b00000000)
				nextstate = 5'b01110;
			else if (remReg2 > 8'b00000000)
				nextstate = 5'b01111;
			else
				nextstate = 5'b01011;
			
			5'b01100:
			begin
				r_Addr2Next = r_Addr2 + 1;
				nextstate = 5'b01101;
			end
			
			5'b01101:
			if (r_Addr2 < 5'b10100)
				nextstate = 5'b01011;
			else if (!(r_Addr2 < 5'b10100))
				nextstate = 5'b00000;
			else
				nextstate = 5'b01101;
			
			5'b01110:
			begin
				colr = colr2;
				dot_m = read2[4:0];
				cntNext = cnt + 1;
				oe = 1'b1;
				if (cnt < 28'b1000111100001101000101111111)
					nextstate = 5'b01110;
				else if (!(cnt < 28'b1000111100001101000101111111))
					nextstate = 5'b10000;
				else
					nextstate = 5'b01110;
			end
			
			5'b01111:
			begin
				dscRegNext = remReg2;
				r_Addr2Next = 5'b00000;
				nextstate = 5'b00100;
			end
			
			5'b10000:
			begin
				oe = 1'b0;
				cntNext = 28'b0;
				if (r_Addr2 < 5'b10100)
					nextstate = 5'b01011;
				else if (!(r_Addr2 < 5'b10100))
					nextstate = 5'b00000;
				else
					nextstate = 5'b10000;
			end
			
			5'b10001:
			begin
				remReg1Next = ascReg - {1'b0, read1[11:5]};
				remReg2Next = dscReg - {1'b0, read2[11:5]};
				cntNext = 28'b0;
				oe = 1'b0;
				if ((r_Addr1 == 5'b00000) && (r_Addr2 == 5'b00000))
					nextstate = 5'b00000;
				else if ((r_Addr1 == 5'b00000) && !(r_Addr2 == 5'b00000))
					nextstate = 5'b10110;
				else if ( !(r_Addr1 == 5'b00000))
					nextstate = 5'b10010;
				else
					nextstate = 5'b10001;
			end
			
			5'b10010:
			if (remReg1[7] > 8'b00000000)
				nextstate = 5'b10100;
			else if (remReg1 == 8'b00000000)
				nextstate = 5'b10011;
			else
				nextstate = 5'b10010;
				
			5'b10011:
			begin
				colr = colr1;
				dot_m = read1[4:0];
				oe = 1'b1;
				cntNext = cnt + 1;
				if (cnt < 28'b1000111100001101000101111111)
					nextstate = 5'b10011;
				else if (!(cnt < 28'b1000111100001101000101111111))
					nextstate = 5'b10110;
				else
					nextstate = 5'b10011;
			end
			
			5'b10100:
			begin
				colr = colr1;
				dot_m = read1[4:0];
				oe = 1'b1;
				r_Addr1Next = r_Addr1 - 1;
				ascRegNext = remReg1;
				nextstate = 5'b10101;
			end
			
			5'b10101:
			begin
				cntNext = cnt + 1;
				if (cnt < 28'b1000111100001101000101111111)
					nextstate = 5'b10101;
				else if ( !(cnt < 28'b1000111100001101000101111111) && r_Addr1 != 8'b00000000)
					nextstate = 5'b10001;
				else if ( cnt < 28'b1000111100001101000101111111 && r_Addr1 == 8'b00000000)
					nextstate = 5'b10110;
			end
			
			5'b10110:
			begin
				cntNext = 28'b0;
				oe = 1'b0;
				if (remReg2 == 8'b00000000)
					nextstate = 5'b11000;
				else if (remReg2 > 8'b00000000)
					nextstate = 5'b10111;
				else 
					nextstate = 5'b10110;
			end
			
			5'b10111:
			begin
				colr = colr2;
				dot_m = read2[4:0];
				oe = 1'b1;
				r_Addr2Next = r_Addr2 - 1;
				dscRegNext = remReg2;
				nextstate = 5'b10101;
			end
			
			5'b11000:
			begin
				colr = colr2;
				dot_m = read2[4:0];
				oe = 1'b1;
				cntNext = cnt + 1;
				if (cnt < 28'b1000111100001101000101111111)
					nextstate = 5'b11000;
				else if (!(cnt < 28'b1000111100001101000101111111))
					nextstate = 5'b00000;
				else
					nextstate = 5'b11000;
			end
			
			5'b11001:
			begin
				cntNext = cnt + 1;
				if (cnt < 28'b1000111100001101000101111111)
					nextstate = 5'b11001;
				else if ( !(cnt < 28'b1000111100001101000101111111) && r_Addr2 == 8'b00000000)
					nextstate = 5'b00000;
				else if ( !(cnt < 28'b1000111100001101000101111111) && r_Addr2 != 8'b00000000)
					nextstate = 5'b10110;
				else
					nextstate = 5'b11001;
			end
			
			default:
			begin
				ascRegNext = 8'b0;
				dscRegNext = 8'b0;
				cntNext = 28'b0;
				remReg1Next = 8'b0;
				remReg2Next = 8'b0;
				r_Addr1Next = 5'b0;
				r_Addr2Next = 5'b0;
				colr = 1'b0;
				dot_m = 5'b0;
				oe = 1'b0;
			end
		endcase
endmodule
