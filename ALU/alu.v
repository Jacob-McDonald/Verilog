module alu2(result,overflow,a,b,alu_op);
   input [31:0] a, b;
   input [2:0]  alu_op;
   output [31:0] result;
   output        overflow;

   wire [31:0]   cout;

   parameter     op_and = 0;
   parameter     op_or  = 1;
   parameter     op_slt = 2;
   parameter     op_add = 3;
   parameter     op_sub = 4;

   parameter     sop_and = 0;
   parameter     sop_or  = 1;
   parameter     sop_add = 2;
   parameter     sop_slt = 3;

   wire [1:0] op =
              alu_op == op_and ? sop_and :
              alu_op == op_or  ? sop_or  :
              alu_op == op_slt ? sop_slt :
              alu_op == op_add ? sop_add :
              alu_op == op_sub ? sop_add : 0;

   wire       binvert = alu_op == op_sub || alu_op == op_slt;

   wire       set;  // MSB of sum.

   alu_slice2 slice0(result[0],cout[0],a[0],b[0],binvert,op,binvert,set);
   alu_slice2 slice1(result[1],cout[1],a[1],b[1],cout[0],op,binvert,1'b0);
   alu_slice2 slice2(result[2],cout[2],a[2],b[2],cout[1],op,binvert,1'b0);
   alu_slice2 slice3(result[3],cout[3],a[3],b[3],cout[2],op,binvert,1'b0);
   alu_slice2 slice4(result[4],cout[4],a[4],b[4],cout[3],op,binvert,1'b0);
   alu_slice2 slice5(result[5],cout[5],a[5],b[5],cout[4],op,binvert,1'b0);
   alu_slice2 slice6(result[6],cout[6],a[6],b[6],cout[5],op,binvert,1'b0);
   alu_slice2 slice7(result[7],cout[7],a[7],b[7],cout[6],op,binvert,1'b0);
   alu_slice2 slice8(result[8],cout[8],a[8],b[8],cout[7],op,binvert,1'b0);
   alu_slice2 slice9(result[9],cout[9],a[9],b[9],cout[8],op,binvert,1'b0);
   alu_slice2 slice10(result[10],cout[10],a[10],b[10],cout[9],op,binvert,1'b0);
   alu_slice2 slice11(result[11],cout[11],a[11],b[11],cout[10],op,binvert,1'b0);
   alu_slice2 slice12(result[12],cout[12],a[12],b[12],cout[11],op,binvert,1'b0);
   alu_slice2 slice13(result[13],cout[13],a[13],b[13],cout[12],op,binvert,1'b0);
   alu_slice2 slice14(result[14],cout[14],a[14],b[14],cout[13],op,binvert,1'b0);
   alu_slice2 slice15(result[15],cout[15],a[15],b[15],cout[14],op,binvert,1'b0);
   alu_slice2 slice16(result[16],cout[16],a[16],b[16],cout[15],op,binvert,1'b0);
   alu_slice2 slice17(result[17],cout[17],a[17],b[17],cout[16],op,binvert,1'b0);
   alu_slice2 slice18(result[18],cout[18],a[18],b[18],cout[17],op,binvert,1'b0);
   alu_slice2 slice19(result[19],cout[19],a[19],b[19],cout[18],op,binvert,1'b0);
   alu_slice2 slice20(result[20],cout[20],a[20],b[20],cout[19],op,binvert,1'b0);
   alu_slice2 slice21(result[21],cout[21],a[21],b[21],cout[20],op,binvert,1'b0);
   alu_slice2 slice22(result[22],cout[22],a[22],b[22],cout[21],op,binvert,1'b0);
   alu_slice2 slice23(result[23],cout[23],a[23],b[23],cout[22],op,binvert,1'b0);
   alu_slice2 slice24(result[24],cout[24],a[24],b[24],cout[23],op,binvert,1'b0);
   alu_slice2 slice25(result[25],cout[25],a[25],b[25],cout[24],op,binvert,1'b0);
   alu_slice2 slice26(result[26],cout[26],a[26],b[26],cout[25],op,binvert,1'b0);
   alu_slice2 slice27(result[27],cout[27],a[27],b[27],cout[26],op,binvert,1'b0);
   alu_slice2 slice28(result[28],cout[28],a[28],b[28],cout[27],op,binvert,1'b0);
   alu_slice2 slice29(result[29],cout[29],a[29],b[29],cout[28],op,binvert,1'b0);
   alu_slice2 slice30(result[30],cout[30],a[30],b[30],cout[29],op,binvert,1'b0);
   alu_slice2MSB slice31(result[31],set,overflow,a[31],b[31],
                         cout[30],op,binvert, 1'b0);

endmodule