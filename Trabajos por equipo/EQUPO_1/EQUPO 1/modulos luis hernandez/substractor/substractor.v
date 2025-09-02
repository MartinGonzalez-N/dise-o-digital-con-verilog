module substractor #(
    parameter WIDTH = 8
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH-1:0] result,
    output overflow
);

    // Invert all bits of 'b' (one's complement)
    wire [WIDTH-1:0] b_inv;
    assign b_inv = ~b;

    // Add 1 to the inverted 'b' to get its two's complement.
    // This is essentially A + (-B).
    wire [WIDTH-1:0] sum;
    wire carry_out;
    assign {carry_out, sum} = a + b_inv + 1'b1;

    // The result is the sum, which is already in two's complement.
    assign result = sum;

    // Overflow detection for A - B
    // An overflow occurs when the most significant bit of the inputs
    // and the result follow a specific pattern:
    // a[MSB] and b[MSB] are different, and result[MSB] is different from a[MSB]
    // A simpler and more robust way is to use the carries of the MSB.
    wire carry_in_msb;
    wire carry_out_msb;

    // We can get the carry out of the (WIDTH-1)th bit by looking at the
    // addition of the MSBs.
    assign carry_out_msb = a[WIDTH-1] & b_inv[WIDTH-1] | a[WIDTH-1] & sum[WIDTH-1] | b_inv[WIDTH-1] & sum[WIDTH-1];
    
    // The carry in to the MSB is the carry out from the (WIDTH-2)th bit.
    // The addition is a + (~b) + 1. Let's call this c = a + d, where d = ~b + 1.
    // The MSB addition is a[WIDTH-1] + (~b[WIDTH-1]) + carry_in_msb.
    // The overall carry_out is from a + ~b + 1.
    // The most common and correct method for two's complement addition overflow is
    // to check if the carry_in to the MSB is different from the carry_out from the MSB.
    // However, the standard implementation of a full adder makes this more complex.
    // A simpler and more common approach is to check the signs of the operands and the result.
    
    // Overflow detection using signs:
    // a > 0, b < 0, result < 0 -> overflow
    // a < 0, b > 0, result > 0 -> overflow
    assign overflow = (a[WIDTH-1] & ~b[WIDTH-1] & ~result[WIDTH-1]) | (~a[WIDTH-1] & b[WIDTH-1] & result[WIDTH-1]);

endmodule 