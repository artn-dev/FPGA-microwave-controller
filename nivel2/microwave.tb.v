`include "microwave.v"
`timescale 1ms/1ns

module microwave_tb;
    reg  [9:0] kbd;
    reg  clk, start, stop, clear, door_closed;
    wire [6:0] sec_ones_seg, sec_tens_seg, min_segs;
    wire mag_on;

    always #5 clk = ~clk;

    microwave mw(
        .kbd(kbd), .clk(clk), .startn(start), .stopn(stop), .clearn(clear), .door_closed(door_closed),
        .sec_ones_seg(sec_ones_seg), .sec_tens_seg(sec_tens_seg), .min_segs(min_segs),
        .mag_on(mag_on)
    );

    initial begin
        clk = 0;
        $dumpfile("microwave.vcd");
        $dumpvars(0, microwave_tb);

        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000;

        // reset
        start=1; stop=1; clear=0; door_closed=1; kbd=10'b0000000000; #1000;

        // tempo = 0:12
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000010; #1000;  // pressionar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000;  // soltar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000100; #1000;  // pressionar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000;  // soltar 2
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000;  // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #14000; // soltar start

        // repouso
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000;

        // tempo = 0:35
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000001000; #1000; // pressionar 3
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar 3
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000100000; #1000; // pressionar 5
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar 5
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #5000; // soltar start

        // stop
        start=1; stop=0; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // pressionar stop

        // clear
        start=1; stop=1; clear=0; door_closed=1; kbd=10'b0000000000; #1000; // pressionar stop

        // tempo = 1:29
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000010; #1000; // pressionar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000100; #1000; // pressionar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b1000000000; #1000; // pressionar 9
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar 9
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #3000; // soltar start

        // abrir porta
        start=1; stop=1; clear=1; door_closed=0; kbd=10'b0000000000; #1000;

        $finish();
    end
endmodule