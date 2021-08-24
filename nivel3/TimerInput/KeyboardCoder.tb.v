`include "KeyboardCoder.v"

module KeyboardCoder_tb;
    reg  [9:0] kbd;
    reg  en;
    wire [3:0] out;
    wire valid_input;

    KeyboardCoder coder(kbd, en, out, valid_input);

    initial begin
        // setup
        $dumpfile("KeyboardCoder.vcd");
        $dumpvars(0, KeyboardCoder_tb);

        en=1; kbd=10'b0000000001; #10;
        en=0; kbd=10'b0000000001; #10;
        en=0; kbd=10'b0000000010; #10;
        en=1; kbd=10'b0001000000; #10;
        en=0; kbd=10'b0001000000; #10;
        en=0; kbd=10'b0000000000; #10;
        en=1; kbd=10'b0000000000; #10;
        en=0; kbd=10'b0100000100; #10;
    end
    
endmodule