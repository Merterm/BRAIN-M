`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:40:44 12/21/2015
// Design Name:   brain_m
// Module Name:   /home/merterm/Desktop/brain_M/brain_m_test.v
// Project Name:  brain_M
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: brain_m
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module brain_m_test;

	// Inputs
	reg clk;
	reg [6:0] dist;
	reg mode;
	reg start;
	reg E;

	// Outputs
	wire color;
	wire OE;
	wire [4:0] shape;

	// Instantiate the Unit Under Test (UUT)
	brain_m uut (
		.clk(clk), 
		.dist(dist), 
		.mode(mode), 
		.start(start), 
		.E(E), 
		.color(color), 
		.OE(OE), 
		.shape(shape)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dist = 0;
		mode = 0;
		start = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		start = 1;
		dist = 12;
		#2
		dist = 11;
		#2
		dist = 10;
		#2
		dist = 9;
		#2
		dist = 8;
		#2
		dist = 7;
		#2
		dist = 6;
		#2
		dist = 5;
		#2
		dist = 4;
		#2
		dist = 3;
		#2
		dist = 2;
		#10
		start = 0;
		
		#10
		dist = 100;
		mode = 1;
		start = 1;
		
		#10
		mode = 0;
		start = 0;	
	end
	
   always
		#5 clk = !clk;
endmodule

