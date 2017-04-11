module shifter #(parameter WIDTH=8)
   (
    input logic [WIDTH-1:0] 	    din,
    input logic [$clog2(WIDTH)-1:0] shamt,
    input logic 		    right,
    input logic 		    airth,
    output logic [WIDTH-1:0] 	    dout
    );
    
        always_comb
            begin
            if(right) 
                begin
                  if (airth) dout = din >>> shamt;    
                  else   dout = din >> shamt;
                end
            else      dout = din << shamt;
            end
            

   // add code to model shifter function
   
endmodule // shifter
