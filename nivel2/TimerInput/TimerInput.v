`include "TimerInput/Counter0_7.v"
`include "TimerInput/FrequencyDelayer_1hz.v"
`include "TimerInput/KeyboardCoder.v"
`include "TimerInput/Mux2x1.v"

module TimerInput (
    input  wire [9:0] kbd,
    input  wire enn, clk,
    output wire [3:0] D,
    output wire loadn, pgt_1Hz
);
    wire clk1hz, delcount;

    KeyboardCoder coder(kbd, enn, D, loadn);
    FrequencyDelayer_1hz freqdel(clk, clk1hz);
    Counter0_7 counter(clk, loadn, delcount);
    Mux2x1 MUX(delcount, clk1hz, enn, pgt_1Hz);

endmodule