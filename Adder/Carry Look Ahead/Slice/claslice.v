module cla_slice(
   input a, 
   input b,
   input cin, // Determined using other generate and propagates.
   output sum,
   output g, // Generate
   output p // Propagate
);

   assign g = a & b;

   assign p = a | b;

   assign sum = a ^ b ^ cin;

   endmodule
   