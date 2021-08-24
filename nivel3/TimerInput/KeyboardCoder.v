module KeyboardCoder(
    input  wire [9:0] keyboard,
    input  wire enn,
    output reg  [3:0] data,
    output reg  valid_input
);
    always @(enn, keyboard) begin
        if (~enn) begin
            if (keyboard[9])
                data = 9;
            else if (keyboard[8])
                data = 8;
            else if (keyboard[7])
                data = 7;
            else if (keyboard[6])
                data = 6;
            else if (keyboard[5])
                data = 5;
            else if (keyboard[4])
                data = 4;
            else if (keyboard[3])
                data = 3;
            else if (keyboard[2])
                data = 2;
            else if (keyboard[1])
                data = 1;
            else
                data = 0;

            valid_input = (keyboard != 0);
        end
        else begin
            data = 0;
            valid_input = 0;
        end
    end

endmodule