module Counter0_7(
    input  wire clk, clr,
    output reg  out
);
    reg [2:0] state;

    always @(posedge clk, posedge clr) begin
        if (clr)
            state = 3'd0;
        else if (state < 3'd7)
            state = state + 3'd1;
    end

    always @(state) begin
        out = state >= 3'd4;
    end

endmodule