`include "Counter0_7.v"

module Counter0_7_tb;
    parameter HALF_PERIOD = 0.5;

    reg  clk, clr;
    wire value;

    Counter0_7 cnt(clk, clr, value);

    always #HALF_PERIOD clk = ~clk;

    initial begin
        // setup
        clk = 0;
        $dumpfile("Counter0_7.vcd");
        $dumpvars(0, Counter0_7_tb);

        // reset
        clr = 0;
        #2;

        // contagem
        clr = 1;
        #20;

        // reset
        clr = 0;
        #3;

        $finish();
    end
    
endmodule