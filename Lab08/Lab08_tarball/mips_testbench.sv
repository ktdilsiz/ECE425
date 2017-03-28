`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2017 02:11:17 PM
// Design Name: 
// Module Name: mips_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mips_testbench();
    logic clk, reset;
    logic [5:0] 	   op;
    logic        memwrite, alusrca;
    logic        memtoreg, iord, pcwrite, brnch;
    logic        regwrite, regdst; 
    logic [1:0] pcsrc, alusrcb;
    logic [1:0] aluop;
    logic [3:0] irwrite;
    
    mips_fsm MIPS (
        .clk(clk), 
        .reset(reset), 
        .op(op),
        .memwrite(memwrite),
        .alusrca(alusrca),
        .memtoreg(memtoreg),
        .iord(iord),
        .pcwrite(pcwrite),
        .brnch(brnch),
        .regwrite(regwrite),
        .regdst(regdst),
        .pcsrc(pcsrc),
        .alusrcb(alusrcb),
        .aluop(aluop),
        .irwrite(irwrite)
    );

always begin
   clk = 0;
   #5;
   clk = 1;
   #5;
end

   typedef enum logic [5:0] {
			     LB    = 6'b100000,
                             SB    = 6'b101000,
                             RTYPE = 6'b000000,
                             BEQ   = 6'b000100,
                             J     = 6'b000010
			     } op_t;

initial
begin
    
    op = LB;
    reset = 1;
    @(posedge clk)
    reset = 0;
    
    repeat(8)
    begin
        @(posedge clk) #1;
    end
    
    op = SB;
    
    repeat(7)
    begin
        @(posedge clk) #1;
    end
    
    op = RTYPE;
    
    repeat(7)
    begin
        @(posedge clk) #1;
    end
    
    op = BEQ;
    
    repeat(6)
        begin
            @(posedge clk) #1;
        end
        
    op = J;        
        
    repeat(6)
        begin
            @(posedge clk) #1;
        end
        
    $finish;

end


endmodule
