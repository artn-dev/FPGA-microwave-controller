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
        clr = 0; en = 1; load = 1;
        data = 4'd5;
        #3;
        
        clr = 1; en = 1; load = 0; // tempo = 0:05
        #2;
        data = 4'd4; // tempo = 0:54
        #2;
        data = 4'd3; // tempo = 5:43
        #2;

        // contagem
        clr = 1; en = 0; load = 1;
        #10;

        $finish();
    end

endmodule