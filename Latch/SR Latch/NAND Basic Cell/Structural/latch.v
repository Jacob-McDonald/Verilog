module sr_latch (

input R, 
input S, 
output Q, 
output Qn
);

nand (Q, S, Qn);
nand (Qn, R, Q);

endmodule