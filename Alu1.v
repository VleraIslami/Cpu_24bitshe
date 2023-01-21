`timescale 1ns / 1ps

 module ALU1
 (
 input A,
 input B,
 input bInvert,
 input CIN,
 input Less,// vetem alu0 e ka setlessthan tjerat e kan less 
 input [1:0] op,
 output result,
 output carryOut
 );


// 		ne baze te net_dhe, net_ose, net_mb
//              pra dhe,ose logjike dhe mbledhsit 
//		mund te kryhen edhe 6 funksione tjera 
//		si dhe, or ,add, sub, setlessthan


   wire joB, mA, mB, dhe_teli, ose_teli, mb_teli; 
   //wire joA;
   //assign joA = ~A;//NUK DUHET
   assign joB = ~B;
   
   //mux2to1 m2_A(a, joA, aInvert, mA);//nuk na duhet A

   mux2ne1 m2_B(B, joB, bInvert, mB);

   assign dhe_teli = mA & mB;
   assign ose_teli = mA | mB;
 per bonus point
    assign andi_teli = A & mB;            
    assign ori_teli = A | mB;
    assign xor_teli = A ^ mB;

  

   Mbledhesi m1(mA, mB, CIN, mb_teli, CarryOut);
   
   mux4ne1 MuxiKryesor(dhe_teli, ose_teli, mb_teli, Less, Op, result);
    
 mux6ne1(dhe_teli, ose_teli, mb_teli, Less, Op, result)
   //
  // mux8to1 m8(result,op ,dhe_teli, ose_teli, mb_teli,less,zero, zero, zero, zero );//duhet me rishiku
   mux6ne1 mux(dhe_teli, ose_teli, mb_teli, Less, Op, result);
   endmodule



   


