`include "Control/latchsr.v"
module control(
    input wire startn, stopn, clearn, door_closed, timer_done,
    output wire mag_on
);

    wire r2, s2;
    wire q2; 

    assign s2 = (!startn && door_closed) ? 1 : 0;
    assign r2 = (!stopn || !door_closed || !clearn || timer_done) ? 1 : 0;

    latchsr LSR_ON(.q(q2), .s(s2), .r(r2));

    assign mag_on = q2;

endmodule