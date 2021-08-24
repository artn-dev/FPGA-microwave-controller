module latchsr(
    input wire r, s,
    output wire q
);

    reg q2 = 0;
    assign q = q2;
    
    always @(r, s) begin
        
        if(r == 0 & s == 0)
        begin
            q2 = q2;
        end
        
        else if(r == 1 & s == 0)
        begin
            q2 = 0;
        end
        
        else if(r == 0 & s == 1)
        begin
            q2 = 1;
        
        end
    end
endmodule




