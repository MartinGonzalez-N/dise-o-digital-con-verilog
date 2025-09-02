module top (

	input a,
	input b,
	input clk,
	input arstn,
	input en,
	input load,
	output out
);
	wire adder_a;
	wire adder_b;
	wire adder_sum;
	
	shift_register shift_r1 (.clk(clk),.arstn(arstn),.parallel_in(a),.en(en),.load(load),.out(adder_a));
	
	shift_register shift_r2 (.clk(clk),.arstn(arstn),.parallel_in(b),.en(en),.load(load),.out(adder_b));
	
	fulladder adder_1 (.a(adder_a),.b(adder_b),.sum(adder_sum),.cin(),.cout());
	
	serial_register S_register (.clk(clk),.arstn(arstn),.s_in(adder_sum),.en(en),.out(out));

endmodule 
	
	
	
	