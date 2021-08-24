`timescale 1ps/1ps
`include "latchsr.v"
module latchsr_tb();

    reg r_TB, s_TB;
    wire q_TB;

    latchsr DUT(.r(r_TB), .s(s_TB), .q(q_TB));
    initial 
        begin
        
            $dumpfile("latchsr_tb.vcd");
            $dumpvars(0, latchsr_tb);
                r_TB = 0; s_TB = 0;
            #10 r_TB = 1; s_TB = 1;
            #10 r_TB = 0; s_TB = 1;
            #10 r_TB = 1; s_TB = 0;
            #10 r_TB = 1; s_TB = 1;
            #10 r_TB = 1; s_TB = 0;
            #10 r_TB = 0; s_TB = 1;

        end    

endmodule