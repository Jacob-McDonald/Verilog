module displaydriver (
  input clk,
  input reset,
  input [6:0] digit_0,
  input [6:0] digit_1,
  input [6:0] digit_2,
  input [6:0] digit_3,
  output [6:0] segment,
  output [3:0] digit_enable;
 ); 
 
  reg [7:0] refresh_ctr;
  reg [1:0] digit;

  assign segment =
          (digit == 2'd0) ? ~digit_3 :
          (digit == 2'd1) ? ~digit_2 :
          (digit == 2'd2) ? ~digit_1 :
          ~digit_0;

  assign enable = !(refresh_ctr > 8'd64 && refresh_ctr < 8'd192);

  assign digit_enable = enable_ ? 4'b1111 :
          (digit == 2'd0) ? 4'b1110 :
          (digit == 2'd1) ? 4'b1101 :
          (digit == 2'd2) ? 4'b1011 :
          4'b0111;

  always@ (posedge clk, negedge reset)
    if (!reset_)
      refresh_ctr <= 8'h00;
    else
      refresh_ctr <= refresh_ctr + 8'h01;

 
  always@ (posedge clk,negedge reset)
    if (!reset)
      digit <= 2'd0;
    else if (refresh_ctr == 8'hff)
      digit <= digit + 2'd1;

endmodule
