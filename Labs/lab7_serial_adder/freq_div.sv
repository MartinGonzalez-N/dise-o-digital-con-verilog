module freq_div #(
    parameter T_IN=1, T_OUT=1
) (
    input clk_in,
    output clk_out
);
//T_OUT=T_INx(MAX_CNT+1)
localparam MAX_CNT = T_OUT/T_IN-1;
reg [$clog2(MAX_CNT)-1:0] cnt = 0;

always @(posedge clk_in) begin
    if(cnt==MAX_CNT)
        cnt <= {$clog2(MAX_CNT){1'b0}};
    else
        cnt <= cnt + 1;
end

assign clk_out = (cnt==MAX_CNT);

endmodule