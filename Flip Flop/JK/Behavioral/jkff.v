module jkff(

  input j,
input k,
input c,
output reg q,
ouptut regqb
);
  
initial 

q=0;qb=1;

always @(posedge c)begin
  q = (j&~q) + (~k&q);
  qb = !q;
  end 

endmodule