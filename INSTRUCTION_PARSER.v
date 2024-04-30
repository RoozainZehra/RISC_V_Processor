`timescale 1ns / 1ps

module INSTRUCTION_PARSER(
  input [31:0] instruction,
  output reg [6:0] opcode,
  output reg [4:0] rd,
  output reg [2:0] funct3,
  output reg [4:0] rs1,
  output reg [4:0] rs2,
  output reg [6:0] funct7
);
    reg [11:0] immediate;

  always @(*) begin
    opcode = instruction[6:0];
    case(opcode)
      7'b0000011, 7'b0010011, 7'b1100111: begin // I-type instructions
        rd = instruction[11:7];
        funct3 = instruction[14:12];
        rs1 = instruction[19:15];
      end
      7'b0110011: begin // R-type instructions
        rd = instruction[11:7];
        funct3 = instruction[14:12];
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
        funct7 = instruction[31:25];
      end
      7'b1100011: begin // SB-type instructions
        funct3 = instruction[14:12];
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
      end
      7'b0100011: begin // S-type instructions
        funct3 = instruction[14:12];
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
      end
      7'b1101111: begin // UJ-type instructions
        rd = instruction[11:7];
      end
      // Add cases for other instruction types as needed
      default: begin
        // Handle unsupported or unrecognized instructions
        rd = 0;
        funct3 = 0;
        rs1 = 0;
        rs2 = 0;
        funct7 = 0;
      end
    endcase
  end

endmodule
