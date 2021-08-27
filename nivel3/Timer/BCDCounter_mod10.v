module BCDCounter_mod10 (
  input  wire clrn, loadn, en, clk,
  input  wire [3:0] data,
  output reg  [3:0] out,
  output reg  tc, zero
);
  reg [3:0] curr_state;

  always @(posedge clk, negedge loadn, negedge clrn) begin
    if (~clrn) begin
      curr_state <= 0;
    end
    else if (~loadn) begin
      curr_state <= data;
    end
    else if (en) begin
      curr_state <= (curr_state == 0) ? 9 : curr_state - 1;
    end

    zero = (curr_state == 0) ? 1 : 0;
    out = curr_state;
  end

  always @(posedge clk, posedge en) begin
    tc = (en && curr_state == 0);
  end


endmodule