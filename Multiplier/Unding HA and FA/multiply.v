module multiplier(a,b, p);

input [2:0] a,b;
output [5:0] p;wire [7:0]u;

wire [1:0]su;wire [8:0]i;and (p[0],a[0],b[0]);

and (u[0],a[1],b[0]);and (u[1],a[2],b[0]);
and (u[2],a[0],b[1]);and (u[3],a[1],b[1]);
and (u[4],a[2],b[1]);and (u[5],a[0],b[2]);
and (u[6],a[1],b[2]);and (u[7],a[2],b[2]);
hadd h1(.l(u[0]),.m(u[2]),.sum(p[1]),.cry(i[0]));
hadd h2(.l(i[0]),.m(u[1]),.sum(su[0]),.cry(i[1]));
hadd h3(.l(u[3]),.m(u[5]),.sum(su[1]),.cry(i[2]));
 
hadd h4(.l(su[0]),.m(su[1]),.sum(p[2]),.cry(i[4]));
hadd h5(.l(i[1]),.m(i[2]),.sum(i[5]),.cry(i[6]));
or (i[7],i[5],i[4]);fadd f3(.d(i[7]),.e(u[4]),.cin(u[6]),.s(p[3]),.cout(i[8]));

fadd f4(.d(i[8]),.e(i[6]),.cin(u[7]),.s(p[4]),.cout(p[5]));

endmodule