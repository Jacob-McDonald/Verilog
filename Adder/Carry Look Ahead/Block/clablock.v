module cla_4_block(sum,gout,pout,a,b,cin);
   input [3:0]  a, b;
   input        cin;
   output [3:0] sum;
   output       gout, pout;

   wire [3:0]   carry, p, g;

   assign carry[0] = cin;

   assign carry[1] = cin  & p[0]
                   | g[0];

   assign carry[2] = cin  & p[0] & p[1]
                   | g[0] & p[1]
                   | g[1];

   assign carry[3] = cin  & p[0] & p[1] & p[2]
                   | g[0] & p[1] & p[2]
                   | g[1] & p[2]
                   | g[2];

   assign gout = g[0] & p[1] & p[2] & p[3]
               | g[1] & p[2] & p[3]
               | g[2] & p[3]
               | g[3];

   assign pout = p[0] & p[1] & p[2] & p[3];

   // a: 0
   // p,g: 1
   // pout: 2
   // gout: 3
   // cin: 5
   // carry: 7
   // sum: 10

   cla_slice s0(sum[0],g[0],p[0],a[0],b[0],carry[0]);
   cla_slice s1(sum[1],g[1],p[1],a[1],b[1],carry[1]);
   cla_slice s2(sum[2],g[2],p[2],a[2],b[2],carry[2]);
   cla_slice s3(sum[3],g[3],p[3],a[3],b[3],carry[3]);

endmodule