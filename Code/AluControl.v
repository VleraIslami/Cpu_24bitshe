`timescale 1ns / 1ps
//ALU Control (CU_OUT_x, Function Code nga R-formati, Opcode, T19) 


module ALUControl
(
input [1:0] ALUOp,
input [3:0] Funct,
input [3:0] opcode,
output reg [3:0] ALUCtrl //3 ose 1
);
always @(ALUOp)
begin 
case(ALUOp)
	2'b00: ALUCtrl = 4'b0010; //load+save+addi(merret opcode pasi qe nuk ka funksion tek I-formati)
 	2'b01: ALUCtrl = 4'b1010; //beq, bne
    	2'b10: //R-Format

case(Funct)
   	//4'b0000: ALUCtrl= 4'b0000; //and bonus point
	4'b0001: ALUCtrl= 4'b0001; //or 
	4'b0010: ALUCtrl= 4'b0010; //add 
	4'b0011: ALUCtrl= 4'b1010; //sub
	4'b0100: ALUCtrl= 4'b0011; //slt 
	//4'b0110: ALUCtrl= 4'b0101; //xor  bonus point
	//4'b0111: ALUCtrl= 4'b0110; //sll  bonus point

 	
     endcase
     
     
 2'b11: //mul
case(opcode)
	4'b0110: ALUCtrl= 4'b0100; //mul sipas opcode duhet me gjet ne pdf

     endcase
 endcase 
end


endmodule      







