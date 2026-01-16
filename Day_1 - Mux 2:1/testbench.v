module test();
  reg ta, tb, tsel;
  wire ty;

  mux2to1 dut (ta, tb, tsel, ty);

  initial begin
    $dumpfile("dump.vcd"); $dumpvars(1);
    
    // Case 1: sel is 0, output should follow 'a'
    ta = 1; tb = 0; tsel = 0; #10;
    
    // Case 2: sel is 1, output should follow 'b'
    ta = 1; tb = 0; tsel = 1; #10;
    
    $finish;
  end
endmodule
