`timescale 1ns / 1ps


module mux2ne1(
    input Hyrja0,
    input Hyrja1,
    input S,
    output Dalja
    );
    
    assign Dalja = S ? Hyrja1 : Hyrja0;
endmodule
