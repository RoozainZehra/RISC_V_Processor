`timescale 1ns / 1ps

module ADDER(
    input [63:0] p,
    input [63:0] q,
    output [63:0] out
    );
  
    assign out = p+q;
    
endmodule
