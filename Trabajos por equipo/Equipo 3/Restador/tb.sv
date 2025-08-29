module tb;					// BANCO DE PRUEBAS
	reg [7:00]a,b;			// ENTRADAS
	wire [7:0] sub;		// SALIDAS
	wire overflow;
	integer ref_a=0;
	integer ref_b=0;
	integer ref_sub=0;
	Restador Restador_i(.a(a),.b(b),.sub(sub),.overflow(overflow)); // INSTANCIAMOS NUESTRA PRUEBA
	
	initial begin							// AQUI SE COMIENZAN LAS PRUEBAS
		repeat (100) begin
			a=$random;						// ASIGNAR UN ESTIMULO RANDOM A (A)
			b=$random;
			ref_a = a;						// ASIGNAR A UNA VARIABLE DE REFERENCIA
			ref_b = b;
			ref_sub = ref_a - ref_b;
			if (ref_sub != sub)
				$display("error");
			#10;
		end
	end

endmodule
	