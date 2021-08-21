module BCDCounter_mod10 (
  input  wire clrn, loadn, en, clk,
  input  wire [3:0] data,
  output reg  [3:0] out,
  output reg  tc, zero
);
  reg [3:0] curr_state, next_state;

  always @(posedge clk, negedge loadn, negedge clrn) begin
    if (~clrn)
      curr_state <= 4'd0;
    else if (~loadn)
      curr_state <= data;
    else if (en)
      curr_state <= next_state;
  end

  always @(curr_state) begin
    out = curr_state;
    tc = 1'b0;

    if (curr_state == 4'd0) begin
      next_state = 4'd9;
      zero = 1'b1;
      if (en)
        tc = 1'b1;
    end
    else begin
      next_state = curr_state - 4'd1;
      zero = 1'b0;
    end
  end

endmodule