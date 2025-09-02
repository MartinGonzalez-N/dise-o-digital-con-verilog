module counter(input clk,
					input arstn,
					input en,
					//input [3:0]preset,
					output reg[3:0]count);

localparam PRESET = 4'd9;
always @(posedge clk or negedge arstn) begin
	if(!arstn)
		count <= 4'b0000;
	else begin
		if(en)
			if(PRESET == count)
				count <= 4'b0000;
			else
				count <= count + 1;
	end
end

endmodule