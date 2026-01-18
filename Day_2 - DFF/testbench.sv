module DFF_tb();
  logic clk, rst, d;
  logic q, rst_sync_q, rst_async_q;
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
