module aludec(input  logic [1:0] aluop, 
              input  logic [5:0] funct, 
              output logic [6:0] alucontrol);

//  typedef enum logic [5:0] {ADD = 6'b100000,
//                            SUB = 6'b100010,
//                            AND = 6'b100100,
//                            OR  = 6'b100101,
//                            SLT = 6'b101010} functcode;
//  always_comb
//    case (aluop)
//      2'b00: alucontrol = 3'b010;  // add for lb/sb/addi
//      2'b01: alucontrol = 3'b110;  // subtract (for beq)
//      default: case(funct)      // R-Type instructions
//                 ADD: alucontrol = 3'b010;
//                 SUB: alucontrol = 3'b110;
//                 AND: alucontrol = 3'b000;
//                 OR:  alucontrol = 3'b001;
//                 SLT: alucontrol = 3'b111;
//                 default:   alucontrol = 3'b101; // should never happen
//               endcase
//    endcase
    
    // symbolic constants for MIPS function codes
    parameter F_add = 6'h20;
    parameter F_sub = 6'h22;
    parameter F_and = 6'h24;
    parameter F_or  = 6'h25;
    parameter F_sltu = 6'h2b;
    parameter F_slt = 6'h2a;
    parameter F_xor = 6'h26;
    parameter F_nor = 6'h27;

    always_comb
    begin
        case (aluop) 
            2'b00 : alucontrol = 7'b0101000;    // add for lw, sw, etc.
            2'b01 : alucontrol = 7'b1010100;    // sub for beq, bne, etc.
            2'b10 : case (funct) 
                        F_add : alucontrol = 7'b0101000;
                        F_sub : alucontrol = 7'b1010100;
                        F_and : alucontrol = 7'b0001001;
                        F_or  : alucontrol = 7'b0111001;
                        F_sltu : alucontrol = 7'b1010111;
                        F_slt : alucontrol = 7'b1010111;
                        F_nor : alucontrol = 7'b1000001;
                        F_xor : alucontrol = 7'b0110001;
                        default alucontrol = 7'b0000000;
                    endcase
            default alucontrol = 7'b0000000;
        endcase
    end

endmodule
