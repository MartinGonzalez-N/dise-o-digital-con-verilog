module freq_div #(parameter WIDTH = 32)	
				(input clk, 
				input arstn,
				input en,
				//input [WIDTH-1:0]preset,
				//input [WIDTH-1:0]threshold,
				output slow_clk);

//localparam FREQ_IN = 50_000_000; //Freq_in
//localparam FREQ_OUT = 1; //freq_out (min cycle is 1s)
//localparam DUTY_CYCLE = 50; //0-100

localparam PRESET = 50000000-1;//(FREQ_IN/FREQ_OUT)-1;
localparam THRESHOLD = 50000000-1;//PRESET*DUTY_CYCLE/100;

reg[WIDTH-1:0]count;	

always @(posedge clk or negedge arstn) begin
	if (!arstn)
		count <= {WIDTH{1'b0}};
	else if (en) begin
		if (PRESET == count)
			count <= {WIDTH{1'b0}};
		else
			count <= count + 1;
	end else 
			count <= {WIDTH{1'b0}};
end

assign slow_clk = count >= THRESHOLD;

endmodule