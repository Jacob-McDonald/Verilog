module jkff(

input j,
input k,
input clk,
output reg q,
output reg qn
);
  
initial 

q=0; qb=1;

always @(posedge clk) begin
  q = (j&~q) + (~k&q);
  qn = !q;
  end 

endmodule