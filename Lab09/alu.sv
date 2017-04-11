module alu #(parameter WIDTH = 8)
            (input  logic [WIDTH-1:0] a, b, shifterOut, 
             input  logic [6:0]       alucontrol, 
             output logic [WIDTH-1:0] result,
             output logic             zero);

  logic [WIDTH-1:0] mux4result, sumresult, sltresult;
  logic [WIDTH-1:0] less;
  
  mux4 #(1) mux4block0(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[0], b[0]}, mux4result[0]);
  mux4 #(1) mux4block1(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[1], b[1]}, mux4result[1]);
  mux4 #(1) mux4block2(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[2], b[2]}, mux4result[2]);
  mux4 #(1) mux4block3(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[3], b[3]}, mux4result[3]);
  mux4 #(1) mux4block4(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[4], b[4]}, mux4result[4]);
  mux4 #(1) mux4block5(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[5], b[5]}, mux4result[5]);
  mux4 #(1) mux4block6(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[6], b[6]}, mux4result[6]);
  mux4 #(1) mux4block7(alucontrol[6], alucontrol[5], alucontrol[4], alucontrol[3], {a[7], b[7]}, mux4result[7]);
  
  //andN    andblock(a, b, andresult);
  //orN     orblock(a, b, orresult);
  //condinv binv(b, alucontrol[2], b2);
  adder   addblock(a, mux4result, alucontrol[2], sumresult);
  
  assign less = (a < b) ? (alucontrol == 7'b1010111) : 0;
  // slt should be 1 if most significant bit of sum is 1
  assign sltresult = sumresult[WIDTH-1];

  //mux3 resultmux(sumresult, mux4result, less, alucontrol[1:0], result);
  mux4 resultmux2(sumresult, mux4result, less, shifterOut, alucontrol[1:0], result);
  
  zerodetect #(WIDTH) zd(result, zero);
  
endmodule
