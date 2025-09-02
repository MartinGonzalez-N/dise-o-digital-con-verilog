module tb;

//variables
parameter WIDTH = 4;

reg clk=0; 
reg arstn=0; 
reg s_in=0;
reg en=0;
reg dir=0;
reg rot=0;
wire [WIDTH-1:0]out;

//intancias
shift shifter_i(.clk(clk),
					.arstn(arstn),
					.s_in(s_in),
					.en(en),
					.dir(dir),
					.rot(rot),
					.out(out));

//estimulos
always #5 clk = ~clk;

initial begin
arstn = 0;
#100;
arstn = 1;
en = 1;
s_in = $random;

//rot == 0, dir == 0 
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