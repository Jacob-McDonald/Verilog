module JKFlipflop(
	input J,
	input K,
	input clk,
	input reset,
	output q
);
	
	wire w;
	
	assign w = (J&~q)|(~K&q);
	
	d_flip_flop dff(w,clk,reset,q);

endmodule