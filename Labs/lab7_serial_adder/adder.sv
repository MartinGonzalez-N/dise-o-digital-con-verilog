module adder #(
    parameter ADDER_WIDTH=1
) (
    input ci,
    input [ADDER_WIDTH-1:0]a,
    input [ADDER_WIDTH-1:0]b,
    output[ADDER_WIDTH-1:0]s,
    output co
);

    wire [ADDER_WIDTH-1:0]g;
    wire [ADDER_WIDTH-1:0]p;
    wire [ADDER_WIDTH:0]c;

    assign c[0] = ci;
    assign co = c[ADDER_WIDTH];

    genvar i;
    generate
        for (i=0 ;i<ADDER_WIDTH ;i=i+1) begin:bit_adder
            assign s[i] = a[i] ^ b[i] ^ c[i];
            assign g[i] = a[i] & b[i];
            assign p[i] = a[i] | b[i];
            assign c[i + 1] = g[i] | (p[i] & c[i]);
        end
    endgenerate
endmodule