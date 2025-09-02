module tb;
	reg [7:0]A,B;
	wire [7:0] R;
	wire OVF;
	integer ref_A=0;
	integer ref_B=0;
	integer ref_R=0;
	subtractor subtractor_i(.A(A),.B(B),.R(R),.OVF(OVF));
	
	initial begin
		repeat (100) begin
			A=$random;
			B=$random;
			ref_A=A;
			ref_B=B;
			ref_R=ref_A - ref_B;
			if (ref_R == R)
				$display("error");
			#10;
		end
	end
endmodule