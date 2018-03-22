module cla_5(sum,a,b);
   input [4:0] a, b;
   output [5:0] sum;

   wire [4:0]   g, p, carry;

   /// Logic for Carry In Signals
   //
   // General idea:  for there to be a carry at bit x either:
   //   either the carry is generated at bit x-1
   //   or the carry is generated at bit x-2 and prop. through x-1
   //   or the carry is generated at bit x-3 and prop. through x-1 and x-1
   //   ...
   //   or the carry is generated at bit 0 and prop. through 1 and ... and x-1

   assign       carry[0] = 1'b0;

   assign       carry[1] = g[0];

   assign       carry[2] = g[0] & p[1]
                         | g[1];

   assign       carry[3] = g[0] & p[1] & p[2]
                         | g[1] & p[2]
                         | g[2];

   assign       carry[4] = g[0] & p[1] & p[2] & p[3]
                         | g[1] & p[2] & p[3]
                         | g[2] & p[3]
                         | g[3];

   assign sum[5] = g[0] & p[1] & p[2] & p[3] & p[4]
                 | g[1] & p[2] & p[3] & p[4]
                 | g[2] & p[3] & p[4]
                 | g[3] & p[4]
                 | g[4];

   cla_slice s0(sum[0],g[0],p[0],a[0],b[0],carry[0]);
   cla_slice s1(sum[1],g[1],p[1],a[1],b[1],carry[1]);
   cla_slice s2(sum[2],g[2],p[2],a[2],b[2],carry[2]);
   cla_slice s3(sum[3],g[3],p[3],a[3],b[3],carry[3]);
   cla_slice s4(sum[4],g[4],p[4],a[4],b[4],carry[4]);

endmodule
