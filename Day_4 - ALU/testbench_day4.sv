module ALU_tb();
  logic [7:0] a_i;
  logic [7:0] b_i;
  logic [2:0] op_i;
  logic [7:0] alu_o;
  
  ALU dut(
    .a_i(a_i),
    .b_i(b_i),
    .op_i(op_i),
    .alu_o(alu_o)
  );
  
