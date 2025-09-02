module SevenSegBCD(input wire [3:0]bcd, output wire [6:0]seg, output comun);

always
wire [6:0] seg_ = 
	(bdc == 4'd0) ? 7'b1000000:
	(bdc == 4'd1) ? 7'b1111001:
	(bdc == 4'd2) ? 7'b0100100:
	(bdc == 4'd3) ? 7'b0000110:
	(bdc == 4'd4) ? 7'b0011001:
	(bdc == 4'd5) ? 7'b0010010:
	(bdc == 4'd6) ? 7'b0000010:
	(bdc == 4'd7) ? 7'b1111000:
	(bdc == 4'd8) ? 7'b0000000:
	(bdc == 4'd9) ? 7'b0000100:
						 7'b1111111;
	
	
	assign seg=seg_;
	assign comun= 1'b1;
	

endmodule
