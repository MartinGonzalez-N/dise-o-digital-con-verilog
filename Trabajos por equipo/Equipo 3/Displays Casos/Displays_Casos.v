module Displays_Casos (input [3:0]numc, output reg [6:0]out);
    always @(*)
    begin
        casez (numc)
            4'd0: begin
                out = 7'b1000000; // Display "0"
            end
            4'd1: begin
                out = 7'b1111001; // Display "1"
            end
            4'd2: begin
                out = 7'b0100100; // Display "2"
            end
            4'd3: begin
                out = 7'b0110000; // Display "3"
            end
            4'd4: begin
                out = 7'b0011001; // Display "4"
            end
            4'd5: begin
                out = 7'b0010010; // Display "5"
            end
            4'd6: begin
                out = 7'b0000010; // Display "6"
            end
            4'd7: begin
                out = 7'b1111000; // Display "7"
            end
            4'd8: begin
                out = 7'b0000000; // Display "8"
            end
            4'd9: begin
                out = 7'b0010000; // Display "9"
            end
            default: begin
                out = 7'b1111111; // Apagar todos los segmentos
            end
        endcase
    end
endmodule
