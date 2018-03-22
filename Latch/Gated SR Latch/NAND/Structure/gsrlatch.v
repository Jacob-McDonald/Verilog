module sr_latch_gated(
   
   output Q,
   output Qn,
   input  G,  
   input  S,
   input  R
);
 
   wire   S1;
   wire   R1;
   
   or(S1, G, S);
   or(R1, G, R);   
   nand(Qn, R1, Q);
   nand(Q, S1, Qn);
 
endmodule