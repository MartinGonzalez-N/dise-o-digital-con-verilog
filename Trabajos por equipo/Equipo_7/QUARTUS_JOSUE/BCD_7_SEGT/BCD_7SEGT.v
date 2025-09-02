module BCD_7SEGT (
	input [3:0]bit4, 
	output reg [6:0]segt);

	always @(*) begin
		case 	(bit4)
			4'b0000: segt = 7'b0000001; //0
			4'b0001: segt = 7'b1001111; //1
			4'b0010: segt = 7'b0010010; //2
			4'b0011: segt = 7'b0000110; //3
			4'b0100: segt = 7'b1001100; //4
			4'b0101: segt = 7'b0100100; //5
			4'b0110: segt = 7'b0100000; //6
			4'b0111: segt = 7'b0001111; //7
			4'b1000: segt = 7'b0000000; //8
			4'b1001: segt = 7'b0000100; //0
			default: segt = 7'b1111111; //Apagado
		endcase
	end
endmodule
	