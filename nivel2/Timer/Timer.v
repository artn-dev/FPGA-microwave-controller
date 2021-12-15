`include "Timer/BCDCounter_mod6.v"
`include "Timer/BCDCounter_mod10.v"

module Timer(
    input  wire loadn, clrn, clk, en,
    input  wire [3:0] data,
    output wire  [3:0] sec_ones, sec_tens, mins,
    output wire  zero
);
    wire [3:0] isec_ones, isec_tens, imins;
    wire tc0, tc1, tc2;
    wire zero0, zero1, zero2;

    BCDCounter_mod10 ones_cnt(
        clrn, loadn, en, clk, data,
        isec_ones, tc0, zero0
    );

    BCDCounter_mod6 tens_cnt(
        clrn, loadn, tc0, clk, isec_ones,
        isec_tens, tc1, zero1
    );

    BCDCounter_mod10 mins_cnt(
        clrn, loadn, (tc0 & tc1), clk, isec_tens,
        imins, tc2, zero2
    );

    assign sec_ones = isec_ones;
    assign sec_tens = isec_tens;
    assign mins = imins;
    assign zero = zero0 & zero1 & zero2;

endmodule