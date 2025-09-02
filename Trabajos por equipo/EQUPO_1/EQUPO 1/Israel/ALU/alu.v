module alu(input [3:0]A, input [3:0]B, input [2:0]control, output reg[3:0]result, output V,N,Z, output reg C);

always @(*) begin
C=0;
case(control)
	3'b000: result= A & B;
	3'b001: result= A | B;
	3'b010: result= A ^ B;
	3'b011: result= A >> B;
	3'b100: {C,result} = A + B;
	3'b101: {C,result} = A - B;
	3'b110: result=(A<B ? 4'b0001 : 4'b0000);
	3'b111: result=(A==B ? 4'b0001 : 4'b0000);
endcase
end

assign Z = result == 0;
assign N = result[3];
assign V = ~(A[3]^B[3]^control[0]) && (A[3]^result[3]) && (~control[1]);

endmodule