`include "Timer.v"

module Timer_tb;
    parameter HALF_PERIOD = 0.5;

    reg  load, clr, clk, en;
    reg  [3:0] data;
    wire [3:0] sec_ones, sec_tens, mins;
    wire zero;

    always #HALF_PERIOD clk = ~clk;

    Timer timer(
        load, clr, clk, en, data,
        sec_ones, sec_tens, mins, zero
    );

    initial begin
        // setup
        clk = 0;
        $dumpfile("Timer.vcd");
        $dumpvars(0, Timer_tb);

        // reset
        clr=0; load=1; en=1;
        data = 4'd5;
        #3;
        
        // mudando tempo para 5:43
        clr=1; load=0; en=1;
        #2; // tempo = 0:05
        data = 4'd4;
        #2; // tempo = 0:54
        data = 4'd3;
        #2; // tempo = 5:43

        // contagem com transição de dezenas de segundos
        clr=1; load=1; en=0;
        #10;

        // pausa
        clr=1; load=1; en=1;
        #3;

        // reset
        clr=0; load=1; en=0;
        #2;

        // mudando tempo para 1:12
        clr=1; load=0; en=1;
        data = 4'd1;
        #2; // tempo = 0:11
        data = 4'd3;
        #2; // tempo = 1:13

        // contagem com transição de minutos
        clr=1; load=1; en=0;
        #30;

        $finish();
    end

endmodule