module tb;
    parameter LENGTH=4;
    reg clk=0, arst_n, s_in, en, load;
    reg [LENGTH-1:0] p_in;
    reg [LENGTH-1:0] out;

    always #5 clk = ~clk;

    initial begin
        //reset and init variables
        s_in = 0;
        p_in = 0;
        en = 0;
        load = 0;
        arst_n = 0;
        #20;
        arst_n = 1;
        //start logic
        repeat(3) begin
            @(negedge clk);
            load = 1;
            p_in = $random;
            @(posedge clk);
            #1;
            $display("parallel load -- %b <-- %b - load=%0b",out,p_in,load);
            repeat(10) begin
                @(negedge clk);
                load = 0;
                p_in = $random;
                en = $random;
                s_in = $random;
                @(posedge clk);
                #1;
                $display("shifting %b <-- %0b - shift=%0b",out,s_in,en);
            end
        end
        $finish;
    end

    //instantiate module
    bit_shifter_parallel_load #(.LENGTH(LENGTH))shifters(.clk(clk),.arst_n(arst_n),.en(en),.load(load),.s_in(s_in),.p_in(p_in),.out(out));

endmodule