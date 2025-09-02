module bcd_dec(
    input  wire [3:0]   bin,
    output wire [6:0]   segment
);

    wire A0, A1, A2, A3;
    wire a, b, c, d, e, f, g;

    assign a = !((A1 & !A0) | (!A3 & A1) | (A2 & A1) | (!A3 & A2 & A0) |(A3 & !A2 & !A1) | (!A3 & !A2 & !A0) | (A3 & A2 & !A0));
    assign b = !((!A3 & !A2) | (!A3 & !A1 & !A0) | (!A3 & A1 & A0) | (A3 & !A1 & A0) | (!A2 & !A0));
    assign c = !((!A3 & !A1) | (!A3 & A0) | (!A3 & A2) | (!A1 & A0) |(A3 & !A2));
    assign d = !((A3 & !A1) | (A2 & A1 & !A0) | (!A3 & !A2 & A1) | (!A2 & !A1 & !A0) | (!A2 & A1 & A0) | (A2 & !A1 & A0));
    assign e = !((A1 & !A0) | (A3 & A1) | (A3 & !A0) | (A3 & A2) | (!A2 & !A0));
    assign f = !((!A1 & !A0) | (A3 & A1) | (A3 & !A2) | (A2 & !A0) | (!A3 & A2 & !A1));
    assign g = !((A1 & !A0) | (!A2 & A1) | (A3 & !A2) | (A3 & A0) | (!A3 & A2 & !A1));
    
    assign {A3, A2, A1, A0} = bin;
    assign segment = {g, f, e, d, c, b, a};
    

endmodule