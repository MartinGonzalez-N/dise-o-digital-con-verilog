module Displays_Sumador (input num_0, input num_1, input num_2, input num_3, 
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g);
	
	assign a = (num_1&&~num_2&&~num_3) || (~num_0&&~num_1&&~num_2&&num_3);
	assign b = (num_1&&~num_2&&num_3) || (num_1&&num_2&&~num_3);
	assign c = (~num_1&&num_2&&~num_3);
	assign d = (num_1&&~num_2&&~num_3) || (num_1&&num_2&&num_3) || (~num_0&&~num_1&&~num_2&&num_3);
	assign e = (num_3) || (num_1&&~num_2);
	assign f = (~num_1&&num_2) || (num_2&&num_3) || (~num_0&&~num_1&&num_3);
	assign g = (~num_0&&~num_1&&~num_2) || (num_1&&num_2&&num_3);
endmodule
