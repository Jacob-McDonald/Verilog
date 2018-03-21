module module mux (#parameter  WIDTH           = 8,
            #parameter  CHANNELS        = 4) (

    input   [(CHANNELS*WIDTH)-1:0]      in_bus,
    input   [clogb2(CHANNELS-1)-1:0]    sel,   

    output  [WIDTH-1:0]                 out
    );

integer i;
    
reg     [WIDTH-1:0] input_array [0:CHANNELS-1];

assign  out = input_array[sel];

always @*
    for(i=0; i<CHANNELS; i=i+1)
        input_array[i] = in_bus[(i*WIDTH)+:WIDTH];


//define the clogb2 function
function integer clogb2;
  input depth;
  integer i,result;
  begin
    for (i = 0; 2 ** i < depth; i = i + 1)
      result = i + 1;
    clogb2 = result;
  end
endfunction

endmodule