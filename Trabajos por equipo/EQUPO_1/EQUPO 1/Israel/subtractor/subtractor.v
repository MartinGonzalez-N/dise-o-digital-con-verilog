module subtractor #(parameter N=8)
(input [N-1:0]A, input [N-1:0]B, output reg OVF, output reg [N-1:0]R);

always @(*) begin

	R = A-B;
	if (A[N-1:0] != B[N-1:0] && A[N-1:0] != R[N-1:0])
		OVF = 1'b1;
	else
		OVF = 1'b0;
end
endmodule 