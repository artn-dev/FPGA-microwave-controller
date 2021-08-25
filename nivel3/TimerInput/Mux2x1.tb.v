`include "Mux2x1.v"

module Mux2x1_tb;
    reg  a, b, sel;
    wire out;

    Mux2x1 MUX(a, b, sel, out);

    initial begin
        $dumpfile("Mux2x1.vcd");
        $dumpvars(0, Mux2x1_tb);

        a=0; b=0; sel=0; #10;
        a=0; b=1; sel=0; #10;
        a=1; b=1; sel=0; #10;
        a=1; b=0; sel=0; #10;
        a=1; b=0; sel=1; #10;
        a=1; b=1; sel=1; #10;
        a=0; b=1; sel=1; #10;
        a=0; b=0; sel=1; #10;
    end
endmodule