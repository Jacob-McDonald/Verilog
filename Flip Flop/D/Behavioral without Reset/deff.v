module d_flipFlop (

  input d, 
  input g,
  output reg q
);

always @ (posedge g)
  if(g)
    q <= d;
  else
    q <= 0;


endmodule 