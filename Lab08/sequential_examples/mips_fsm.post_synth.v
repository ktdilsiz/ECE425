/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue Mar 28 14:46:01 2017
/////////////////////////////////////////////////////////////


module mips_fsm ( clk, reset, op, memwrite, alusrca, memtoreg, iord, pcwrite, 
        brnch, regwrite, regdst, pcsrc, alusrcb, aluop, irwrite );
  input [5:0] op;
  output [1:0] pcsrc;
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  input clk, reset;
  output memwrite, alusrca, memtoreg, iord, pcwrite, brnch, regwrite, regdst;
  wire   regwrite, N25, N26, N27, N28, N99, N101, N102, n2, n4, n5, n6, n7,
         \aluop[0] , n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;
  wire   [3:0] state;
  wire   [3:0] next;
  assign irwrite[2] = 1'b0;
  assign irwrite[3] = 1'b0;
  assign regdst = regwrite;
  assign brnch = \aluop[0] ;
  assign pcsrc[0] = \aluop[0] ;
  assign aluop[0] = \aluop[0] ;

  LATCH \next_reg[0]  ( .CLK(N99), .D(n10), .Q(next[0]) );
  DFFPOSX1 \state_reg[0]  ( .D(N25), .CLK(clk), .Q(state[0]) );
  LATCH \next_reg[3]  ( .CLK(N99), .D(n4), .Q(next[3]) );
  DFFPOSX1 \state_reg[3]  ( .D(N28), .CLK(clk), .Q(state[3]) );
  LATCH \next_reg[2]  ( .CLK(N99), .D(N102), .Q(next[2]) );
  DFFPOSX1 \state_reg[2]  ( .D(N27), .CLK(clk), .Q(state[2]) );
  LATCH \next_reg[1]  ( .CLK(N99), .D(N101), .Q(next[1]) );
  DFFPOSX1 \state_reg[1]  ( .D(N26), .CLK(clk), .Q(state[1]) );
  AND2X2 U3 ( .A(next[3]), .B(n15), .Y(N28) );
  AND2X2 U4 ( .A(next[2]), .B(n15), .Y(N27) );
  AND2X2 U5 ( .A(next[1]), .B(n15), .Y(N26) );
  AND2X2 U6 ( .A(next[0]), .B(n15), .Y(N25) );
  AND2X2 U7 ( .A(n41), .B(n42), .Y(n40) );
  INVX2 U8 ( .A(n25), .Y(pcsrc[1]) );
  INVX2 U9 ( .A(irwrite[1]), .Y(n2) );
  INVX2 U10 ( .A(n32), .Y(alusrca) );
  INVX2 U11 ( .A(n36), .Y(n4) );
  INVX2 U12 ( .A(n28), .Y(n5) );
  INVX2 U13 ( .A(memwrite), .Y(n6) );
  INVX2 U14 ( .A(n31), .Y(n7) );
  INVX2 U15 ( .A(n30), .Y(\aluop[0] ) );
  INVX2 U16 ( .A(state[3]), .Y(n9) );
  INVX2 U17 ( .A(n56), .Y(n10) );
  INVX2 U18 ( .A(n27), .Y(n11) );
  INVX2 U19 ( .A(state[1]), .Y(n12) );
  INVX2 U20 ( .A(state[0]), .Y(n13) );
  INVX2 U21 ( .A(n52), .Y(n14) );
  INVX2 U22 ( .A(reset), .Y(n15) );
  INVX2 U23 ( .A(n39), .Y(n16) );
  INVX2 U24 ( .A(op[5]), .Y(n17) );
  INVX2 U25 ( .A(n35), .Y(n18) );
  INVX2 U26 ( .A(op[4]), .Y(n19) );
  INVX2 U27 ( .A(op[3]), .Y(n20) );
  INVX2 U28 ( .A(op[2]), .Y(n21) );
  INVX2 U29 ( .A(op[1]), .Y(n22) );
  INVX2 U30 ( .A(op[0]), .Y(n23) );
  NOR2X1 U31 ( .A(n7), .B(n24), .Y(regwrite) );
  NAND2X1 U32 ( .A(n25), .B(n26), .Y(pcwrite) );
  NAND3X1 U33 ( .A(n27), .B(state[3]), .C(state[2]), .Y(n25) );
  NOR2X1 U34 ( .A(n28), .B(n29), .Y(memtoreg) );
  NAND2X1 U35 ( .A(state[0]), .B(state[1]), .Y(n29) );
  NOR2X1 U36 ( .A(n13), .B(n26), .Y(irwrite[0]) );
  OAI21X1 U37 ( .A(n24), .B(n28), .C(n6), .Y(iord) );
  NOR2X1 U38 ( .A(n11), .B(n7), .Y(memwrite) );
  NAND3X1 U39 ( .A(n31), .B(state[1]), .C(state[0]), .Y(n30) );
  OAI21X1 U40 ( .A(state[3]), .B(n11), .C(n26), .Y(alusrcb[0]) );
  NOR2X1 U41 ( .A(state[0]), .B(state[1]), .Y(n27) );
  OAI21X1 U42 ( .A(alusrcb[1]), .B(n31), .C(state[0]), .Y(n32) );
  NAND3X1 U43 ( .A(n33), .B(n34), .C(alusrcb[1]), .Y(N99) );
  NAND3X1 U44 ( .A(n18), .B(n22), .C(op[5]), .Y(n33) );
  AOI21X1 U45 ( .A(n37), .B(alusrcb[1]), .C(aluop[1]), .Y(n36) );
  NOR2X1 U46 ( .A(n38), .B(n7), .Y(aluop[1]) );
  NOR2X1 U47 ( .A(n9), .B(state[2]), .Y(n31) );
  OAI21X1 U48 ( .A(n39), .B(n13), .C(n34), .Y(n37) );
  OAI21X1 U49 ( .A(n22), .B(n21), .C(n14), .Y(n34) );
  OAI21X1 U50 ( .A(n13), .B(n2), .C(n40), .Y(N102) );
  NAND3X1 U51 ( .A(n43), .B(n13), .C(n5), .Y(n42) );
  OAI21X1 U52 ( .A(n44), .B(n45), .C(alusrcb[1]), .Y(n41) );
  NOR2X1 U53 ( .A(n28), .B(state[1]), .Y(alusrcb[1]) );
  NAND2X1 U54 ( .A(state[2]), .B(n9), .Y(n28) );
  OAI21X1 U55 ( .A(op[3]), .B(n13), .C(n46), .Y(n45) );
  OAI21X1 U56 ( .A(op[2]), .B(n17), .C(op[3]), .Y(n46) );
  NAND3X1 U57 ( .A(n22), .B(n19), .C(n23), .Y(n44) );
  NOR2X1 U58 ( .A(n26), .B(n12), .Y(irwrite[1]) );
  OR2X1 U59 ( .A(state[2]), .B(state[3]), .Y(n26) );
  OAI21X1 U60 ( .A(state[2]), .B(n38), .C(n47), .Y(N101) );
  OAI21X1 U61 ( .A(n48), .B(n49), .C(n9), .Y(n47) );
  OAI21X1 U62 ( .A(n50), .B(n51), .C(n24), .Y(n49) );
  NAND2X1 U63 ( .A(state[1]), .B(n13), .Y(n24) );
  NAND2X1 U64 ( .A(n14), .B(op[2]), .Y(n51) );
  NAND3X1 U65 ( .A(n53), .B(n19), .C(n54), .Y(n52) );
  NOR2X1 U66 ( .A(op[3]), .B(op[0]), .Y(n54) );
  NOR2X1 U67 ( .A(state[0]), .B(op[5]), .Y(n53) );
  NAND2X1 U68 ( .A(state[2]), .B(n22), .Y(n50) );
  NOR2X1 U69 ( .A(n16), .B(n38), .Y(n48) );
  NAND3X1 U70 ( .A(op[3]), .B(op[5]), .C(n55), .Y(n39) );
  NOR2X1 U71 ( .A(op[1]), .B(n35), .Y(n55) );
  NAND2X1 U72 ( .A(state[0]), .B(n12), .Y(n38) );
  OAI21X1 U73 ( .A(n57), .B(n58), .C(n59), .Y(n56) );
  NOR2X1 U74 ( .A(state[3]), .B(state[0]), .Y(n59) );
  OR2X1 U75 ( .A(n43), .B(n35), .Y(n58) );
  NAND3X1 U76 ( .A(n21), .B(n19), .C(n23), .Y(n35) );
  NAND2X1 U77 ( .A(n12), .B(n17), .Y(n43) );
  NAND3X1 U78 ( .A(state[2]), .B(n20), .C(op[1]), .Y(n57) );
endmodule

