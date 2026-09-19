// tb.v

module tb;

  reg [1:0] t_sel;
  wire [7:0] t_dout;

  // Instantiate LUT directly
  lut UUT (
    .sel(t_sel),
    .dout(t_dout)
  );

  // Waveform dump configuration

  string vcd_file;

  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, UUT);
    end
  end

  initial begin
    // Apply all possible select values

    t_sel = 2'b00;
    #5;

    t_sel = 2'b01;
    #5;

    t_sel = 2'b10;
    #5;

    t_sel = 2'b11;
    #5;

    $finish;
  end

  initial
    $monitor($time, " sel=%b | dout=%b", t_sel, t_dout);

endmodule