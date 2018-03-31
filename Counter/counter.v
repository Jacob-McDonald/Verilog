module count8 (
input CLK
input clr // clear counter
input cntEn // enable count
output reg [7:0] Dout // counter value
);

always @(posedge CLK)
	if (clr) 
		Dout <= 0;
	else if (cntEn) 
		Dout <= Dout + 1;

endmodule