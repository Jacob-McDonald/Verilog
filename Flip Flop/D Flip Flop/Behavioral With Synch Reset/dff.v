module d_flipFlop(
  
  input d, 
  input g, 
  input reset,
  output reg q
);
 
  always @(posedge g, posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule