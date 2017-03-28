//-----------------------------------------------------------------------------
// Title         : mips_fsm
// Project       : ECE 425 - VLSI Circuit Design
//-----------------------------------------------------------------------------
// File          : mips_fsm.sv
// Author        : John Nestor, Lafayette College
// Created       : 26.03.2017
// Last modified : 26.03.2017
//-----------------------------------------------------------------------------
// Description :
// Skeleton file for the MIPS control unit FSM
//-----------------------------------------------------------------------------

module mips_fsm(
		input logic 	   clk, reset, 
                input [5:0] 	   op,
                output logic 	   memwrite, alusrca, 
                output logic 	   memtoreg, iord, pcwrite, brnch,
                output logic 	   regwrite, regdst, 
                output logic [1:0] pcsrc, alusrcb,
                output logic [1:0] aluop,
                output logic [3:0] irwrite
		);

   typedef enum logic [3:0] {
			     FETCH1 = 4'b0000, FETCH2, FETCH3, FETCH4,
			     DECODE, MEMADR, LBRD, LBWR, SBWR,
			     RTYPEEX, RTYPEWR, BEQEX, JEX
			     } state_t;

   typedef enum logic [5:0] {
			     LB    = 6'b100000,
                             SB    = 6'b101000,
                             RTYPE = 6'b000000,
                             BEQ   = 6'b000100,
                             J     = 6'b000010
			     } op_t;
			     
    state_t state, next;

   // add state register and next state logic / output logic here
   
    always_ff @(posedge clk)
    begin
        if(reset) state <= FETCH1;
        else    state <= next;
    end 

    always_comb
        begin
            iord = 0;
            alusrca = 0;
            irwrite = 0;
            alusrcb = 2'b00;
            aluop = 2'b00;
            pcwrite = 0;
            pcsrc = 2'b00;
            
            memwrite = 0;
            memtoreg = 0;
            brnch = 0;
            regwrite = 0;
            regdst = 0;
                           
            case(state)
                FETCH1:
                    begin
                        alusrca = 0;
                        iord = 0;
                        irwrite = 0;
                        alusrcb = 2'b01;
                        aluop = 2'b00;
                        pcwrite = 1;
                        pcsrc = 2'b00;
                        
                        next = FETCH2;
                    end
                FETCH2:
                    begin
                        alusrca = 0;
                        iord = 0;
                        irwrite = 1;
                        alusrcb = 2'b01;
                        aluop = 2'b00;
                        pcwrite = 1;
                        pcsrc = 2'b00;
                        
                        next = FETCH3;
                    end
                FETCH3:
                    begin
                        alusrca = 0;
                        iord = 0;
                        irwrite = 2;
                        alusrcb = 2'b01;
                        aluop = 2'b00;
                        pcwrite = 1;
                        pcsrc = 2'b00; 
                        
                        next = FETCH4;     
                    end
                FETCH4:
                    begin
                        alusrca = 0;
                        iord = 0;
                        irwrite = 3;
                        alusrcb = 2'b01;
                        aluop = 2'b00;
                        pcwrite = 1;
                        pcsrc = 2'b00;
                        
                        next = DECODE;          
                    end       
                DECODE:
                    begin
                    
                        alusrca = 0;
                        alusrcb = 2'b11;
                        aluop = 2'b00;
                        
                        if(op == LB || op == SB)
                            next = MEMADR;
                            
                        if(op == RTYPE)
                            next = RTYPEEX;
                            
                        if(op == BEQ)
                            next = BEQEX;
                        
                        if(op == J)
                            next = JEX;
                    
                    end
                MEMADR:
                    begin
                    
                        alusrca = 1;
                        alusrcb = 2'b10;
                        aluop = 2'b00;
                    
                        if(op == LB)
                            next = LBRD;
                        
                        if(op == SB)
                            next = SBWR;
                    
                    end
                LBRD:
                    begin
                    
                        iord = 1;
                        
                        next = LBWR;
                    
                    end
                LBWR:
                    begin
                    
                        regdst = 0;
                        regwrite = 0;
                        memtoreg = 1;
                        
                        next = FETCH1;
                    
                    end                     
                SBWR:
                    begin
                    
                        memwrite = 1;
                        iord = 1;
                        
                        next = FETCH1;
                    
                    end
                RTYPEEX:
                    begin
                    
                        alusrca = 1;
                        alusrcb = 2'b00;
                        aluop = 2'b10;
                        
                        next = RTYPEWR;
                                            
                    end
                RTYPEWR:
                    begin
                    
                        regdst = 1;
                        regwrite = 1;
                        memtoreg = 0;
                        
                        next = FETCH1;
                                            
                    end
                BEQEX:
                    begin
                    
                        alusrca = 1;
                        alusrcb = 2'b00;
                        aluop = 2'b01;
                        brnch = 1;
                        pcsrc = 2'b01;
                        
                        next = FETCH1;
                    
                    end
                JEX:
                    begin
                    
                        pcwrite = 1;
                        pcsrc = 10;

                        next = FETCH1;
                    
                    end
                default:
                    begin
                                        
                        next = FETCH1;
                    
                    end            
            endcase
        end
endmodule

