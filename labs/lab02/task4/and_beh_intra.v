// and_beh_intra.v
// AND gate using behavioral modeling.
// Delay is applied as an intra-assignment delay.

module and_beh_intra (
  input  a,
  input  b,
  output reg y
);

  always @(*) begin
    y = #5 (a & b);
  end

endmodule