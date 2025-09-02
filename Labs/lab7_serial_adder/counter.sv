module counter #(parameter WIDTH=4)(
    input clk,
    input busy,
    output cnt_done
);
    reg [$clog2(WIDTH)-1:0] count;

    always @(posedge clk) begin
        if (busy) begin
            count <= count+1;
        end else begin
            count <= {$clog2(WIDTH){1'b0}};
        end
    end

    assign cnt_done = count==WIDTH-1;
    

endmodule