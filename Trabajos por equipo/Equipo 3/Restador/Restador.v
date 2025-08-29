module Restador #(parameter WIDTH = 8)(
input [WIDTH-1:0]a,
input [WIDTH-1:0]b,
output reg [WIDTH-1:0]sub,
output reg overflow
);

always @(*)begin
	sub = a-b;
	if (a[WIDTH-1] != b[WIDTH-1] && a[WIDTH-1] != sub[WIDTH-1])
		overflow = 1'b1;
	else
		overflow = 1'b0;

end
endmodule
			
	