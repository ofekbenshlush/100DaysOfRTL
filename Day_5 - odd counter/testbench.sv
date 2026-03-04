module odd_counter_tb ();
  logic clock;
  logic reset;
  logic [7:0] counter_out;
  
  odd_counter dut (.*);
  always begin
    clock = 1'b0;
    #5;
    clock = 1'b1;
    #5;
  end 
  initial begin
    reset <= 1'b1;
    #20;
    reset <= 1'b0;
    $monitor("Time: %0t | Reset: %b | Counter: %d", $time, reset, counter_out);
    #200;
    $finish();
  end
    initial begin
    $dumpfile("day5.vcd");
    $dumpvars(0, odd_counter_tb);
  end
  
endmodule
