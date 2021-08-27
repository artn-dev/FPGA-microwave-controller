`include "TimerInput.v"
`timescale 1ms/1ns

module TimerInput_tb;
    reg  [9:0] kbd;
    reg  enn, clk;
    wire [3:0] D;
    wire loadn, pgt_1Hz;

    always #5 clk = ~clk;

    TimerInput DUT(
        kbd, enn, clk,
        D, loadn, pgt_1Hz
    );
    
    initial begin
        clk = 0;
        $dumpfile("TimerInput.vcd");
        $dumpvars(0, TimerInput_tb);

        enn=1; kbd=10'b0000000000; #1000;
        enn=1; kbd=10'b0000000010; #1000;
        enn=1; kbd=10'b0010000000; #1000;
        enn=1; kbd=10'b0010000010; #1000;
        enn=0; kbd=10'b0000000000; #1000;
        enn=0; kbd=10'b0010000010; #1000;
        enn=0; kbd=10'b0000000000; #1000;
        enn=0; kbd=10'b0010000000; #1000;
        enn=0; kbd=10'b0000000000; #1000;
        enn=0; kbd=10'b0000000010; #1000;
        enn=0; kbd=10'b0000000000; #1000;
        enn=1; kbd=10'b0000000010; #1000;
        enn=1; kbd=10'b0000000000; #5000;

        $finish();
    end
endmodule