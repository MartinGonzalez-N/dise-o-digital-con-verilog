module shiftregister #(parameter N = 4) //numero de etapas
       (input clk, 
		  input arstn,
		  input shift_en,
		  input dir,
		  input rot_in,
		  input in,
		  output reg [N-1:0]Q);
		  
		  
always @(posedge clk or negedge arstn) begin 
   if(!arstn)
	Q <= {N{1'b0}}; 
	else if(shift_en) begin 
	  if (dir) begin
	  if (rot_in)
	  Q <={in, Q[N-1:1]};
	  else 
	  Q <={Q[0], Q[N-1:1]};
	end
	else begin 
	
	if(rot_in)
	Q<= {Q[N-2:2], in};
	else
	Q<= {Q[N-2:2], Q[N-1]};
	end
  end
 end 
endmodule 