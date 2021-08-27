`include "Decoder/decoder.v"
`include "Timer/Timer.v"
`include "TimerInput/TimerInput.v"
`include "Control/control.v"

module microwave (
    input  wire [9:0] kbd,
    input  wire clk, startn, stopn, clearn, door_closed,
    output wire [6:0] sec_ones_seg, sec_tens_seg, min_segs,
    output wire mag_on
);

    wire Tloadn, Tclock;
    wire [3:0] Tdata;
    wire [3:0] isec_ones, isec_tens, imins;

    control ctrl(
        .startn(startn), .stopn(stopn), .clearn(clearn),
        .door_closed(door_closed), .timer_done(timer_done),
        .mag_on(mag_on)
    );

    TimerInput Tinput(
        .kbd(kbd), .enn(mag_on), .clk(clk),
        .D(Tdata), .loadn(Tloadn), .pgt_1Hz(Tclk)
    );

    Timer T(
        .loadn(~Tloadn), .clrn(clearn), .clk(Tclk), .en(mag_on),
        .data(Tdata),
        .sec_ones(isec_ones), .sec_tens(isec_tens), .mins(imins),
        .zero(timer_done)
    );

    decoder dcd(
        .sec_one(isec_ones), .sec_two(isec_tens), .min(imins),
        .sec_one_segs(sec_ones_seg), .sec_two_segs(sec_tens_seg), .min_segs(min_segs)
    );

endmodule