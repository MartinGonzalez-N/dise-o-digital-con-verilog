module fulladder (
	input wire a, b, cin,
	output wire sum, cout
);

	assign {cout, sum} = a + b + cin;
	
endmodule 