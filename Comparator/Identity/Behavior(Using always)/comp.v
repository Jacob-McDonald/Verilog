module comparator2 (

input a
input b
output reg c
);

 always @ (a, b)
 
 if (a == b)
  c = 1'b1;
 else
  c = 1'b0;

endmodule 
