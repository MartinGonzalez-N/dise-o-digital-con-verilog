module tb;
	parameter WIDTH = 4;
	reg [WIDTH-1:0]a,b;
	wire [WIDTH-1:0] sub;
	wire overflow;
	reg [WIDTH-1:0] ref_a=0; 
	reg [WIDTH-1:0] ref_b=0; 
	reg [WIDTH-1:0] ref_sub=0;
	
	subtractor #(.WIDTH(WIDTH)) sub_i(.a(a),.b(b),.sub(sub),.overflow(overflow));
	
	initial begin
		repeat (100) begin
			a=$random;
			b=$random;
			ref_a = a;
			ref_b = b;
			ref_sub = ref_a - ref_b;
			#1;
			check_sub:assert (ref_sub == sub);
			#9;
		end
	end
	
endmodule