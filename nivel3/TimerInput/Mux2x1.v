module Mux2x1(
    input  wire a, b, sel,
    output wire out
);
    assign out = sel ? b : a;
endmodule