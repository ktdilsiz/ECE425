module counter(
	       input logic 	  clk,
	       input logic 	  clr,
	       input logic 	  up,
	       input logic    load,
	       input logic  [3:0]  data,
	       output logic [3:0] Q
	       );

   always_ff @(posedge clk)
     begin
    if (load==1) Q<= data;
    else if (clr) Q <= 4'd0;
	else if (up) Q <= Q + 1;
	else Q <= Q - 1;
     end

endmodule // counter

