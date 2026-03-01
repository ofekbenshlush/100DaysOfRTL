module DFF_tb();
  logic clk, rst, d;
  logic q, rst_sync_q, rst_async_q;

  DFF dut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .rst_sync_q(rst_sync_q),
    .rst_async_q(rst_async_q)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Use the correct signal names (rst, d) instead of reset/d_i
    rst = 1'b1;
    d = 1'b0;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    d = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    rst = 1'b1; 
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
  end

  // Dump VCD
  initial begin
    $dumpfile("day2.vcd");
    $dumpvars(0, DFF_tb); // Match the module name
  end
endmodule
