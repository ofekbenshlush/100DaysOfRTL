`timescale 1ns/1ps

module shift_register_tb();
  logic clock;
  logic reset;
  logic x_i;
  logic[3:0] sr_o;
  
  shift_register dut(.*);
  
  always #5 clock = ~clock;
  initial begin
    clock = 0;
    reset <= 1'b1;
    #15;
    reset <= 1'b0;
    //I will shift the next sequence: 1, 0, 1, 1
    @(posedge clock);
    #1 x_i <= 1;
    @(posedge clock);
    #1 x_i <= 0;
    @(posedge clock);
    #1 x_i <= 1;
    @(posedge clock);
    #1 x_i <= 1;
    #20;
    $finish;
  end
  
  initial begin
    $dumpfile("shift_regester.vcd");
    $dumpvars(0,shift_register_tb);
  end
endmodule
