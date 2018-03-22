module flopJK (q,j,k,c, r);
 input j,k,clk, rst;
 output q;
 reg q;

 always @(posedge clk, negedge rst)
 begin
  if (r != 1) 
     q <= 1'b0;
  
  else
    case ({j,k})
     {1'b0,1'b0}: q <= q; 
     {1'b0,1'b1}: q <= 1'b0; 
     {1'b1, 1'b0}: q <= 1'b1; 
     {1'b1, 1'b1}: q <= ~q; 
    endcase
 end
endmodule