

	module bit_shifter_parallel_load #(parameter LENGTH=4)(
		input clk, s_in, shift, load, arst_n,
		input [LENGTH-1:0] p_in,
		output reg[LENGTH-1:0]out);
		
		genvar i;
		generate
		for (i=1; i<LENGTH; i=i+1) 
		begin:bit_loop
			always @(posedge clk or negedge arst_n) 
			begin
				if (!arst_n) 
					out[i] <= 1'b0;
				else if(load) //priority
					out[i] <= p_in[i];
				else if (shift)
					out[i] <= out[i-1];
				else
					out[i] <= out[i];
			end
		end    
		endgenerate

		always @(posedge clk or negedge arst_n) 
		begin
			if (!arst_n) 
				out[0] <= 1'b0;
			else if(load)
				out[0] <= p_in[0];
			else if (shift)
				out[0] <= s_in;
			else
				out[0] <= out[0];
		end
	endmodule
	