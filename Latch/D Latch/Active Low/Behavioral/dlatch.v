module d_latch (  

  input d,
  input g,
  output reg q
  output reg qn
);
 
   always @ (g, d) begin
      
      if (~en)
        q <= d;
      else
        q <=0
        
    qn = ~q
  
  end

endmodule