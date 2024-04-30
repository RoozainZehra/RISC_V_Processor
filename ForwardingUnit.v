`timescale 1ns / 1ps

module ForwardingUnit(
    input MW_RegWrite,
    input [4:0] MW_RD,
    input [4:0] EM_RD,
    input [4:0] IDEX_RS1,
    input [4:0] IDEX_RS2,
    input EM_RegWrite,
    output reg [1:0] Forward_A,
    output reg [1:0] Forward_B
);
always @(*)
    begin
    	if ( (EM_RD == IDEX_RS1) & (EM_RegWrite != 0 & EM_RD !=0))
          begin
          	Forward_A = 2'b10;
          end
      	else
          begin 
            // Not condition for MEM hazard 
            if ((MW_RD == IDEX_RS1) & (MW_RegWrite != 0 & MW_RD != 0) & ~((EM_RD == IDEX_RS1) &(EM_RegWrite != 0 & EM_RD !=0)  )  )
              begin
                Forward_A = 2'b01;
              end
            else
              begin
                Forward_A = 2'b00;
              end
          end
      
        if ( (EM_RD == IDEX_RS2) & (EM_RegWrite != 0 & EM_RD !=0) )
          begin
            Forward_B = 2'b10;
          end
        else
          begin
            // Not condition for MEM Hazard 
            if ( (MW_RD == IDEX_RS2) & (MW_RegWrite != 0 & MW_RD != 0) &  ~((EM_RegWrite != 0 & EM_RD !=0 ) & (EM_RD == IDEX_RS2) ) )
              begin
                Forward_B = 2'b01;
              end
            else
              begin
                Forward_B = 2'b00;
              end
          end
    end

endmodule
