module d_flipFlop(
  
  input d, 
  input g, 
  input rst,
  output reg q,
  output reg qn
);
 
 assign qn = ~q;
 
  always @(posedge g, posedge rst) begin
    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end

  

endmodule