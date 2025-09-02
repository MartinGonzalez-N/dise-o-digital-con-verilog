module shift_register #(parameter WIDTH = 4)(
	input clk,
	input arstn,
	input [WIDTH-1:0]parallel_in,
	input load,
	input en,
	output out
);

		reg [WIDTH-1:0]shift_reg;
	
		always @(posedge clk or negedge arstn) begin
			if(!arstn)
				shift_reg <= {WIDTH{1'b0}};
			else if (en) begin
				shift_reg <= {1'b0, shift_reg[WIDTH-1:1]};
			end
			else if (load) begin
				shift_reg <= parallel_in;
			end
			
		end
		
		assign out = shift_reg[0];
		
endmodule  