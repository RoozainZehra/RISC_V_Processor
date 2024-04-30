`timescale 1ns / 1ps

module RISC_V_Processor(
    input clk,
    input reset
    );
      
    // Declaration of all necessary wires // 
    //PC unit    
    wire [63:0] PC_In, PC_Out, Adder1Out, Adder2Out;
    wire addermuxselect, EM_addermuxselect;
    
    //Instruction unit & Control Unit
    wire [31:0] Instruction;
    wire [6:0] Opcode, Funct7;
    wire [4:0] RD, RS1, RS2;
    wire [2:0] Funct3;
    
    //ALU control Unit
    wire [1:0] ALUOp;
    wire Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc, Zero, sel_Branch, stall;
    wire [3:0] Funct, Operation;
    
    //Register unit and Data Memory
    wire [63:0] Imm, WriteData, ReadData1, ReadData2, Result, Read_Data;
    wire [63:0] MuxmidOut; // Muxmid2Out, Muxmid1Out;
    
    //IF stage wires and registers   
    wire [63:0] IFID_PC_Out;
    wire [31:0] IFID_Instruction;
    
    //ID_EX stage wires and registers
    wire IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc;
    wire [1:0] IDEX_ALUOp, ForwardA, ForwardB;
    wire [3:0] IDEX_Funct;
    wire [4:0] IDEX_RS1, IDEX_RS2, IDEX_RD, EM_RD, MW_RD;
    wire [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm;
    
    //EX_MEM stage wires and registers
    wire EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite, EM_Zero;
    wire [63:0] EM_Adder2Out, EM_Result, EM_WriteData;
    
    //MEM_WB stage wires and registers
    wire MW_MemtoReg, MW_RegWrite;// PC_Write, IFID_Write, IDEX_MuxOut;
    wire [63:0] MW_Result, MW_Read_Data;
    
    wire [63:0] mux1out, mux2out;
    wire flush;

    
    // IF/ID //
    Flush fl (.branch(addermuxselect && Branch),
              .flush(flush));
              
    Hazard_Detection HDU(.RS1(RS1), 
        .RS2(RS2), 
        .IDEX_RD(IDEX_RD), 
        .IDEX_MemRead(IDEX_MemRead), 
        .stall(stall)); 
    
    PC pc(.clk(clk), 
        .reset(reset), 
        .stall(stall), 
        .PC_In(PC_In), 
        .PC_Out(PC_Out));
        
    Instruction_Memory IM(.inst_address(PC_Out), 
        .instruction(Instruction));
       
    ADDER add1(.p(PC_Out), 
        .q(64'd4), 
        .out(Adder1Out));
      
    IF_ID ifid(.clk(clk), 
        .reset(reset), 
        .flush(flush),
        .stall(stall), 
        .Instruction(Instruction), 
        .PC_Out(PC_Out), 
        .IFID_Instruction(IFID_Instruction), 
        .IFID_PC_Out(IFID_PC_Out));
       
    INSTRUCTION_PARSER IP(.instruction(IFID_Instruction), 
        .opcode(Opcode), 
        .rd(RD), 
        .funct3(Funct3), 
        .rs1(RS1), 
        .rs2(RS2), 
        .funct7(Funct7));
            
    Mux_2x1 muxfirst(.A(Adder1Out), 
        .B(EM_Adder2Out), 
        .SEL(sel_Branch), 
        .Y(PC_In));
    
         
    
    // ID/EX//
    Control_Unit CU(.Opcode(Opcode), 
        .stall(stall), 
        .ALUOp(ALUOp), 
        .Branch(Branch), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite));
        
    IMM_Data IG(.instruction(IFID_Instruction), 
        .imm_data(Imm));
        
    Register_File RF(.clk(clk), 
        .reset(reset), 
        .rs1(RS1), 
        .rs2(RS2), 
        .rd(MW_RD),
        .writedata(WriteData), 
        .reg_write(MW_RegWrite), 
        .readdata1(ReadData1), 
        .readdata2(ReadData2));
        
    assign Funct = {IFID_Instruction[30], IFID_Instruction[14:12]};
    ID_EX idex(.clk(clk), 
        .reset(reset),
        .flush(flush), 
        .stall(stall),
        .Branch(Branch),
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .MemtoReg(MemtoReg), 
        .RegWrite(RegWrite), 
        .ALUSrc(ALUSrc), 
        .ALUOp(ALUOp),
        .Funct(Funct), 
        .RS1(RS1), 
        .RS2(RS2), 
        .RD(RD), 
        .IFID_PC_Out(IFID_PC_Out), 
        .ReadData1(ReadData1),
        .ReadData2(ReadData2), 
        .Imm(Imm),
        .IDEX_Branch(IDEX_Branch), 
        .IDEX_MemRead(IDEX_MemRead), 
        .IDEX_MemWrite(IDEX_MemWrite), 
        .IDEX_MemtoReg(IDEX_MemtoReg), 
        .IDEX_RegWrite(IDEX_RegWrite), 
        .IDEX_ALUSrc(IDEX_ALUSrc),
        .IDEX_ALUOp(IDEX_ALUOp),
        .IDEX_Funct(IDEX_Funct), 
        .IDEX_RS1(IDEX_RS1), 
        .IDEX_RS2(IDEX_RS2), 
        .IDEX_RD(IDEX_RD),
        .IDEX_PC_Out(IDEX_PC_Out), 
        .IDEX_ReadData1(IDEX_ReadData1), 
        .IDEX_ReadData2(IDEX_ReadData2), 
        .IDEX_Imm(IDEX_Imm));
    
    // EX/MEM // 
    ADDER add2(.p(IDEX_PC_Out), 
        .q(IDEX_Imm << 1), 
        .out(Adder2Out));
       
       //forward A condition 
    Mux_3x1 mux1(.a(IDEX_ReadData1),
                 .b(WriteData),
                 .c(EM_Result),
                 .sel(ForwardA),
                 .out(mux1out));
       //forward B condition
    Mux_3x1 mux2(.a(IDEX_ReadData2),
                 .b(WriteData),
                 .c(EM_Result),
                 .sel(ForwardB),
                 .out(mux2out));
        
        //ALU b selection            
    Mux_2x1 muxmid(.A(mux2out), 
        .B(IDEX_Imm), 
        .SEL(IDEX_ALUSrc), 
        .Y(MuxmidOut));
         
    ALU_64 ALU(.A(mux1out), 
        .Out(WriteData), 
        .EM_Result(EM_Result), 
        .B(MuxmidOut), 
        .Forward_A(ForwardA),
        .Forward_B(ForwardB),

        .ALUSrc(ALUSrc), 
        .IDEX_Imm(IDEX_Imm), 
        .ALUOp(Operation),
        .Result(Result), 
        .Zero(Zero));
            
    ALU_Control AluC(.Aluop(IDEX_ALUOp), 
        .funct(IDEX_Funct), 
        .operation(Operation));
        
        
    //EX/MEM
    EX_MEM EM(.clk(clk), 
        .reset(reset), 
        .flush(flush),
        .Branch(IDEX_Branch), 
        .MemRead(IDEX_MemRead), 
        .MemWrite(IDEX_MemWrite),
        .MemtoReg(IDEX_MemtoReg), 
        .RegWrite(IDEX_RegWrite),
        .Zero(Zero),
        .addermuxselect(addermuxselect), 
        .RD(IDEX_RD), 
        .Adder2Out(Adder2Out), 
        .Result(Result), 
        .WriteData(WriteData), 
        .EM_Branch(EM_Branch), 
        .EM_MemRead(EM_MemRead), 
        .EM_MemWrite(EM_MemWrite), 
        .EM_MemtoReg(EM_MemtoReg), 
        .EM_RegWrite(EM_RegWrite), 
        .EM_Zero(EM_Zero), 
        .EM_addermuxselect(EM_addermuxselect), 
        .EM_RD(EM_RD), 
        .EM_Adder2Out(EM_Adder2Out), 
        .EM_Result(EM_Result), 
        .EM_WriteData(EM_WriteData));
        
        // Stage 4 - Memory Access // 
    assign sel_Branch = EM_Branch && EM_addermuxselect;
    DATA_Memory DM(.writeData(EM_WriteData),
        .address(EM_Result),
        .MemWrite(EM_MemWrite),
        .clk(clk), 
        .MemRead(EM_MemRead),
        .read_data(Read_Data));
        
    // MEM/WB //
    Mem_WB MW(.clk(clk), 
        .reset(reset), 
        .MemtoReg(EM_MemtoReg), 
        .RegWrite(EM_RegWrite), 
        .RD(EM_RD), 
        .EM_Result(EM_Result), 
        .Read_Data(Read_Data), 
        .MW_MemtoReg(MW_MemtoReg), 
        .MW_RegWrite(MW_RegWrite), 
        .MW_RD(MW_RD), 
        .MW_Result(MW_Result), 
        .MW_Read_Data(MW_Read_Data));
    
    Mux_2x1 muxlast(.A(MW_Read_Data), 
        .B(MW_Result), 
        .SEL(MW_MemtoReg), 
        .Y(WriteData));
    
    ForwardingUnit fu(.MW_RegWrite(MW_RegWrite),
                      .MW_RD(MW_RD), 
                      .EM_RD(EM_RD),  
                      .IDEX_RS1(IDEX_RS1), 
                      .IDEX_RS2(IDEX_RS2), 
                      .EM_RegWrite(EM_RegWrite),
                      .Forward_A(ForwardA),
                      .Forward_B(ForwardB));
        
    Branching_Unit bu(.funct3(Funct3), 
        .readData1(ReadData1), 
        .b(ReadData2), 
        .addermuxselect(addermuxselect));
        
        
endmodule 

