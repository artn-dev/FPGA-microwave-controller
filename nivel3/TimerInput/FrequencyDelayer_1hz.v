module FrequencyDelayer_1hz(
    input  wire clk,
    output reg out
);
    reg [6:0] state = 0;

    always @(posedge clk) begin
        out = (state < 50);
        state = state + 1;
        if (state >= 100)
            state = 0;
    end

endmodule