module tb;
	reg [3:0]a,b;
	wire [3:0] sub;
	wire overflow;
	integer ref_a=0;
	integer ref_b=0;
	integer ref_sub=0;
	Restador restador_i(.a(a),.b(b),.sub(sub),.overflow (overflow));
	
	initial begin
		repeat (100) begin
			a=$random;
			b=$random;
			ref_a = a;
			ref_b = b;
			ref_sub = ref_a -ref_b;
			//if (ref_sub = sub)
			//	$display("error");
			assert (ref_sub == sub);
			#10;
		end
	end
endmodule 