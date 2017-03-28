`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 01:59:08 PM
// Design Name: 
// Module Name: alu_decoder_testbench
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


module alu_decoder_testbench();

logic [1:0] alu_op;
logic [5:0] funct;
logic [6:0] op;
logic clk;
    alu_ctl DUV_aluctl(.alu_op(alu_op), .funct(funct), .op(op));
    
  always
     begin
	clk = 0;
	#10 clk = 1;
	#10 ;
end

    initial begin
    
        alu_op=00;
        @(posedge clk);
        alu_op=00;
        @(posedge clk);
        alu_op=01;
        @(posedge clk);
        alu_op=10;
        funct = 6'h20;
        @(posedge clk);
        alu_op=10;
        funct = 6'h20;
        @(posedge clk);
        alu_op=10;
        funct = 6'h22;
        @(posedge clk);
        alu_op=10;
        funct = 6'h24;
        @(posedge clk);
        alu_op=10;
        funct = 6'h25;
        @(posedge clk);
        alu_op=10;
        funct = 6'h26;
        @(posedge clk);
        alu_op=10;
        funct = 6'h27;
        @(posedge clk);
        alu_op=10;
        funct = 6'h2b;  
        end                              

endmodule
