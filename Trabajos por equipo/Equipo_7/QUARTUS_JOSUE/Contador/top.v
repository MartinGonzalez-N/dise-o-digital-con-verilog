module top (
	input clk,
	input arst,
	input en,
	input [3:0]preset,
	output [6:0]display,
	output [3:0]bin

);
	wire [3:0] count;
	counter count_1(.clk(clk),.arst(arst),.en(en),.preset(preset),.count(count));
	
	bcd bcd_i(.a(count),.display(display));
	
	assign bin = count;
	
endmodule 