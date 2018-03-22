module carry_select_adder(S, C, A, B);
   output [7:0] S;   // The 8-bit sum.
   output 	C;   // The 1-bit carry.
   input [7:0] 	A;   // The 8-bit augend.
   input [7:0] 	B;   // The 8-bit addend.

   wire [3:0] 	S0;   // High nibble sum output with carry input 0.
   wire [3:0] 	S1;   // High nibble sum output with carry input 1.
   wire 	C0;   // High nibble carry output with carry input 0.
   wire 	C1;   // High nibble carry output with carry input 1.
   wire 	Clow; // Low nibble carry output used to select multiplexer output.
    
   ripple_carry_adder rc_low_nibble_0(S[3:0], Clow, A[3:0], B[3:0], 0);  // Calculate S low nibble.
   ripple_carry_adder rc_high_nibble_0(S0, C0, A[7:4], B[7:4], 0);       // Calcualte S high nibble with carry input 0.
   ripple_carry_adder rc_high_nibble_1(S1, C1, A[7:4], B[7:4], 1);       // Calcualte S high nibble with carry input 1.
   multiplexer_2_1 #(4) muxs(S[7:4], S0, S1, Clow);  // Clow selects the high nibble result for S.
   multiplexer_2_1 #(1) muxc(C, C0, C1, Clow);       // Clow selects the carry output.
endmodule // carry_select_adder