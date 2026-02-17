module DFF_tb();
  logic clk, rst, d;
  logic q, rst_sync_q, rst_async_q;
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
    // Stimulus
  initial begin
    reset = 1'b1;
    d_i = 1'b0;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    d_i = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    reset = 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
  end

  // Dump VCD
  initial begin
    $dumpfile("day2.vcd");
    $dumpvars(0, day2_tb);
  end
  

endmodule
