module comparator2 (

input a
input b
output c
reg c
);

always @ (a or b)
 if (a == b)
 	c = 1'b1;
 else
 	c = 1'b0;

endmodule 