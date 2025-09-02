module top(input clk, 
			  input arstn,
			  input en,
			  output [6:0]segment);

wire [3:0]count;
wire count_en;

freq_div clk_1hz(.clk(clk),.arstn(arstn),.en(en),.slow_clk(count_en));

counter counter_i(.clk(clk),.arstn(arstn),.en(count_en),.count(count));

bcd_dec bcd_dec_i(.bin(count),.segment(segment));


endmodule