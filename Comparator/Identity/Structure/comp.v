module id_comparator(
   output E;
   input [1:0] A;
   input [1:0] B;
   wire e0;
   wirene1;
   );
   
   xnor(e1, A[1], B[1]);
   xnor(e0, A[0], B[0]);
   and(E, e1, e0);
   
endmodule
