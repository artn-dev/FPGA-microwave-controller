`timescale 1ms/1ns
`include "FrequencyDelayer_1hz.v"

module FrequencyDelayer_1hz_tb;
    // frequência de 100 Hz = peŕiodo de 10ms
    parameter HALF_PERIOD = 5;

    reg  clk;
    wire out;

    always #HALF_PERIOD clk = ~clk;

    FrequencyDelayer_1hz cnt(clk, out);

    initial begin
        clk = 1;
        $dumpfile("FrequencyDelayer_1hz.vcd");
        $dumpvars(0, FrequencyDelayer_1hz_tb);

        #2000;
        $finish();
    end

endmodule