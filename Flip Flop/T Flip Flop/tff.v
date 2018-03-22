module tff(t,clk,rst, q,qb
input t,clk,rst
output reg q,qb
);



always@(posedge clk,posedge rst) begin
	if (!rst) 
		q <= 1'b0

	else begin
		if(t)
			q <= ~q;
	end


end

endmodule