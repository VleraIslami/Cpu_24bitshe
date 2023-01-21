`timescale 1ns / 1ps


module DataMemory(
input wire[23:0] Address,
input wire[23:0] WriteData,
input wire MemWrite,
input wire MemRead,
input wire Clock,
output wire[23:0] ReadData
);

reg[7:0] dataMem[127:0]; // 127 adresa qe i ruajne nga 8 bita

initial
$readmemh("dataMemory.mem", dataMem); //readmemb

always@(posedge Clock)
begin
    if(MemWrite) 
        begin
            //bigEndian
            dataMem[Address + 24'd0] <= WriteData[23:16];
            dataMem[Address + 24'd1] <= WriteData[15:8];
            dataMem[Address + 24'd2] <= WriteData[7:0];

           end
end

always@(negedge Clock)
begin
$writememh("dataMemory.mem", dataMem);
end

 
 assign ReadData[23:16] = dataMem[Address + 24'd0];
 assign ReadData[15:8] = dataMem[Address + 24'd1];
 assign ReadData[7:0] = dataMem[Address + 24'd2];



endmodule
