module alu(Y, C, V, N, Z, A, B, Op);
   output [15:0] Y;  // Result.
   output 	 C;  // Carry.
   output 	 N;  // Negative.
   output 	 V;  // Overflow.
   output 	 Z;  // Zero.
   input [15:0]  A;  // Operand.
   input [15:0]  B;  // Operand.
   input [2:0] 	 Op; // Operation.

   wire [15:0] 	 AS, And, Or, Xor, Not;
   wire 	 s; 
   wire 	 Vas;
   wire 	 Cas;
   
   // The operations
   carry_select_adder_subtractor addsub(AS, Cas, Vas, A, B, Op[0]);      // Op == 3'b000, 3'b001
   
   And =  A & B;                                              // Op == 3'b010
   Or = A | B;                                                 // Op == 3'b011
   Xor = A ^ B                                              // Op == 3'b100
   Not  =  ~A                                                 // Op == 3'b101
   
   multiplexer_8_1 muxy(Y, AS, AS, And, Or, Xor, Not, 16'b0, 16'b0, Op); // Select the result.

   nor(s, Op[1], Op[2]);   // s == 0 => a logical operation, otherwise and arithmetic operation.
   and(C, Cas, s);
   and(V, Vas, s);
   and(N, Y[15], s);       // Most significant bit is the sign bit in 2's complement.   
   zero z(Z, Y);           // All operations can set the Zero status bit.
   endmodule