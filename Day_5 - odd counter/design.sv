module odd_counter(
  input logic clock,
  input logic reset,
  output logic [7:0] counter_out
);
  always_ff@(posedge clock or posedge reset) begin
   	if(reset)
      counter_out <= 8'h1;
    else
      counter_out <= counter_out + 8'h2;
  end
endmodule
  
