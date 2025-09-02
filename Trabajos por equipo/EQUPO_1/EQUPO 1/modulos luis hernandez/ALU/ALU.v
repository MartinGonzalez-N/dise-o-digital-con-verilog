module ALU(
input [3:0]a,
input[3:0]b,
input [1:0]control,
output reg[3:0]result, 
output v,n,z,
output reg c
);

always @(*) begin 
case(control)
2'b00: {c,result} = a+b;
2'b01: {c,result} = a-b;
2'b10: result = a&b;
2'b11: result = a|b;
endcase 
end

assign z = result == 0;
assign n = result[3];
assign v = a[3]^b[3]^control[0];

endmodule 