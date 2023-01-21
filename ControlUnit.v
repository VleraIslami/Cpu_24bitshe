`timescale 1ns / 1ps

module CU(
    input [3:0] OPCODE, //HYRJA NGA D_OUT_1
    output reg RegDst,  //DALJET E CU, CU_OUT_x
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg[1:0] AluOp,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite
    );
    
    
always @ (OPCODE)
begin
case(OPCODE)
4'b0110: //PER R-FORMAT //AND
    begin
    RegDst = 1;
    AluSrc = 0;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 1;
    AluOp[0] = 0;
    end

4'b0010: 	//PER LS
    begin
    RegDst = 0;
    AluSrc = 1;
    MemToReg = 1;
    RegWrite = 1;
    MemRead = 1;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
    
4'b0011:	   //PER SS
    begin
    RegDst = 1'bX; // vlere random
    AluSrc = 1;
    MemToReg = 0;
    RegWrite = 1'bX;
    MemRead = 0;
    MemWrite = 1;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
    
4'b0100: 	//PER BEQ
    begin
    RegDst = 0;
    AluSrc = 0;
    MemToReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    AluOp[1] = 0;
    AluOp[0] = 1;
    end 
4'b0001: 	//PER ADDI
    begin
    RegDst = 0;
    AluSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    AluOp[1] = 0;
    AluOp[0] = 0;
    end 
endcase

end

endmodule
	