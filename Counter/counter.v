module counter (
input clk
input rst // clear counter
input Cen // enable count
output reg [7:0] Dout // counter value
);

always @ (posedge clk) begin
	if (rst) 
		Dout <= 8'b0;
	else if (Cen)
		Dout <= Dout + 1'b1;

end


endmodule