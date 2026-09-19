// and_beh_before.v
// AND gate using behavioral modeling.
// Delay is applied to the assignment inside the procedural block.

module and_beh_before (
  input  a,
  input  b,
  output reg y
);

  always @(*) begin
    #5 y = a & b;
  end

endmodule