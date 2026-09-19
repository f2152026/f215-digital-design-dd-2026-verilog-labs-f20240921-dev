// tb.v
// Self-checking testbench for the 4-bit ALU.
//
// op = 0 -> addition
// op = 1 -> subtraction

module tb;

  reg  [3:0] t_a;
  reg  [3:0] t_b;
  reg        t_op;
  wire [3:0] t_result;

  integer errors;
  integer i;
  integer j;

  alu UUT (
    .a      (t_a),
    .b      (t_b),
    .op     (t_op),
    .result (t_result)
  );

  // Waveform dump configuration

  string vcd_file;

  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, UUT);
    end
  end

  // Test all input combinations
  initial begin
    errors = 0;

    // Test addition
    t_op = 1'b0;

    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        t_a = i;
        t_b = j;

        #1;

        if (t_result !== ((i + j) & 4'hF)) begin
          $display("FAIL ADD: a=%d b=%d | expected=%h got=%h",
                   i, j, ((i + j) & 4'hF), t_result);
          errors = errors + 1;
        end
      end
    end

    // Test subtraction
    t_op = 1'b1;

    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        t_a = i;
        t_b = j;

        #1;

        if (t_result !== ((i - j) & 4'hF)) begin
          $display("FAIL SUB: a=%d b=%d | expected=%h got=%h",
                   i, j, ((i - j) & 4'hF), t_result);
          errors = errors + 1;
        end
      end
    end

    if (errors == 0)
      $display("ALL TESTS PASSED");
    else
      $display("TESTS FAILED: %0d error(s)", errors);

    $finish;
  end

  initial
    $monitor($time, " a=%b b=%b op=%b | result=%b",
             t_a, t_b, t_op, t_result);

endmodule