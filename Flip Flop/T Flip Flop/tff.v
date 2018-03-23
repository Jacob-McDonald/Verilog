module tff(

input t,
input clk,
input rst,
output reg q,
output reg qn
);

always@ (posedge clk,posedge rst) begin

if (!rst) 
	q <= 1'b0
else begin
	if(t)
		q <= ~q;
end

end

endmodule
