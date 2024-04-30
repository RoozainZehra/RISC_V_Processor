`timescale 1ns / 1ps

module Branching_Unit(
    input [2:0] funct3,
    input [63:0] readData1,
    input [63:0] b,
    output reg addermuxselect
);
    initial
    begin
      addermuxselect = 1'b0;
    end
  
    always @(*)
	 begin
      case (funct3)
        3'b000: //beq
          begin
            if (readData1 == b)
              addermuxselect = 1'b1;
            else
              addermuxselect = 1'b0;
            end
         3'b100: //blt
    		begin
              if (readData1 < b)
              addermuxselect = 1'b1;
            else
              addermuxselect = 1'b0;
            end
        3'b101: //bge
          begin
            if (readData1 >= b)
          	addermuxselect = 1'b1;
           else
              addermuxselect = 1'b0;
          end    
      endcase
     end

endmodule
