`timescale 1ns / 1ps

module PC(
    input clk,
    input reset,
    input stall,
    input [63:0] PC_In,
    output reg [63:0] PC_Out
    );
    
    always @ (reset) begin
        PC_Out <= 64'b0;
    end
    
	always @ (posedge clk & !reset)

	   if (stall == 1'b1)begin 
	       PC_Out <= PC_Out;
	   end
	   else begin 
	       PC_Out <= PC_In;
	   end
   
endmodule
