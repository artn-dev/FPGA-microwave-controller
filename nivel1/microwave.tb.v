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

        // reset
        start=1; stop=1; clear=0; door_closed=1; kbd=10'b0000000000; #500;

        // tempo = 0:12
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000010; #500;  // pressionar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500;  // soltar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000100; #500;  // pressionar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500;  // soltar 2
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500;  // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #14000; // soltar start

        // repouso
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000;

        // tempo = 0:35
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000001000; #500; // pressionar 3
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 3
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000100000; #500; // pressionar 5
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 5
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #5000; // soltar start

        // stop
        start=1; stop=0; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // pressionar stop
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #4000; // soltar stop

        // clear
        start=1; stop=1; clear=0; door_closed=1; kbd=10'b0000000000; #1000; // pressionar clear
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #4000; // soltar clear

        // tempo = 1:29
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000010; #500; // pressionar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 1
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000100; #500; // pressionar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b1000000000; #500; // pressionar 9
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 9
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #3000; // soltar start

        // abrir porta
        start=1; stop=1; clear=1; door_closed=0; kbd=10'b0000000000; #1000;
        // fechar porta
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500;
        // start
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #3000; // soltar start

        // stop
        start=1; stop=0; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar stop
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar stop
        // clear
        start=1; stop=1; clear=0; door_closed=1; kbd=10'b0000000000; #500; // pressionar clear
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #1000; // soltar clear

        // tempo = 0:72
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0010000000; #500; // pressionar 7
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 7
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000100; #500; // pressionar 2
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 2
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #3000; // soltar start

        // stop
        start=1; stop=0; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar stop
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar stop
        // clear
        start=1; stop=1; clear=0; door_closed=1; kbd=10'b0000000000; #500; // pressionar clear
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar clear

        // tempo = 0:80
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0100000000; #500; // pressionar 8
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 8
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000001; #500; // pressionar 0
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // soltar 0
        start=0; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #500; // pressionar start
        start=1; stop=1; clear=1; door_closed=1; kbd=10'b0000000000; #3000; // soltar start

        $finish();
    end
endmodule