module alu_slice2MSB(
   input a, 
   input b, 
   input cin, 
   input binvert, 
   input less;
   output set, 
   output overflow;
   input [1:0] op;
   output      result;
);
   
   parameter   andop = 0;
   parameter   orop  = 1;
   parameter   addop = 2;
   parameter   sltop = 3;

   wire        b2 = binvert ? ~b : b;
   wire        sum;

   
   assign overflow =
          op != sop_add ? 1'b0 :
          a != b2       ? 1'b0 :
          a == sum      ? 1'b0 : 1'b1;

   assign set = a != b2 ? sum : a;

   full_adder fa1(sum,cout,a,b2,cin);

   
   always @ (op)
   case(op)
      andop :  ; 
      orop : ; 
      addop :
      sltop :    
   default :; 
 endcase
   
   assign result =
          op == sop_and ? a & b :
          op == sop_or  ? a | b :
          op == sop_add ? sum :
          less; // else, op == sop_slt

endmodule
