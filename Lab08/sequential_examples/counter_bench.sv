module counter_bench;
   logic clk, clr, up;
   logic load;
   logic  [3:0] Q;
   logic  [3:0] data;
   counter DUV (.clk(clk), .load(load), .data(data), .clr(clr), .up(up), .Q(Q));

   always begin
      clk = 0;
      #10;
      clk = 1;
      #10;
   end

   initial begin
      // $vcdpluson;   // dump signals to file vcdplus.vcd - uncomment this if using VCS
      clr = 1;
      up = 0;
      #1;
      @(posedge clk) #1;
      clr = 0;
      $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      repeat (18) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end
      load = 1;
      data = 4'b1100;
     repeat (9) begin
     @(posedge clk) #1;
     $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end
      data = 4'b0011;
       repeat (9) begin
            @(posedge clk) #1;
            $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
             end
      load =0;
      up = 1;
      repeat (18) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end
      $finish;
   end // initial begin
endmodule // counter_bench


