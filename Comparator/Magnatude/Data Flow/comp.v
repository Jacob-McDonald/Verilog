module Compare1 (A, B, Equal, Alarger, Blarger);
input A, B;
output Equal, Alarger, Blarger;
 assign Equal = (A & B) | (~A & ~B);
 assign Alarger = (A & ~B);
 assign Blarger = (~A & B);
endmodule