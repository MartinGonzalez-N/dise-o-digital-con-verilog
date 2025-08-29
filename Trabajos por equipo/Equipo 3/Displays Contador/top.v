module top (input clk, 
				input arstn, 
				input en, 
				input [3:0]preset, 
				output [0:6]display,
				output [3:0]bin);
				
wire [3:0] count;
assign bin = count;

counter count_i(.clk(clk),.arstn(arstn),.en(en),.preset(preset),.count(count));

bcd2 bcd2_i(.a(count),.display(display));
				
endmodule
