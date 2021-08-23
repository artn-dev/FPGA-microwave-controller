module decoder(
    input wire [3:0] sec_one, 
    input wire [3:0]sec_two, 
    input wire [3:0]min,
    output wire [6:0] sec_one_segs, 
    output wire [6:0] sec_two_segs, 
    output wire [6:0] min_segs
);

    assign sec_one_segs = (sec_one == 4'b0000)? 7'b1111110:
                          (sec_one == 4'b0001)? 7'b0110000:
                          (sec_one == 4'b0010)? 7'b1101101:
                          (sec_one == 4'b0011)? 7'b1111001:
                          (sec_one == 4'b0100)? 7'b0110011:
                          (sec_one == 4'b0101)? 7'b1011011:
                          (sec_one == 4'b0110)? 7'b1011111:
                          (sec_one == 4'b0111)? 7'b1110000:
                          (sec_one == 4'b1000)? 7'b1111111:
                          (sec_one == 4'b1001)? 7'b1110011:
                          8'bXXXX_XXXX;

    assign sec_two_segs = (sec_two == 4'b0000)? 7'b1111110:
                          (sec_two == 4'b0001)? 7'b0110000:
                          (sec_two == 4'b0010)? 7'b1101101:
                          (sec_two == 4'b0011)? 7'b1111001:
                          (sec_two == 4'b0100)? 7'b0110011:
                          (sec_two == 4'b0101)? 7'b1011011:
                          (sec_two == 4'b0110)? 7'b1011111:
                          (sec_two == 4'b0111)? 7'b1110000:
                          (sec_two == 4'b1000)? 7'b1111111:
                          (sec_two == 4'b1001)? 7'b1110011:
                          8'bXXXX_XXXX;

    assign min_segs =     (min == 4'b0000)? 7'b1111110:
                          (min == 4'b0001)? 7'b0110000:
                          (min == 4'b0010)? 7'b1101101:
                          (min == 4'b0011)? 7'b1111001:
                          (min == 4'b0100)? 7'b0110011:
                          (min == 4'b0101)? 7'b1011011:
                          (min == 4'b0110)? 7'b1011111:
                          (min == 4'b0111)? 7'b1110000:
                          (min == 4'b1000)? 7'b1111111:
                          (min == 4'b1001)? 7'b1110011:
                          8'bXXXX_XXXX;

endmodule
