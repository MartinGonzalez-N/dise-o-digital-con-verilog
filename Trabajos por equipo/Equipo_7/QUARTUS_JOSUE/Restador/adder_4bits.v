module adder_4bits #(parameter WIDTH = 4)(
input [WIDTH-1:0]a,b, 
input carry_in, 
output [WIDTH-1:0]sum, 
output carry_out);
	wire [WIDTH-1:0]carry;
	Restador #(.WIDTH(4)) adder0(.a(a[0]),.b(b[0]),.ov(ov),.sum(sum[0]),.carry_out(carry[0]));
	Restador #(.WIDTH(4)) adder1(.a(a[1]),.b(b[1]),.ov(carry[0]),.sum(sum[1]),.carry_out(carry[1]));
	Restador #(.WIDTH(4)) adder2(.a(a[2]),.b(b[2]),.ov(carry[1]),.sum(sum[2]),.carry_out(carry[2]));
	Restador #(.WIDTH(4)) adder3(.a(a[3]),.b(b[3]),.ov(carry[2]),.sum(sum[3]),.carry_out(carry[3]));
	assign carry_out = carry[3];
endmodule 