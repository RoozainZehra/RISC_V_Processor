module Hazard_Detection(
    input [4:0] RS1, 
    input [4:0] RS2,
    input [4:0] IDEX_RD,
    input IDEX_MemRead,
    output reg stall 
    );

    always @(*) begin
        if (IDEX_MemRead && (IDEX_RD == RS1 || IDEX_RD == RS2)) begin
            stall = 1; 
        end
        else begin
            stall = 0;  
        end
    end
endmodule
