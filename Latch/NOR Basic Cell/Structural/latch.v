module sr_latch (

input R, 
input S, 
output Q, 
output Qn
);

nor (Q, R, Qn);
nor (Qn, S, Q);

endmodule 