`timescale 1ns / 1ps

module EX_MEM(
    input clk, reset, flush,
    input Branch, MemRead, MemWrite, MemtoReg, RegWrite, 
    input Zero,
    input addermuxselect,
    input [4:0] RD, 
    input [63:0] Adder2Out, Result, WriteData,
    output reg EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite,
    output reg EM_Zero,
    output reg EM_addermuxselect,
    output reg [4:0] EM_RD,
    output reg [63:0] EM_Adder2Out, EM_Result, EM_WriteData
    );
    
    
    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1 || flush == 1'b1) begin
            EM_Branch = 1'b0; 
            EM_MemRead = 1'b0; 
            EM_MemWrite = 1'b0; 
            EM_MemtoReg = 1'b0;
            EM_RegWrite = 1'b0; 
            EM_Zero = 1'b0; 
            EM_RD = 5'b0; 
            EM_Adder2Out = 63'b0;
            EM_Result = 63'b0; 
            EM_WriteData = 63'b0; 
            EM_addermuxselect = 1'b0;
        end
        else begin
            EM_Branch = Branch; 
            EM_MemRead = MemRead; 
            EM_MemWrite = MemWrite; 
            EM_MemtoReg = MemtoReg; 
            EM_RegWrite = RegWrite; 
            EM_Zero = Zero; 
            EM_RD = RD; 
            EM_Adder2Out = Adder2Out; 
            EM_Result = Result; 
            EM_WriteData = WriteData; 
            EM_addermuxselect = addermuxselect;
        end 
    end
endmodule
