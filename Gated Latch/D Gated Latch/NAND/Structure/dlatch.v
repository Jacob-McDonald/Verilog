module d_latch(
   output q,
   output qn;
   input  d;
   input  g;
);
  
   not (dn,d);
   nand (s, d, g), g2 (r, dn, g);
   nand (q, s, qn);
   nand (qn, r, q);

endmodule