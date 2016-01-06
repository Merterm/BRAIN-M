`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mert İnan
// 
// Create Date:    08:45:20 12/16/2015 
// Module Name:    sensory_neuron 
// Project Name: 	 BRAIN:M
// Target Devices: FPGA Board
// Description: This simple High Level State Machine is the smallest element of
//					a brain that we instantiate in the top module. Its properties and
//					actions are very similar to that of real sensory neurons found in 
//					mammalian brain. The sensory input for this neuron is the distance
//					value measured by the PING))) Ultrasound module. It outputs high
//					if the distance value is the same as its threshold value, which is
//					also another input and is instantiated in the top module.
// Revision 0.01 - File Created
// Additional Comments: There will be a hundred of this sensory neuron in the
//								finished design. Instantiating a hundred neurons would
//								take a lot of space.
//////////////////////////////////////////////////////////////////////////////////
module sensory_neuron( clk, d, th, start, y);
	input clk, start;
	input [6:0] d, th;
	output reg y;
	reg [1:0] state, nextstate;
	reg [6:0] dReg, dNext;

	//sequential logic
	always@(posedge clk)
		begin
			state <= nextstate;
			dReg <= dNext;
		end
		
	//Combinational Logic
	always@( state or dReg or start)
		case (state)
			2'b00: 
				begin
				dNext = 7'b0;
				nextstate = (start)? 2'b01: 2'b00;
				y = 1'b0;
				end
			2'b01:
				begin 
				dNext = d;
				nextstate = 2'b10;
				y = 1'b0;
				end
			2'b10:
				if( dReg == th)
					nextstate = 2'b11;
				else
					nextstate = 2'b00;
			2'b11:
				begin
				y = 1'b1;
				nextstate = 2'b00;
				end
		endcase
endmodule 