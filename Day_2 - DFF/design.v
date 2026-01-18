module DFF (
  input logic d,
  input logic clk,
  input logic rst,
  output logic q,
  output logic rst_sync_q,
  output logic rst_async_q
);
  //Reset is not active.
  always_ff @(posedge clk)
    q <= d;
  //Sync reset - in case reset is on, waiting to the next clock to reset.
  always_ff @(posedge clk) 
    if (rst)
      rst_sync_q <= 1'b0;
  	else
      rst_sync_q <= d;
  //Async reset - will active immediatly when a reset is on without waiting to the next clock.
  always_ff @(posedge clk or posedge rst)
    if (rst)
      rst_async_q <= 1'b0;
  	else 
      rst_async_q <= d;
endmodule 
