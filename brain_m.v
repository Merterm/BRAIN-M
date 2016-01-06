`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:15 12/20/2015 
// Design Name: 
// Module Name:    brain_m 
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
module brain_m(clk, dist, mode, start, E, color, OE, shape);
	input clk, mode, start, E;
	input [6:0] dist;
	output color, OE;
	output [4:0] shape;
	
	wire [99:0] W1;
	wire W2, W3, W8, W13, W14, 
		  W15, W16, W17, W18, W19, 
		  W20, W21, W22, W23, W24, 
		  W25, W26, W27, W28, W29, 
		  W30, W31;
	wire [6:0] W4, W5;
	wire [11:0] W6, W51, W52, W53, 
					W54, W55, W56, W57, 
					W58, W59, W60, W61, 
					W62, W63, W64, W65, 
					W66, W67, W68, W69, 
					W11, W12;
	wire [4:0] W7, W32, W33, W34, W35, 
				  W36, W37, W38, W39, W40, 
				  W41, W42, W43, W44, W45, 
				  W46, W47, W48, W49, W50, 
				  W9, W10;
	
	//100 Sensory Neurons
	sensory_neuron s1(clk, dist, 7'b0000010, start, W1[0]);
	sensory_neuron s2(clk, dist, 7'b0000011, start, W1[1]);
	sensory_neuron s3(clk, dist, 7'b0000100, start, W1[2]);
	sensory_neuron s4(clk, dist, 7'b0000101, start, W1[3]);
	sensory_neuron s5(clk, dist, 7'b0000110, start, W1[4]);
	sensory_neuron s6(clk, dist, 7'b0000111, start, W1[5]);
	sensory_neuron s7(clk, dist, 7'b0001000, start, W1[6]);
	sensory_neuron s8(clk, dist, 7'b0001001, start, W1[7]);
	sensory_neuron s9(clk, dist, 7'b0001010, start, W1[8]);
	sensory_neuron s10(clk, dist, 7'b0001011, start, W1[9]);
	sensory_neuron s11(clk, dist, 7'b0001100, start, W1[10]);
	sensory_neuron s12(clk, dist, 7'b0001101, start, W1[11]);
	sensory_neuron s13(clk, dist, 7'b0001110, start, W1[12]);
	sensory_neuron s14(clk, dist, 7'b0001111, start, W1[13]);
	sensory_neuron s15(clk, dist, 7'b0010000, start, W1[14]);
	sensory_neuron s16(clk, dist, 7'b0010001, start, W1[15]);
	sensory_neuron s17(clk, dist, 7'b0010010, start, W1[16]);
	sensory_neuron s18(clk, dist, 7'b0010011, start, W1[17]);
	sensory_neuron s19(clk, dist, 7'b0010100, start, W1[18]);
	sensory_neuron s20(clk, dist, 7'b0010101, start, W1[19]);
	sensory_neuron s21(clk, dist, 7'b0010110, start, W1[20]);
	sensory_neuron s22(clk, dist, 7'b0010111, start, W1[21]);
	sensory_neuron s23(clk, dist, 7'b0011000, start, W1[22]);
	sensory_neuron s24(clk, dist, 7'b0011001, start, W1[23]);
	sensory_neuron s25(clk, dist, 7'b0011010, start, W1[24]);
	sensory_neuron s26(clk, dist, 7'b0011011, start, W1[25]);
	sensory_neuron s27(clk, dist, 7'b0011100, start, W1[26]);
	sensory_neuron s28(clk, dist, 7'b0011101, start, W1[27]);
	sensory_neuron s29(clk, dist, 7'b0011110, start, W1[28]);
	sensory_neuron s30(clk, dist, 7'b0011111, start, W1[29]);
	sensory_neuron s31(clk, dist, 7'b0100000, start, W1[30]);
	sensory_neuron s32(clk, dist, 7'b0100001, start, W1[31]);
	sensory_neuron s33(clk, dist, 7'b0100010, start, W1[32]);
	sensory_neuron s34(clk, dist, 7'b0100011, start, W1[33]);
	sensory_neuron s35(clk, dist, 7'b0100100, start, W1[34]);
	sensory_neuron s36(clk, dist, 7'b0100101, start, W1[35]);
	sensory_neuron s37(clk, dist, 7'b0100110, start, W1[36]);
	sensory_neuron s38(clk, dist, 7'b0100111, start, W1[37]);
	sensory_neuron s39(clk, dist, 7'b0101000, start, W1[38]);
	sensory_neuron s40(clk, dist, 7'b0101001, start, W1[39]);
	sensory_neuron s41(clk, dist, 7'b0101010, start, W1[40]);
	sensory_neuron s42(clk, dist, 7'b0101011, start, W1[41]);
	sensory_neuron s43(clk, dist, 7'b0101100, start, W1[42]);
	sensory_neuron s44(clk, dist, 7'b0101101, start, W1[43]);
	sensory_neuron s45(clk, dist, 7'b0101110, start, W1[44]);
	sensory_neuron s46(clk, dist, 7'b0101111, start, W1[45]);
	sensory_neuron s47(clk, dist, 7'b0110000, start, W1[46]);
	sensory_neuron s48(clk, dist, 7'b0110001, start, W1[47]);
	sensory_neuron s49(clk, dist, 7'b0110010, start, W1[48]);
	sensory_neuron s50(clk, dist, 7'b0110011, start, W1[49]);
	sensory_neuron s51(clk, dist, 7'b0110100, start, W1[50]);
	sensory_neuron s52(clk, dist, 7'b0110101, start, W1[51]);
	sensory_neuron s53(clk, dist, 7'b0110110, start, W1[52]);
	sensory_neuron s54(clk, dist, 7'b0110111, start, W1[53]);
	sensory_neuron s55(clk, dist, 7'b0111000, start, W1[54]);
	sensory_neuron s56(clk, dist, 7'b0111001, start, W1[55]);
	sensory_neuron s57(clk, dist, 7'b0111010, start, W1[56]);
	sensory_neuron s58(clk, dist, 7'b0111011, start, W1[57]);
	sensory_neuron s59(clk, dist, 7'b0111100, start, W1[58]);
	sensory_neuron s60(clk, dist, 7'b0111101, start, W1[59]);
	sensory_neuron s61(clk, dist, 7'b0111110, start, W1[60]);
	sensory_neuron s62(clk, dist, 7'b0111111, start, W1[61]);
	sensory_neuron s63(clk, dist, 7'b1000000, start, W1[62]);
	sensory_neuron s64(clk, dist, 7'b1000001, start, W1[63]);
	sensory_neuron s65(clk, dist, 7'b1000010, start, W1[64]);
	sensory_neuron s66(clk, dist, 7'b1000011, start, W1[65]);
	sensory_neuron s67(clk, dist, 7'b1000100, start, W1[66]);
	sensory_neuron s68(clk, dist, 7'b1000101, start, W1[67]);
	sensory_neuron s69(clk, dist, 7'b1000110, start, W1[68]);
	sensory_neuron s70(clk, dist, 7'b1000111, start, W1[69]);
	sensory_neuron s71(clk, dist, 7'b1001000, start, W1[70]);
	sensory_neuron s72(clk, dist, 7'b1001001, start, W1[71]);
	sensory_neuron s73(clk, dist, 7'b1001010, start, W1[72]);
	sensory_neuron s74(clk, dist, 7'b1001011, start, W1[73]);
	sensory_neuron s75(clk, dist, 7'b1001100, start, W1[74]);
	sensory_neuron s76(clk, dist, 7'b1001101, start, W1[75]);
	sensory_neuron s77(clk, dist, 7'b1001110, start, W1[76]);
	sensory_neuron s78(clk, dist, 7'b1001111, start, W1[77]);
	sensory_neuron s79(clk, dist, 7'b1010000, start, W1[78]);
	sensory_neuron s80(clk, dist, 7'b1010001, start, W1[79]);
	sensory_neuron s81(clk, dist, 7'b1010010, start, W1[80]);
	sensory_neuron s82(clk, dist, 7'b1010011, start, W1[81]);
	sensory_neuron s83(clk, dist, 7'b1010100, start, W1[82]);
	sensory_neuron s84(clk, dist, 7'b1010101, start, W1[83]);
	sensory_neuron s85(clk, dist, 7'b1010110, start, W1[84]);
	sensory_neuron s86(clk, dist, 7'b1010111, start, W1[85]);
	sensory_neuron s87(clk, dist, 7'b1011000, start, W1[86]);
	sensory_neuron s88(clk, dist, 7'b1011001, start, W1[87]);
	sensory_neuron s89(clk, dist, 7'b1011010, start, W1[88]);
	sensory_neuron s90(clk, dist, 7'b1011011, start, W1[89]);
	sensory_neuron s91(clk, dist, 7'b1011100, start, W1[90]);
	sensory_neuron s92(clk, dist, 7'b1011101, start, W1[91]);
	sensory_neuron s93(clk, dist, 7'b1011110, start, W1[92]);
	sensory_neuron s94(clk, dist, 7'b1011111, start, W1[93]);
	sensory_neuron s95(clk, dist, 7'b1100000, start, W1[94]);
	sensory_neuron s96(clk, dist, 7'b1100001, start, W1[95]);
	sensory_neuron s97(clk, dist, 7'b1100010, start, W1[96]);
	sensory_neuron s98(clk, dist, 7'b1100011, start, W1[97]);
	sensory_neuron s99(clk, dist, 7'b1100100, start, W1[98]);
	sensory_neuron s100(clk, dist, 7'b1100101, start, W1[99]);
	
		
	//2 Direction Ganglions	
	direction_ganglion d1(clk, W1, start, 1'b1, W2, W4);
	direction_ganglion d2(clk, W1, start, 1'b0, W3, W5);
	
	//20 Interneurons
	inter_neuron in1(clk, W5, 7'b1100100, mode, W6, W7, W8);
	inter_neuron in2(clk, W5, 7'b1011111, mode, W51, W32, W13);
	inter_neuron in3(clk, W5, 7'b1011010, mode, W52, W33, W14);
	inter_neuron in4(clk, W5, 7'b1010101, mode, W53, W34, W15);
	inter_neuron in5(clk, W5, 7'b1010000, mode, W54, W35, W16);
	inter_neuron in6(clk, W5, 7'b1001011, mode, W55, W36, W17);
	inter_neuron in7(clk, W5, 7'b1000110, mode, W56, W37, W18);
	inter_neuron in8(clk, W5, 7'b1000001, mode, W57, W38, W19);
	inter_neuron in9(clk, W5, 7'b0111100, mode, W58, W39, W20);
	inter_neuron in10(clk, W5, 7'b0110111, mode, W59, W40, W21);
	inter_neuron in11(clk, W5, 7'b0110010, mode, W60, W41, W22);
	inter_neuron in12(clk, W5, 7'b0101101, mode, W61, W42, W23);
	inter_neuron in13(clk, W5, 7'b0101000, mode, W62, W43, W24);
	inter_neuron in14(clk, W5, 7'b0100011, mode, W63, W44, W25);
	inter_neuron in15(clk, W5, 7'b0011110, mode, W64, W45, W26);
	inter_neuron in16(clk, W5, 7'b0011001, mode, W65, W46, W27);
	inter_neuron in17(clk, W5, 7'b0010100, mode, W66, W47, W28);
	inter_neuron in18(clk, W5, 7'b0001111, mode, W67, W48, W29);
	inter_neuron in19(clk, W5, 7'b0001010, mode, W68, W49, W30);
	inter_neuron in20(clk, W5, 7'b0000101, mode, W69, W50, W31);
	
	//Memory Neuron Array
	memory_neuron m(clk, W8, W13, W14, W15, W16, W17, W18, W19, 
						W20, W21, W22, W23, W24, W25, W26, W27, W28, 
						W29, W30, W31, W7, W32, W33, W34, W35, W36, 
						W37, W38, W39, W40, W41, W42, W43, W44, W45, 
						W46, W47, W48, W49, W50, W6, W51, W52, W53, 
						W54, W55, W56, W57, W58, W59, W60, W61, W62, 
						W63, W64, W65, W66, W67, W68, W69, W9, W10, 
						W11, W12);
	
	//Intelligent Stimuli-Comparison Unit
	intelligent_stimuli_comparison_unit iscu(clk, E, W4, W5, mode, W11, W12, W2, W3, color, OE, shape, W9, W10);

endmodule
