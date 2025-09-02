module serial_adder_tb;
    parameter WIDTH = 4;
    bit clk;
	 bit rst;
    bit start;
    bit [WIDTH-1:0] in_a;
    bit [WIDTH-1:0] in_b;
    logic [WIDTH-1:0] sum;
    logic c;

    always #5 clk = ~clk;

    serial_adder #(WIDTH) serial_adder (.clk(clk),.rst(rst),.start(start),.in_a(in_a),.in_b(in_b),.sum(sum),.c(c));

//test control_fsm, counter and freq_div
//when start button is pushed (start == 0), control_fsm go to STATE_START 
//when start button is releaser (start == 0), control_fsm go to STATE_BUSY
//while control_fsm is busy counter_fsm increment with every slow_clk
//when counter_fsm reach max_value (max_value==bus_width) cnt_done==1
//when cnt_done==1 fsm_control go to STATE_DONE,
//when control_fsm is in STATE_DONE go to STATE_IDLE 
bit[2:0] hold_1;
bit[2:0] hold_2;
parameter MIN_HOLD = WIDTH + 3; //shift (WIDTH), set busy, set done, extra
int expected;
initial begin
    start = 1;
	 rst = 1;
    #100;
	 rst = 0;
    @(negedge clk);
    repeat(10) begin
        start = 0;
        in_a = $random;
        in_b = $random;
        expected = in_a + in_b;
        hold_1 = $random;
        hold_2 = $random;
        repeat(MIN_HOLD+hold_1) //hold start==0
            @(posedge clk);
        @(negedge clk);
        start = 1; 
        repeat(MIN_HOLD+hold_2) //hold start==1
            @(posedge clk);
        @(negedge clk);
        $display("a = %0d, b = %0d, expected = %0d, result = %0d",in_a, in_b,expected,{c,sum});
        check_sum:assert (expected[WIDTH-1:0] == sum);
        check_cassy:assert (expected[WIDTH] == c);
    end
    #1000;
    $finish;
end


endmodule