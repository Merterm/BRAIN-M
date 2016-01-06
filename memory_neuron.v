`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:55 12/20/2015 
// Design Name: 
// Module Name:    memory_neuron 
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
module memory_neuron(clk, WE1, WE2, WE3, WE4, WE5, 
							WE6, WE7, WE8, WE9, WE10, WE11, 
							WE12, WE13, WE14, WE15, WE16, WE17, 
							WE18, WE19, WE20, wAddr1, wAddr2, wAddr3, 
							wAddr4, wAddr5, wAddr6, wAddr7, wAddr8, 
							wAddr9, wAddr10, wAddr11, wAddr12, wAddr13, 
							wAddr14, wAddr15, wAddr16, wAddr17, wAddr18, 
							wAddr19, wAddr20, wData1, wData2, wData3, wData4, 
							wData5, wData6, wData7, wData8, wData9, wData10, 
							wData11, wData12, wData13, wData14, wData15, wData16, 
							wData17, wData18, wData19, wData20, rAddr1, rAddr2, 
							rData1, rData2);
							
	input clk, WE1, WE2, WE3, WE4, WE5, 
			WE6, WE7, WE8, WE9, WE10, WE11, 
			WE12, WE13, WE14, WE15, WE16, WE17, 
			WE18, WE19, WE20;
			
	input [4:0] wAddr1, wAddr2, wAddr3, wAddr4, wAddr5, 
					wAddr6, wAddr7, wAddr8, wAddr9, wAddr10, 
					wAddr11, wAddr12, wAddr13, wAddr14, wAddr15, 
					wAddr16, wAddr17, wAddr18, wAddr19, wAddr20, 
					rAddr1, rAddr2;
					
	input [11:0] wData1, wData2, wData3, wData4, wData5, wData6, 
					 wData7, wData8, wData9, wData10, wData11, wData12, 
					 wData13, wData14, wData15, wData16, wData17, wData18, 
					 wData19, wData20;
					 
	output [11:0] rData1, rData2;
	
	reg [11:0] mem[31:0];
	
	always@(posedge clk)
		if(WE1)
			mem[wAddr1] <= wData1;
		else if(WE2)
			mem[wAddr2] <= wData2;
		else if(WE3)
			mem[wAddr3] <= wData3;
		else if(WE4)
			mem[wAddr4] <= wData4;
		else if(WE5)
			mem[wAddr5] <= wData5;
		else if(WE6)
			mem[wAddr6] <= wData6;
		else if(WE7)
			mem[wAddr7] <= wData7;
		else if(WE8)
			mem[wAddr8] <= wData8;
		else if(WE9)
			mem[wAddr9] <= wData9;
		else if(WE10)
			mem[wAddr10] <= wData10;
		else if(WE11)
			mem[wAddr11] <= wData11;
		else if(WE12)
			mem[wAddr12] <= wData12;
		else if(WE13)
			mem[wAddr13] <= wData13;
		else if(WE14)
			mem[wAddr14] <= wData14;
		else if(WE15)
			mem[wAddr15] <= wData15;
		else if(WE16)
			mem[wAddr16] <= wData16;
		else if(WE17)
			mem[wAddr17] <= wData17;
		else if(WE18)
			mem[wAddr18] <= wData18;
		else if(WE19)
			mem[wAddr19] <= wData19;
		else if(WE20)
			mem[wAddr20] <= wData20;
		else 
			mem[wAddr20 + 1] <= wData1;
			
	assign rData1 = mem[rAddr1];
	assign rData2 = mem[rAddr2];
endmodule
