module shift_register(
  input logic clock,
  input logic reset,
  input logic x_i,
  output logic[3:0] sr_o
);
  always_ff@(posedge clock or posedge reset) begin
    if(reset)
      sr_o <= 4'b0000;
  	else
      sr_o <= {x_i, sr_o[3:1]};
    end
endmodule
