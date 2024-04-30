`timescale 1ns / 1ps

module IMM_Data(
    input [31:0] instruction,
    output reg [63:0] imm_data
);
    reg [6:0] opcode;
    
    always @(*)
    begin
      opcode = instruction[6:0];
      case (instruction[6:5])
       2'b00: //I-type
          begin
            imm_data[11:0] = instruction[31:20];
            imm_data = {{52{imm_data[11]}},{imm_data[11:0]}};
          end
        2'b01:
          begin
            case (opcode)
                //S-type
               7'b0100011 : 
                begin 
                  imm_data[11:0] = {instruction[31:25], instruction[11:7]};
                  imm_data = {{52{imm_data[11]}},{imm_data[11:0]}};
                end
               default : 
                begin 
                  imm_data [11:0] = 12'b0;
                  imm_data = {{52{imm_data[11]}},{imm_data[11:0]}};
                end
            endcase
          end
        2'b11:
          begin
            case (opcode)
                7'b1100011 : 
                  begin
                   imm_data [11:0] = {instruction[12], instruction[10:5], instruction[4:1], instruction[11]};
                   imm_data = {{52{imm_data[11]}},{imm_data[11:0]}};
                  end
                7'b1101111 : 
                  begin 
                    imm_data [19:0] = {instruction[20], instruction[10:1], instruction[11], instruction[19:12]};
                    imm_data = {{44{imm_data[19]}},{imm_data[19:0]}};
                  end
            endcase
          end
      endcase
    end  


endmodule
