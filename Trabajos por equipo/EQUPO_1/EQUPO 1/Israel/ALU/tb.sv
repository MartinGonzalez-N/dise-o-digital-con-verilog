module tb;
reg [3:0]A; 
reg [3:0]B;
reg [2:0]control;
wire [3:0]result;

alu alu_i (.A(A),.B(B),.control(control),.result(result),.C(C),.V(V),.N(N),.Z(Z));

initial begin
#10;

//and
repeat (25) begin
A = $random;
B = $random;
control = 3'b000;
#10;
end

//or
repeat (25) begin
A = $random;
B = $random;
control = 3'd001;
#10;
end

//XOR
repeat (25) begin
A = $random;
B = $random;
control = 3'b010;
#10;
end

//SLL
repeat (25) begin
A = $random;
B = $random;
control = 3'b011;
#10;
end
//adder
repeat (25) begin
A = $random;
B = $random;
control = 3'd100;
#10;
end

//sub
repeat (25) begin
A = $random;
B = $random;
control = 3'b101;
#10;
end

//SLTU
repeat (25) begin
A = $random;
B = $random;
control = 3'b110;
#10;
end

//SEQ
repeat (25) begin
A = $random;
B = $random;
control = 3'b111;
#10;
end

end
endmodule