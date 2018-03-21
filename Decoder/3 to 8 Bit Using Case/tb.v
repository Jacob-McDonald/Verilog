module decoder_3_8_testbench();
//inputs
 reg [2:0] test_I;
 //outputs
 wire [7:0] test_Y;
 
 decoder_3_8 uut(
 .I(test_I),
 .Y(test_Y)
 );

integer k;

initial
begin
    test_I = 0;
     
     for (k=0; k<8; k=k+1)
           #20 test_I = k;
         
           
      #20 $finish;
end
endmodule