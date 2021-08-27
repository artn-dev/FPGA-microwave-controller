`timescale 1ps/1ps
`include "control.v"

module control_tb();

    reg startn_TB, stopn_TB, clearn_TB, door_closed_TB, timer_done_TB;
    wire mag_on_TB;

    control DUT(.startn(startn_TB), .stopn(stopn_TB), .clearn(clearn_TB),
    .door_closed(door_closed_TB), .timer_done(timer_done_TB), .mag_on(mag_on_TB)
    );

    initial 
        begin
            
            $dumpfile("control_tb.vcd");
            $dumpvars(0, control_tb);

                startn_TB = 0; stopn_TB = 0; clearn_TB = 0; timer_done_TB = 0; door_closed_TB = 0; // r2 = 1 -> q2 = 0
            #10 startn_TB = 0; stopn_TB = 1; clearn_TB = 1; timer_done_TB = 0; door_closed_TB = 1; // s2 = 1 -> q2 = 1
            #10 startn_TB = 1; stopn_TB = 0; clearn_TB = 0; timer_done_TB = 0; door_closed_TB = 1; // r2 = 1 -> q2 = 0
            #10 startn_TB = 1; stopn_TB = 1; clearn_TB = 1; timer_done_TB = 1; door_closed_TB = 1; // r2 = 1 -> q2 = 0
            #10 startn_TB = 1; stopn_TB = 1; clearn_TB = 1; timer_done_TB = 0; door_closed_TB = 1; // r2 = 0 s2 = 0


        end
endmodule