module KeyboardCoder(
    input  wire [9:0] keyboard,
    input  wire enn,
    output reg  [3:0] data,
    output reg  valid_input
);
    always @(enn, keyboard) begin
        if (~enn) begin
            case (keyboard)
                10'b0000000001: data = 0;
                10'b0000000010: data = 1;
                10'b0000000100: data = 2;
                10'b0000001000: data = 3;
                10'b0000010000: data = 4;
                10'b0000100000: data = 5;
                10'b0001000000: data = 6;
                10'b0010000000: data = 7;
                10'b0100000000: data = 8;
                10'b1000000000: data = 9;
            endcase

            valid_input = (keyboard != 0);
        end
        else begin
            data = 0;
            valid_input = 0;
        end
    end

endmodule