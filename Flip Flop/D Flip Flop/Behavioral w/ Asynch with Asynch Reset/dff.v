module D_flipFlop(
    
  input d, 
  input g, 
  input rst,
  output reg q
);
    
  always @(posedge g, posedge rst)
    if (rst) 
        q <= 1'b0;
    else
        q <= d;
    
endmodule