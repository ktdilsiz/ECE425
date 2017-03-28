/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue Feb 28 14:23:22 2017
/////////////////////////////////////////////////////////////


module alu_ctl ( alu_op, funct, op );
  input [1:0] alu_op;
  input [5:0] funct;
  output [6:0] op;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;

  AND2X2 U3 ( .A(funct[1]), .B(funct[3]), .Y(n24) );
  INVX2 U4 ( .A(op[2]), .Y(n1) );
  INVX2 U5 ( .A(alu_op[1]), .Y(n2) );
  INVX2 U6 ( .A(n22), .Y(op[1]) );
  INVX2 U7 ( .A(n15), .Y(n4) );
  INVX2 U8 ( .A(n17), .Y(n5) );
  INVX2 U9 ( .A(funct[2]), .Y(n6) );
  INVX2 U10 ( .A(funct[1]), .Y(n7) );
  OAI21X1 U11 ( .A(n8), .B(n9), .C(n1), .Y(op[6]) );
  NAND2X1 U12 ( .A(funct[2]), .B(n4), .Y(n9) );
  NAND2X1 U13 ( .A(funct[1]), .B(funct[0]), .Y(n8) );
  OAI21X1 U14 ( .A(alu_op[1]), .B(alu_op[0]), .C(n10), .Y(op[5]) );
  NAND2X1 U15 ( .A(n11), .B(n12), .Y(n10) );
  OAI21X1 U16 ( .A(funct[0]), .B(n13), .C(n14), .Y(n12) );
  XOR2X1 U17 ( .A(funct[2]), .B(funct[1]), .Y(n13) );
  OAI21X1 U18 ( .A(n5), .B(n15), .C(n16), .Y(op[4]) );
  OAI21X1 U19 ( .A(n7), .B(funct[0]), .C(n14), .Y(n17) );
  NAND3X1 U20 ( .A(funct[0]), .B(n7), .C(funct[2]), .Y(n14) );
  OAI21X1 U21 ( .A(alu_op[1]), .B(alu_op[0]), .C(n18), .Y(op[3]) );
  NAND3X1 U22 ( .A(n19), .B(n7), .C(n11), .Y(n18) );
  OAI21X1 U23 ( .A(n20), .B(n21), .C(n16), .Y(op[2]) );
  AOI21X1 U24 ( .A(n2), .B(alu_op[0]), .C(op[1]), .Y(n16) );
  NAND2X1 U25 ( .A(n4), .B(funct[1]), .Y(n21) );
  OR2X1 U26 ( .A(funct[0]), .B(funct[2]), .Y(n20) );
  OAI21X1 U27 ( .A(n15), .B(n6), .C(n22), .Y(op[0]) );
  NAND3X1 U28 ( .A(n23), .B(alu_op[1]), .C(n24), .Y(n22) );
  NOR2X1 U29 ( .A(n19), .B(n25), .Y(n23) );
  NAND2X1 U30 ( .A(funct[0]), .B(n6), .Y(n19) );
  NAND2X1 U31 ( .A(n11), .B(alu_op[1]), .Y(n15) );
  NOR2X1 U32 ( .A(n25), .B(funct[3]), .Y(n11) );
  NAND2X1 U33 ( .A(n26), .B(funct[5]), .Y(n25) );
  NOR2X1 U34 ( .A(funct[4]), .B(alu_op[0]), .Y(n26) );
endmodule

