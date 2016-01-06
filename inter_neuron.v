`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mert İnan
//
// Create Date:    13:20:37 12/20/2015 
// Module Name:    inter_neuron 
// Project Name:	 BRAIN:M
// Target Devices: FBGA Board
// Description: This is the module for the interneuron which is responsible of
//					flow of information from the direction ganglia and the memory 
//					neuron array
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module inter_neuron(clk, flat, th, mode, shape_code, wAddr, wE);
	input clk, mode;
	input [6:0] th, flat;
	output reg wE;
	output reg [11:0] shape_code;
	output reg [4:0] wAddr;
	reg [4:0] state, nextstate, wAddrNext;
	reg [6:0] fReg, fRegNext;
	reg [11:0] shape_codeNext;
	
	//Sequential Logic
	always @(posedge clk)
	begin
		state <= nextstate;
		fReg <= fRegNext;
		wAddr <= wAddrNext;
		shape_code <= shape_codeNext;
	end
	
	//Combinational Logic
	always @(*)
		case(state)
		5'b00000:
		begin
			fRegNext = 7'b0;
			nextstate = (mode)? 5'b00000:5'b00001;
			wE = 1'b0;
		end
		
		5'b00001:
		begin
			fRegNext = flat;
			nextstate = 5'b00010;
			wE = 1'b0;
		end
		
		5'b00010:
			if (fReg == th)
				nextstate = 5'b00011;
			else
				nextstate = 5'b00000;
			
		5'b00011:
			case(th)
				7'b1100100: nextstate = 5'b00100;
				7'b1011111: nextstate = 5'b00101;
				7'b1011010: nextstate = 5'b00110;
				7'b1010101: nextstate = 5'b00111;
				7'b1010000: nextstate = 5'b01000;
				7'b1001011: nextstate = 5'b01001;
				7'b1000110: nextstate = 5'b01010;
				7'b1000001: nextstate = 5'b01011;
				7'b0111100: nextstate = 5'b01100;
				7'b0110111: nextstate = 5'b01101;
				7'b0110010: nextstate = 5'b01110;
				7'b0101101: nextstate = 5'b01111;
				7'b0101000: nextstate = 5'b10000;
				7'b0100011: nextstate = 5'b10001;
				7'b0011110: nextstate = 5'b10010;
				7'b0011001: nextstate = 5'b10011;
				7'b0010100: nextstate = 5'b10100;
				7'b0001111: nextstate = 5'b10101;
				7'b0001010: nextstate = 5'b10110;
				7'b0000101: nextstate = 5'b10111;
				default: nextstate = 5'b00011;
			endcase
		
		5'b00100:
		begin
			shape_codeNext = {fReg, 5'b00000};
			wAddrNext = 5'b00000;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b00101:
		begin
			shape_codeNext = {fReg, 5'b00001};
			wAddrNext = 5'b00001;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b00110:
		begin
			shape_codeNext = {fReg, 5'b00010};
			wAddrNext = 5'b00010;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b00111:
		begin
			shape_codeNext = {fReg, 5'b00011};
			wAddrNext = 5'b00011;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01000:
		begin
			shape_codeNext = {fReg, 5'b00100};
			wAddrNext = 5'b00100;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01001:
		begin
			shape_codeNext = {fReg, 5'b00101};
			wAddrNext = 5'b00101;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01010:
		begin
			shape_codeNext = {fReg, 5'b00110};
			wAddrNext = 5'b00110;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01011:
		begin
			shape_codeNext = {fReg, 5'b00111};
			wAddrNext = 5'b00111;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01100:
		begin
			shape_codeNext = {fReg, 5'b01000};
			wAddrNext = 5'b01000;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01101:
		begin
			shape_codeNext = {fReg, 5'b01001};
			wAddrNext = 5'b01001;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01110:
		begin
			shape_codeNext = {fReg, 5'b01010};
			wAddrNext = 5'b01010;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b01111:
		begin
			shape_codeNext = {fReg, 5'b01011};
			wAddrNext = 5'b01011;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10000:
		begin
			shape_codeNext = {fReg, 5'b01100};
			wAddrNext = 5'b01100;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10001:
		begin
			shape_codeNext = {fReg, 5'b01101};
			wAddrNext = 5'b01101;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10010:
		begin
			shape_codeNext = {fReg, 5'b01110};
			wAddrNext = 5'b01110;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10011:
		begin
			shape_codeNext = {fReg, 5'b01111};
			wAddrNext = 5'b01111;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10100:
		begin
			shape_codeNext = {fReg, 5'b10000};
			wAddrNext = 5'b10000;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10101:
		begin
			shape_codeNext = {fReg, 5'b10001};
			wAddrNext = 5'b10001;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10110:
		begin
			shape_codeNext = {fReg, 5'b10010};
			wAddrNext = 5'b10010;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		
		5'b10111:
		begin
			shape_codeNext = {fReg, 5'b10011};
			wAddrNext = 5'b10011;
			wE = 1'b1;
			nextstate = 5'b00011;
		end
		default: 
		begin
			nextstate = 5'b00000;
			shape_codeNext = shape_code;
			wAddrNext = wAddr;
			wE = 1'b0;
			fRegNext = fReg;
		end
	endcase
endmodule
