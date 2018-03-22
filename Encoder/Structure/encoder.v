 
module encoder(x,y,z, d);

output x,y,z;input [7:0] d;

or(x,d[4],d[5],d[6],d[7]),(y,d[2],d[3],d[6],d[7]),(z,d[1],d[3],d[5],d[7]);

endmodule