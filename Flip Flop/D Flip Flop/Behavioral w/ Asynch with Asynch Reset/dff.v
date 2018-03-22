module D_flipFlop(
    
  input d, 
  input g, 
  input reset,
  output reg q
);
    
  always @(posedge g, posedge reset)
    if (reset) 
        q <= 0;
    else
        q <= d;
    
endmodule