module Lab4A #(parameter WIDTH = 4)(
	input s_in,
	input arst,
	input clk,	
	input en,
	input dir,
	input rot,
	output reg [WIDTH-1:0]out
	);
	
	always @(posedge clk or negedge arst) 
	begin
		if (!arst) 
			out <= {WIDTH{1'b0}};
				else if (en) begin
					if (dir) begin
					if(rot)
					out <= {out[WIDTH-2:0],out[WIDTH-1]};
					else
					out <= {out [WIDTH-2:0],s_in};
					end else begin
					if(rot)
					out <= {out [WIDTH-1], out [WIDTH-1:1]};
					else
					out <= {s_in, out[WIDTH-1:1]};
				end
			end
		end
endmodule 