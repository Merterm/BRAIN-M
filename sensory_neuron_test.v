`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:00:18 12/21/2015
// Design Name:   sensory_neuron
// Module Name:   /home/merterm/Desktop/brain_M/sensory_neuron_test.v
// Project Name:  brain_M
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sensory_neuron
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sensory_neuron_test;

	// Inputs
	reg clk;
	reg [6:0] d;
	reg [6:0] th;
	reg start;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	sensory_neuron uut (
		.clk(clk), 
		.d(d), 
		.th(th), 
		.start(start), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		d = 0;
		th = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		start = 1;
		th = 5;
		
		#200
		d = 100;
		#200
		d = 7;
		#200
		d = 5;
		#200
		d = 16;
		start = 0;
		#500
		d = 0;
	end
   
	always
		#1 clk = !clk;
endmodule

