
module SevenSegBCD(input [3:0]bcd, output reg[6:0]seg);

always @(*)
begin
	seg = (bcd == 4'd0) ? 7'b1000000:
	(bcd == 4'd1) ? 7'b1111001:
	(bcd == 4'd2) ? 7'b0100100:
	(bcd == 4'd3) ? 7'b0110000:
	(bcd == 4'd4) ? 7'b0011001:
	(bcd == 4'd5) ? 7'b0010010:
	(bcd == 4'd6) ? 7'b0000010:
	(bcd == 4'd7) ? 7'b1111000:
	(bcd == 4'd8) ? 7'b0000000:
	(bcd == 4'd9) ? 7'b0010000:
						 7'b1111111;	
		
end



endmodule
