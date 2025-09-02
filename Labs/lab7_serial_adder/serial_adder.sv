module serial_adder #(
    parameter WIDTH=4
) (
    input clk,
	 input rst,
    input start,
    input [WIDTH-1:0] in_a,
    input [WIDTH-1:0] in_b,
    output reg [WIDTH-1:0] sum,
    output reg c
);

    wire adder_in_a;
    wire adder_in_b;
    wire adder_out;
    wire carry_in;
    wire carry_out;
    wire [WIDTH-1:0] out_net;
    reg carry_reg;
    wire cnt_done;
    wire busy;
    wire done;
    wire en_cnt;

    control_fsm control_fsm_i (.clk(clk),.rst(rst),.start(start),.cnt_done(cnt_done),.busy(busy),.done(done));
    counter #(WIDTH) counter_i (.clk(clk),.busy(busy),.cnt_done(cnt_done));

    input_reg #(WIDTH) input_reg_a(.clk(clk),.shift(busy),.load(!start),.p_in(in_a),.out(adder_in_a));
    input_reg #(WIDTH) input_reg_b(.clk(clk),.shift(busy),.load(!start),.p_in(in_b),.out(adder_in_b));
    adder adder_i (.ci(carry_in),.a(adder_in_a),.b(adder_in_b),.s(adder_out),.co(carry_out));
    output_reg #(WIDTH) output_reg_i (.clk(clk),.in(adder_out),.shift(busy),.out(out_net));

    //carry reg
    always @(posedge clk) begin
        if (busy) begin
            carry_reg <= carry_out;
        end else begin
            carry_reg <= 1'b0;
        end
    end
    assign carry_in = carry_reg;
    
    //capture output
    always @(posedge clk) begin
        if (done) begin
            sum <= out_net;
            c <= carry_reg;
        end else begin
            sum <= sum;
            c <= c;
        end
    end
    
endmodule