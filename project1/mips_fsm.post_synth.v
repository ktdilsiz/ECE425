/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Mon May  8 14:02:28 2017
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
  wire   brnch, N25, N26, N27, N28, N35, N99, N101, N102, n2, n3, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56;
  wire   [3:0] state;
  wire   [3:0] next;
  assign aluop[0] = brnch;
  assign pcsrc[0] = brnch;
  assign irwrite[0] = N35;

  LATCH \next_reg[0]  ( .CLK(N99), .D(n8), .Q(next[0]) );
  DFFPOSX1 \state_reg[0]  ( .D(N25), .CLK(clk), .Q(state[0]) );
  LATCH \next_reg[3]  ( .CLK(N99), .D(n2), .Q(next[3]) );
  DFFPOSX1 \state_reg[3]  ( .D(N28), .CLK(clk), .Q(state[3]) );
  LATCH \next_reg[2]  ( .CLK(N99), .D(N102), .Q(next[2]) );
  DFFPOSX1 \state_reg[2]  ( .D(N27), .CLK(clk), .Q(state[2]) );
  LATCH \next_reg[1]  ( .CLK(N99), .D(N101), .Q(next[1]) );
  DFFPOSX1 \state_reg[1]  ( .D(N26), .CLK(clk), .Q(state[1]) );
  AND2X2 U3 ( .A(next[3]), .B(n14), .Y(N28) );
  AND2X2 U4 ( .A(next[2]), .B(n14), .Y(N27) );
  AND2X2 U5 ( .A(next[1]), .B(n14), .Y(N26) );
  AND2X2 U6 ( .A(next[0]), .B(n14), .Y(N25) );
  INVX2 U7 ( .A(n25), .Y(pcsrc[1]) );
  INVX2 U8 ( .A(n35), .Y(n2) );
  INVX2 U9 ( .A(memwrite), .Y(n3) );
  INVX2 U10 ( .A(n31), .Y(alusrcb[1]) );
  INVX2 U11 ( .A(n29), .Y(n5) );
  INVX2 U12 ( .A(irwrite[3]), .Y(n6) );
  INVX2 U13 ( .A(state[3]), .Y(n7) );
  INVX2 U14 ( .A(n53), .Y(n8) );
  INVX2 U15 ( .A(state[2]), .Y(n9) );
  INVX2 U16 ( .A(n27), .Y(n10) );
  INVX2 U17 ( .A(state[1]), .Y(n11) );
  INVX2 U18 ( .A(state[0]), .Y(n12) );
  INVX2 U19 ( .A(n49), .Y(n13) );
  INVX2 U20 ( .A(reset), .Y(n14) );
  INVX2 U21 ( .A(n37), .Y(n15) );
  INVX2 U22 ( .A(op[5]), .Y(n16) );
  INVX2 U23 ( .A(n34), .Y(n17) );
  INVX2 U24 ( .A(op[4]), .Y(n18) );
  INVX2 U25 ( .A(op[3]), .Y(n19) );
  INVX2 U26 ( .A(op[2]), .Y(n20) );
  INVX2 U27 ( .A(op[1]), .Y(n21) );
  INVX2 U28 ( .A(op[0]), .Y(n22) );
  OR2X1 U29 ( .A(regdst), .B(memtoreg), .Y(regwrite) );
  NOR2X1 U30 ( .A(n23), .B(n24), .Y(regdst) );
  NAND2X1 U31 ( .A(n25), .B(n26), .Y(pcwrite) );
  NAND3X1 U32 ( .A(state[3]), .B(state[2]), .C(n27), .Y(n25) );
  NOR2X1 U33 ( .A(n24), .B(n26), .Y(irwrite[2]) );
  NOR2X1 U34 ( .A(n28), .B(n26), .Y(irwrite[1]) );
  NOR2X1 U35 ( .A(n29), .B(n30), .Y(memtoreg) );
  OAI21X1 U36 ( .A(n29), .B(n24), .C(n3), .Y(iord) );
  NOR2X1 U37 ( .A(n10), .B(n23), .Y(memwrite) );
  NOR2X1 U38 ( .A(n23), .B(n30), .Y(brnch) );
  OAI21X1 U39 ( .A(state[3]), .B(n10), .C(n26), .Y(alusrcb[0]) );
  AOI21X1 U40 ( .A(n31), .B(n23), .C(n12), .Y(alusrca) );
  NAND3X1 U41 ( .A(n32), .B(n33), .C(alusrcb[1]), .Y(N99) );
  NAND3X1 U42 ( .A(n17), .B(n21), .C(op[5]), .Y(n32) );
  NOR2X1 U43 ( .A(n10), .B(n26), .Y(N35) );
  NOR2X1 U44 ( .A(state[0]), .B(state[1]), .Y(n27) );
  AOI21X1 U45 ( .A(n36), .B(alusrcb[1]), .C(aluop[1]), .Y(n35) );
  NOR2X1 U46 ( .A(n28), .B(n23), .Y(aluop[1]) );
  NAND2X1 U47 ( .A(state[3]), .B(n9), .Y(n23) );
  OAI21X1 U48 ( .A(n37), .B(n12), .C(n33), .Y(n36) );
  OAI21X1 U49 ( .A(n21), .B(n20), .C(n13), .Y(n33) );
  NAND3X1 U50 ( .A(n38), .B(n6), .C(n39), .Y(N102) );
  OAI21X1 U51 ( .A(n40), .B(n41), .C(alusrcb[1]), .Y(n39) );
  NAND2X1 U52 ( .A(n5), .B(n11), .Y(n31) );
  OAI21X1 U53 ( .A(op[3]), .B(n12), .C(n42), .Y(n41) );
  OAI21X1 U54 ( .A(op[2]), .B(n16), .C(op[3]), .Y(n42) );
  NAND3X1 U55 ( .A(n21), .B(n18), .C(n22), .Y(n40) );
  NOR2X1 U56 ( .A(n26), .B(n30), .Y(irwrite[3]) );
  NAND2X1 U57 ( .A(state[1]), .B(state[0]), .Y(n30) );
  NAND2X1 U58 ( .A(n9), .B(n7), .Y(n26) );
  NAND3X1 U59 ( .A(n43), .B(n12), .C(n5), .Y(n38) );
  NAND2X1 U60 ( .A(state[2]), .B(n7), .Y(n29) );
  OAI21X1 U61 ( .A(state[2]), .B(n28), .C(n44), .Y(N101) );
  OAI21X1 U62 ( .A(n45), .B(n46), .C(n7), .Y(n44) );
  OAI21X1 U63 ( .A(n47), .B(n48), .C(n24), .Y(n46) );
  NAND2X1 U64 ( .A(state[1]), .B(n12), .Y(n24) );
  NAND2X1 U65 ( .A(n13), .B(op[2]), .Y(n48) );
  NAND3X1 U66 ( .A(n50), .B(n18), .C(n51), .Y(n49) );
  NOR2X1 U67 ( .A(op[3]), .B(op[0]), .Y(n51) );
  NOR2X1 U68 ( .A(state[0]), .B(op[5]), .Y(n50) );
  NAND2X1 U69 ( .A(state[2]), .B(n21), .Y(n47) );
  NOR2X1 U70 ( .A(n15), .B(n28), .Y(n45) );
  NAND3X1 U71 ( .A(op[3]), .B(op[5]), .C(n52), .Y(n37) );
  NOR2X1 U72 ( .A(op[1]), .B(n34), .Y(n52) );
  NAND2X1 U73 ( .A(state[0]), .B(n11), .Y(n28) );
  OAI21X1 U74 ( .A(n54), .B(n55), .C(n56), .Y(n53) );
  NOR2X1 U75 ( .A(state[3]), .B(state[0]), .Y(n56) );
  OR2X1 U76 ( .A(n43), .B(n34), .Y(n55) );
  NAND3X1 U77 ( .A(n20), .B(n18), .C(n22), .Y(n34) );
  NAND2X1 U78 ( .A(n11), .B(n16), .Y(n43) );
  NAND3X1 U79 ( .A(state[2]), .B(n19), .C(op[1]), .Y(n54) );
endmodule

