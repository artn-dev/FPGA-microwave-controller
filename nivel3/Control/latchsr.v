module latchsr(
    input wire r, s,
    output wire q, qn
);
    assign q  = r ~| qn;
    assign qn = s ~| q;

endmodule