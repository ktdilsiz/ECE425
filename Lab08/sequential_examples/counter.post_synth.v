/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue Mar 28 12:33:56 2017
/////////////////////////////////////////////////////////////


module counter ( clk, clr, up, load, data, Q );
  input [3:0] data;
  output [3:0] Q;
  input clk, clr, up, load;
  wire   N13, N14, N15, N16, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;

  DFFPOSX1 \Q_reg[0]  ( .D(N13), .CLK(clk), .Q(Q[0]) );
  DFFPOSX1 \Q_reg[1]  ( .D(N14), .CLK(clk), .Q(Q[1]) );
  DFFPOSX1 \Q_reg[2]  ( .D(N15), .CLK(clk), .Q(Q[2]) );
  DFFPOSX1 \Q_reg[3]  ( .D(N16), .CLK(clk), .Q(Q[3]) );
  INVX2 U3 ( .A(Q[3]), .Y(n1) );
  INVX2 U4 ( .A(Q[2]), .Y(n2) );
  INVX2 U5 ( .A(Q[1]), .Y(n3) );
  INVX2 U6 ( .A(Q[0]), .Y(n4) );
  INVX2 U7 ( .A(up), .Y(n5) );
  OAI21X1 U8 ( .A(n6), .B(n7), .C(n8), .Y(N16) );
  NAND2X1 U9 ( .A(load), .B(data[3]), .Y(n8) );
  AOI21X1 U10 ( .A(n9), .B(n1), .C(n10), .Y(n6) );
  AOI21X1 U11 ( .A(n11), .B(n12), .C(n1), .Y(n10) );
  AOI22X1 U12 ( .A(Q[1]), .B(n2), .C(Q[2]), .D(n5), .Y(n11) );
  OAI21X1 U13 ( .A(n2), .B(n13), .C(n14), .Y(n9) );
  NAND2X1 U14 ( .A(Q[1]), .B(n15), .Y(n13) );
  OAI21X1 U15 ( .A(n16), .B(n7), .C(n17), .Y(N15) );
  NAND2X1 U16 ( .A(data[2]), .B(load), .Y(n17) );
  AOI21X1 U17 ( .A(Q[2]), .B(n18), .C(n19), .Y(n16) );
  OAI21X1 U18 ( .A(n3), .B(n20), .C(n14), .Y(n19) );
  OR2X1 U19 ( .A(n21), .B(Q[2]), .Y(n14) );
  NAND2X1 U20 ( .A(n15), .B(n2), .Y(n20) );
  OAI21X1 U21 ( .A(up), .B(n3), .C(n12), .Y(n18) );
  AOI22X1 U22 ( .A(n3), .B(Q[0]), .C(n4), .D(up), .Y(n12) );
  OAI21X1 U23 ( .A(n22), .B(n7), .C(n23), .Y(N14) );
  NAND2X1 U24 ( .A(data[1]), .B(load), .Y(n23) );
  AOI21X1 U25 ( .A(n15), .B(n3), .C(n24), .Y(n22) );
  OAI21X1 U26 ( .A(n25), .B(n3), .C(n21), .Y(n24) );
  NAND3X1 U27 ( .A(n3), .B(n5), .C(n4), .Y(n21) );
  XNOR2X1 U28 ( .A(Q[0]), .B(up), .Y(n25) );
  NOR2X1 U29 ( .A(n5), .B(n4), .Y(n15) );
  OAI21X1 U30 ( .A(Q[0]), .B(n7), .C(n26), .Y(N13) );
  NAND2X1 U31 ( .A(data[0]), .B(load), .Y(n26) );
  OR2X1 U32 ( .A(load), .B(clr), .Y(n7) );
endmodule

