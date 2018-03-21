module mux(
input [3:0]I,
input [1:0]Sel, 
output reg Y
);
  
always @ (Sel, I)
begin
    case (Sel)
        2'd0: Y = I[0];
        2'd1: Y = I[1];
        2'd2: Y = I[2];
        2'd3: Y = I[3];
        default:
            Y = 2'd0;
    endcase
end

endmodule