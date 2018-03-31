module parity_check(

input [7:0]data,
ouput parity_error,
);

if (^data[7:0] == parity[0]) begin
    parity_error = 1'b0;
  end
else begin
    parity_error = 1'b1; // parity error detected
  end
end