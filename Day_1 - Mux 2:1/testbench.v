module test();
  reg ta, tb, tsel;
  wire ty;

  mux2to1 dut (ta, tb, tsel, ty);

  initial begin
    $dumpfile("dump.vcd"); $dumpvars(1);
    ta = 0; tb = 0; tsel = 0; #10; //output should be like 'a'
    ta = 0; tb = 1; tsel = 1; #10; //output should be like 'b'
    ta = 1; tb = 0; tsel = 1; #10; //output should be like 'b'
    ta = 1; tb = 1; tsel = 0; #10; //output should be like 'a'    
    $finish;
  end
endmodule
