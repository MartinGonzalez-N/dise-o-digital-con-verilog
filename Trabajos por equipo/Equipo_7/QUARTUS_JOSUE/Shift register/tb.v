module tb;
	parameter WIDTH = 4;

	reg clk=0;
	reg arst=0;
	reg s_in=0;
	reg en=0;
	reg dir=0;
	reg rot=0;
	wire [WIDTH-1:0]out;
	Lab4A shifter_i(.clk(clk),
						.arst(arst),
						.s_in(s_in),
						.en(en),
						.dir(dir),
						.rot(rot),
						.out(out));
	
	always #5 clk = ~clk;
		initial begin
			arst = 0;
			#100	
			arst = 1;
			en = 1;
			s_in = $random;
			repeat (10) begin
				@(negedge clk);
				s_in = $random;
			end
			
			dir = 1;
			repeat (10) begin
				@(negedge clk);
				s_in = $random;
			end
		end
	
endmodule 

