

module bcd_7seg(
	input A,
	input B,
	input C,
	input D,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g
);

	assign a = (B && ~C && ~D) || (~A && ~B && ~C && D);
	assign b = (B && ~C && D) || (B && C && ~D);
	assign c = ~B && C && ~D;
	assign d = (B && ~C && ~D) || (B && C && D) || (~A && ~B && ~C && D);
	assign e = D || (B && ~C);
	assign f = (~B && C) || (C && D) || (~A && ~B && D);
	assign g = (~A && ~B && ~C) + (B && C && D);

endmodule