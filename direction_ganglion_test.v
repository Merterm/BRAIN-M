`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer: Mert İnan
//
// Create Date:   21:28:22 12/21/2015
// Design Name:   direction_ganglion
// Module Name:   /home/merterm/Desktop/brain_M/direction_ganglion_test.v
// Project Name:  brain_M
// Description: 
//
// Verilog Test Fixture created by ISE for module: direction_ganglion
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module direction_ganglion_test;

	// Inputs
	reg clk;
	reg [99:0] dist;
	reg start;
	reg dir;

	// Outputs
	wire colrcode;
	wire [6:0] flat;

	// Instantiate the Unit Under Test (UUT)
	direction_ganglion uut (
		.clk(clk), 
		.dist(dist), 
		.start(start), 
		.dir(dir), 
		.colrcode(colrcode), 
		.flat(flat)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dist = 0;
		start = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		dir = 1;
		start = 1;
		dist = 1;
		#100000000
		dist = 2;
		#100000000
		dist = 4;
		#100000000
		dist = 8;
		#100000000
		dist = 16;
		#100000000
		dist = 32;
		#100000000
		dist = 64;
		#100000000
		dist = 128;
		#100000000
		dist = 256;
		#100000000
		dist = 512;
		#100000000
		start = 0;
		
	end
   always
		#1 clk = !clk;
endmodule

