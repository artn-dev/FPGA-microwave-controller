`timescale 1ps/1ps
`include "decoder.v"
module decoder_tb();

    reg [3:0] sec_one_TB, sec_two_TB, min_TB;
    wire [6:0] sec_one_segs_TB, sec_two_segs_TB, min_segs_TB;

    decoder DUT(
        .sec_one(sec_one_TB), .sec_two(sec_two_TB), .min(min_TB),
        .sec_one_segs(sec_one_segs_TB), .sec_two_segs(sec_two_segs_TB), .min_segs(min_segs_TB)
        
              );

    initial 
        begin
        
        $dumpfile("decoder_tb.vcd");
        $dumpvars(0, decoder_tb);

            sec_one_TB = 4'b0000; sec_two_TB = 4'b0000; min_TB = 4'b0000;
        #10 sec_one_TB = 4'b0000; sec_two_TB = 4'b0001; min_TB = 4'b0010; // 012
        #10 sec_one_TB = 4'b0001; sec_two_TB = 4'b0010; min_TB = 4'b0011; // 123
        #10 sec_one_TB = 4'b1001; sec_two_TB = 4'b1001; min_TB = 4'b1001; // 999
        #10 sec_one_TB = 4'b0111; sec_two_TB = 4'b1000; min_TB = 4'b0010; // 782

        end

endmodule