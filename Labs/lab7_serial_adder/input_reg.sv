module input_reg #(parameter WIDTH=4)(
    input clk, shift, load,
    input [WIDTH-1:0] p_in,
    output out
    );
    
    reg [WIDTH-1:0] data;

    assign out = data[0];

    genvar i;
    generate
    for (i=0; i<(WIDTH-1); i=i+1) begin:bit_loop
        always @(posedge clk) 
        begin
            if(load) //priority
                data[i] <= p_in[i];
            else if (shift)
                data[i] <= data[i+1];
            else
                data[i] <= data[i];
        end
    end    
    endgenerate

    always @(posedge clk) begin
        if(load)
            data[WIDTH-1] <= p_in[WIDTH-1];
        else if (shift)
            data[WIDTH-1] <= 1'b0;
        else
            data[WIDTH-1] <= data[WIDTH-1];
    end

    
endmodule