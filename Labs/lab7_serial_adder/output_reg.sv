module output_reg #(parameter WIDTH=4)(
    input clk, in, shift,
    output reg[WIDTH-1:0]out
    );
    
    genvar i;
    generate
    for (i=0; i<(WIDTH-1); i=i+1) begin:bit_loop
        always @(posedge clk) 
        begin
            if (shift)
                out[i] <= out[i+1];
            else
                out[i] <= out[i];
        end  
    end    
    endgenerate

    always @(posedge clk) begin
        if (shift)
            out[WIDTH-1] <= in;
        else
            out[WIDTH-1] <= out[WIDTH-1];
    end
    
endmodule
