module ID_EX(
    input clk, reset, flush, stall,
    input Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc,
    input [1:0] ALUOp,
    input [3:0] Funct,
    input [4:0] RS1, RS2, RD,
    input [63:0] IFID_PC_Out, ReadData1, ReadData2, Imm,
    output reg IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc,
    output reg [1:0] IDEX_ALUOp,
    output reg [3:0] IDEX_Funct,
    output reg [4:0] IDEX_RS1, IDEX_RS2, IDEX_RD,
    output reg [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm
);

    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1 || flush == 1'b1) begin
            IDEX_Branch <= 0; 
            IDEX_MemRead <= 0; 
            IDEX_MemWrite <= 0;
            IDEX_MemtoReg <= 0; 
            IDEX_RegWrite <= 0; 
            IDEX_ALUSrc <= 0;
            IDEX_ALUOp <= 0; 
            IDEX_Funct <= 0; 
            IDEX_RS1 <= 0; 
            IDEX_RS2 <= 0; 
            IDEX_RD <= 0;
            IDEX_PC_Out <= 0; 
            IDEX_ReadData1 <= 0; 
            IDEX_ReadData2 <= 0; 
            IDEX_Imm <= 0;
        end
        
        else if (stall == 1'b1) begin
            IDEX_Branch <= Branch; 
            IDEX_MemRead <= MemRead; 
            IDEX_MemWrite <= MemWrite;
            IDEX_MemtoReg <= MemtoReg; 
            IDEX_RegWrite <= RegWrite; 
            IDEX_ALUSrc <= ALUSrc;
            IDEX_ALUOp <= ALUOp; 
            IDEX_Funct <= Funct;
            IDEX_RS1 <= 0; 
            IDEX_RS2 <= 0; 
            IDEX_RD <= 0;
            IDEX_PC_Out <= 0; 
            IDEX_ReadData1 <= 0; 
            IDEX_ReadData2 <= 0; 
            IDEX_Imm <= 0;
        end
        
        else begin
            IDEX_Branch <= Branch; 
            IDEX_MemRead <= MemRead; 
            IDEX_MemWrite <= MemWrite;
            IDEX_MemtoReg <= MemtoReg; 
            IDEX_RegWrite <= RegWrite; 
            IDEX_ALUSrc <= ALUSrc;
            IDEX_ALUOp <= ALUOp; 
            IDEX_Funct <= Funct; 
            IDEX_RS1 <= RS1; 
            IDEX_RS2 <= RS2; 
            IDEX_RD <= RD;
            IDEX_PC_Out <= IFID_PC_Out; 
            IDEX_ReadData1 <= ReadData1; 
            IDEX_ReadData2 <= ReadData2; 
            IDEX_Imm <= Imm;    
        end 
    end
endmodule
