`include "BCDCounter_mod6.v"

module BCDCounter_mod6_tb;
    parameter HALF_PERIOD = 0.5;

    reg  clk, clr, load, en;
    reg  [3:0] data;
    wire [3:0] out;
    wire tc, zero;

    initial begin
        clk = 0;
    end
    always #HALF_PERIOD clk = ~clk;

    BCDCounter_mod6 ct_1(
        .clrn(clr), .loadn(load), .en(en), .clk(clk),
        .data(data), .out(out), .tc(tc), .zero(zero)
    );

    initial begin
        $dumpfile("BCDCounter_mod6.vcd");
        $dumpvars(0, BCDCounter_mod6_tb);

    end

    initial begin
        // reset
        clr = 0; en = 0; load = 1;
        data = 4'd0;
        #15;

        // muda valor para 4
        clr = 1; en = 0; load = 0;
        data = 4'd4;
        #10;

        // contar até 2
        clr = 1; en = 1; load = 1;
        #20;

        // pausa
        clr = 1; en = 0; load = 1;
        #10;

        // reset
        clr = 0; en = 0; load = 1;
        #10;

        // muda valor para 5
        clr = 1; en = 0; load = 0;
        data = 4'd5;
        #10;

        // contagem
        clr = 1; en = 1; load = 1;
        #50;

        // muda valor para 0
        clr = 1; en = 0; load = 0;
        data = 4'd0;
        #10;

        // contagem
        clr = 1; en = 1; load = 1;
        #10;

        $finish();
    end

endmodule