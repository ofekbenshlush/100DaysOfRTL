// Code your design here
module edge_detector(
  input logic clk,
  input logic reset,
  input logic d_i,
  output logic rising_edge_o,
  output logic falling_edge_o
);
  logic d_ff;
  always_ff @(posedge clk or posedge reset)
    if(reset)
      d_ff <= 1'b0;
    else
      d_ff <= d_i;
  assign rising_edge_o = ~d_ff & d_i;
  assign falling_edge_o = d_ff & ~d_i;

endmodule
