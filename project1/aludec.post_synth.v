/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Mon May  8 14:01:22 2017
/////////////////////////////////////////////////////////////


module aludec ( aluop, funct, alucontrol );
  input [1:0] aluop;
  input [5:0] funct;
  output [6:0] alucontrol;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23;

  AND2X2 U3 ( .A(n23), .B(funct[5]), .Y(n21) );
  INVX2 U4 ( .A(alucontrol[2]), .Y(n1) );
  INVX2 U5 ( .A(alucontrol[1]), .Y(n2) );
  INVX2 U6 ( .A(aluop[1]), .Y(n3) );
  INVX2 U7 ( .A(n15), .Y(n4) );
  INVX2 U8 ( .A(funct[3]), .Y(n5) );
  INVX2 U9 ( .A(funct[2]), .Y(n6) );
  INVX2 U10 ( .A(funct[1]), .Y(n7) );
  INVX2 U11 ( .A(funct[0]), .Y(n8) );
  OAI21X1 U12 ( .A(n8), .B(n9), .C(n1), .Y(alucontrol[6]) );
  OR2X1 U13 ( .A(n10), .B(n7), .Y(n9) );
  OAI21X1 U14 ( .A(aluop[1]), .B(aluop[0]), .C(n11), .Y(alucontrol[5]) );
  NAND2X1 U15 ( .A(n4), .B(n12), .Y(n11) );
  OAI21X1 U16 ( .A(funct[0]), .B(n13), .C(n14), .Y(n12) );
  XNOR2X1 U17 ( .A(n6), .B(funct[1]), .Y(n13) );
  OAI21X1 U18 ( .A(n15), .B(n16), .C(n17), .Y(alucontrol[4]) );
  NAND2X1 U19 ( .A(aluop[1]), .B(n18), .Y(n16) );
  OAI21X1 U20 ( .A(funct[0]), .B(n7), .C(n14), .Y(n18) );
  NAND3X1 U21 ( .A(funct[2]), .B(n7), .C(funct[0]), .Y(n14) );
  OAI22X1 U22 ( .A(aluop[1]), .B(aluop[0]), .C(n15), .D(n19), .Y(alucontrol[3]) );
  OAI21X1 U23 ( .A(funct[2]), .B(n8), .C(n7), .Y(n19) );
  OAI21X1 U24 ( .A(funct[0]), .B(n20), .C(n17), .Y(alucontrol[2]) );
  AOI21X1 U25 ( .A(n3), .B(aluop[0]), .C(alucontrol[1]), .Y(n17) );
  NAND2X1 U26 ( .A(n2), .B(n10), .Y(alucontrol[0]) );
  NAND3X1 U27 ( .A(n4), .B(aluop[1]), .C(funct[2]), .Y(n10) );
  NAND2X1 U28 ( .A(n21), .B(n5), .Y(n15) );
  NOR2X1 U29 ( .A(n5), .B(n20), .Y(alucontrol[1]) );
  NAND3X1 U30 ( .A(n21), .B(n6), .C(n22), .Y(n20) );
  NOR2X1 U31 ( .A(n3), .B(n7), .Y(n22) );
  NOR2X1 U32 ( .A(funct[4]), .B(aluop[0]), .Y(n23) );
endmodule

