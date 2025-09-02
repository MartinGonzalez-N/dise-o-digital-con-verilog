module control_fsm(
    input clk,
	 input rst,
    input start,
    input cnt_done,
    output reg busy,
    output reg done
);
    localparam STATE_IDLE = 0;
    localparam STATE_START = 1;
    localparam STATE_BUSY = 2;
    localparam STATE_DONE = 3;
    reg [1:0] state;
    reg [1:0] next_state;

    always @(posedge clk) begin
        if(rst)
			state <= 2'b00;
		  else
			state <= next_state;
    end

    always @(*) begin
        case (state)
            STATE_IDLE: 
            if (!start) begin
                next_state = STATE_START;
            end else begin
                next_state = STATE_IDLE;
            end
            STATE_START:
            if (start) begin
                next_state = STATE_BUSY;
            end else begin
                next_state = STATE_START;
            end
            STATE_BUSY:
            if (cnt_done) begin
                next_state = STATE_DONE;
            end else begin
                next_state = STATE_BUSY;
            end
            STATE_DONE: 
            next_state = STATE_IDLE;
        endcase
    end

    always @(posedge clk) begin
        if (next_state==STATE_BUSY) begin
            busy <= 1'b1;
        end else begin
            busy <= 1'b0;
        end
        if (next_state==STATE_DONE) begin
            done <= 1'b1;
        end else begin
            done <= 1'b0;
        end
    end
endmodule