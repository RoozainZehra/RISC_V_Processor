module ALU_64(
    input [63:0] A,
    input [63:0] Out,
    input [63:0] EM_Result,
    input [63:0] B,
    input [1:0] Forward_A,
    input [1:0] Forward_B,
    input ALUSrc,
    input [63:0] IDEX_Imm,
    input [3:0] ALUOp,
    output reg [63:0] Result,
    output reg Zero
    );
    
    always @(*)
    begin
      case (ALUOp)
        4'b0000: Result = A & B;
        4'b0001: Result = A | B;
        4'b0010: Result = A + B;
        4'b0110: Result = A - B;
        4'b1100: Result = ~(A | B); //nor
      endcase
      if (Result == 0)
        Zero = 1;
      else
        Zero = 0;
    end

endmodule
