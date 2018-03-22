module jkff(

input j,
input k,
input c,
output reg q,
output reg qn
);
  
initial 

q=0; qb=1;

always @(posedge c)begin
  q = (j&~q) + (~k&q);
  qn = !q;
  end 

endmodule