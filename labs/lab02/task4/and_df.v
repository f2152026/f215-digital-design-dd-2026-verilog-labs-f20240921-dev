// and_df.v
// AND gate using dataflow modeling.
// 5-unit propagation delay.

module and_df (
  input  a,
  input  b,
  output wire y
);

  assign #5 y = a & b;

endmodule