module top (input clk, 
            input arstn, 
            input en, 
            input[3:0]preset, 
				output reg[6:0]display,
				output [3:0]bin);
				

            wire [3:0] count;
  counter count_i(.clk(clk),.arstn(arstn),.en(en),.preset(preset),.count(count));
  bcd bcd_i(.a(count),.display(display));
  
  endmodule
  