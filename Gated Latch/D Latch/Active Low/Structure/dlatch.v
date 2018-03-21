module d_latch(
   output q,
   output qn;
   input  d;
   input  g;
);
  
   not (dn,d);
   and(D1, G, D);
   and(Dn1, G, Dn);   
   nand (s, d, g), g2 (r, dn, g);
   nand (q, s, qn);
   nand (qn, r, q);

endmodule