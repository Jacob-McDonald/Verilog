module parity_using_bitwise (
  
  input [7:0]data_in    , //  8 bit data in
  output parity_out   //  1 bit parity out
  
  );
       
  assign parity_out = ^data_in; 
  
  endmodule