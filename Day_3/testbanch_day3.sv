`timescale 1ns/1ps
module edge_detector_tb();
  logic clk;
  logic reset;
  logic d_i;
  logic rising_edge_o;
  logic falling_edge_o;
  
  edge_detector dut(
    .clk(clk),
    .reset(reset),
    .d_i(d_i),
    .rising_edge_o(rising_edge_o),
    .falling_edge_o(falling_edge_o)
  );
  always #5 clk =~clk;
    initial begin
      clk = 0;
      reset = 1'b1;
      d_i = 1'b0;
      #20 reset = 1'b0;
      #10 d_i = 1'b1;
      #20 d_i = 1'b0;
      #15 d_i = 1'b1;
      #5  d_i = 1'b0; 
      #30;
      $display("Simulation complete.");
      $finish;
    end

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, edge_detector_tb);
    end

 endmodule
