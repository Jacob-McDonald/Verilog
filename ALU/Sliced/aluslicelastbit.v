module alu_slice2MSB(result,set,overflow,a,b,cin,op,binvert,less);
   input a, b, cin, binvert, less;
   output set, overflow;
   input [1:0] op;
   output      result;

   parameter   sop_and = 0;
   parameter   sop_or  = 1;
   parameter   sop_add = 2;
   parameter   sop_slt = 3;

   wire        b2 = binvert ? ~b : b;
   wire        sum;

   assign overflow =
          op != sop_add ? 1'b0 :
          a != b2       ? 1'b0 :
          a == sum      ? 1'b0 : 1'b1;

   assign set = a != b2 ? sum : a;

   bfa_implicit bfa(sum,cout,a,b2,cin);

   assign result =
          op == sop_and ? a & b :
          op == sop_or  ? a | b :
          op == sop_add ? sum :
          less; // else, op == sop_slt

endmodule