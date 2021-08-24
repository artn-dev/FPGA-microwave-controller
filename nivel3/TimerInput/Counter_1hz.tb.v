`timescale 1ms/1ns
`include "Counter_1hz.v"

module Counter_1hz_tb;
    // frequência de 100 Hz = peŕiodo de 10ms
    parameter HALF_PERIOD = 5;

    reg  clk;
    wire out;

    always #HALF_PERIOD clk = ~clk;

    Counter_1hz cnt(clk, out);

    initial begin
        clk = 1;
        $dumpfile("Counter_1hz.vcd");
        $dumpvars(0, Counter_1hz_tb);

        #2000;
        $finish();
    end

endmodule