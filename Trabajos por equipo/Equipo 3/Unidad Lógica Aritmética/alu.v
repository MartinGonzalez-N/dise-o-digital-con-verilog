module alu (
input [3:00]a,
input [3:00]b,
input [1:00]control,
output reg [3:00]result,
/* BANDERAS*/
output v,n,z,
output reg c
);

always @(*)begin
case(control)
2'b00: {c,result} = a+b;
2'b01: {c,result} = a-b;
2'b10: begin
result = a&b;
c = 0;
end

2'b11: begin
	result = a|b;
	c = 0;
	end
endcase
end

assign z= result == 0; 
assign n= result[3];
assign v= ~(a[3]^b[3]^control[0]) && (a[3]^result[3]) && (~control[1]);

endmodule
