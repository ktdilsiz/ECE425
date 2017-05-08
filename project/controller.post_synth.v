/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Mon May  8 13:56:16 2017
/////////////////////////////////////////////////////////////


module controller ( clk, reset, op, funct, zero, memwrite, alusrca, memtoreg, 
        iord, pcen, regwrite, regdst, pcsrc, alusrcb, alucontrol, irwrite );
  input [5:0] op;
  input [5:0] funct;
  output [1:0] pcsrc;
  output [1:0] alusrcb;
  output [6:0] alucontrol;
  output [3:0] irwrite;
  input clk, reset, zero;
  output memwrite, alusrca, memtoreg, iord, pcen, regwrite, regdst;
  wire   n2;
  tri   clk;
  tri   reset;
  tri   [5:0] op;
  tri   [5:0] funct;
  tri   memwrite;
  tri   alusrca;
  tri   memtoreg;
  tri   iord;
  tri   regwrite;
  tri   regdst;
  tri   [1:0] pcsrc;
  tri   [1:0] alusrcb;
  tri   [6:0] alucontrol;
  tri   [3:0] irwrite;
  tri   pcwrite;
  tri   brnch;
  tri   [1:0] aluop;

  mips_fsm U_FSM ( .clk(clk), .reset(reset), .op(op), .memwrite(memwrite), 
        .alusrca(alusrca), .memtoreg(memtoreg), .iord(iord), .pcwrite(pcwrite), 
        .brnch(brnch), .regwrite(regwrite), .regdst(regdst), .pcsrc(pcsrc), 
        .alusrcb(alusrcb), .aluop(aluop), .irwrite(irwrite) );
  aludec ac ( .aluop(aluop), .funct(funct), .alucontrol(alucontrol) );
  INVX2 U1 ( .A(n2), .Y(pcen) );
  AOI21X1 U2 ( .A(zero), .B(brnch), .C(pcwrite), .Y(n2) );
endmodule

