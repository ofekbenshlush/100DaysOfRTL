module DFF (
  input  logic d,
  input  logic clk,
  input  logic rst,
  output logic q,
  output logic rst_sync_q,
  output logic rst_async_q
);

  always_ff @(posedge clk)
    q <= d;
  always_ff @(posedge clk) begin
    if (rst)
      rst_sync_q <= 1'b0;
    else
      rst_sync_q <= d;
  end
  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      rst_async_q <= 1'b0;
    else
      rst_async_q <= d;
  end
endmodule
