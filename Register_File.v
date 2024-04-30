module Register_File(
  input clk,
  input reset,
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [63:0] writedata,
  input reg_write,
  output [63:0] readdata1,
  output [63:0] readdata2
  );
 
    reg [63:0] Registers [31:0]; //array of all registers
    
    initial begin //assigning test values to the registers
        Registers[5'd0] = 64'd1;
        Registers[5'd1] = 64'd2;
        Registers[5'd2] = 64'd3;
        Registers[5'd3] = 64'd4;
        Registers[5'd4] = 64'd5;
        Registers[5'd5] = 64'd6;
        Registers[5'd6] = 64'd7;
        Registers[5'd7] = 64'd8;
        Registers[5'd8] = 64'd9;
        Registers[5'd9] = 64'd10;
        Registers[5'd10] = 64'd11;
        Registers[5'd11] = 64'd12;
        Registers[5'd12] = 64'd13;
        Registers[5'd13] = 64'd14;
        Registers[5'd14] = 64'd15;
        Registers[5'd15] = 64'd16;
        Registers[5'd16] = 64'd17;
        Registers[5'd17] = 64'd18;
        Registers[5'd18] = 64'd19;
        Registers[5'd19] = 64'd20;
        Registers[5'd20] = 64'd21;
        Registers[5'd21] = 64'd22;
        Registers[5'd22] = 64'd23;
        Registers[5'd23] = 64'd24;
        Registers[5'd24] = 64'd25;
        Registers[5'd25] = 64'd26;
        Registers[5'd26] = 64'd27;
        Registers[5'd27] = 64'd28;
        Registers[5'd28] = 64'd29;
        Registers[5'd29] = 64'd30;
        Registers[5'd30] = 64'd31;
        Registers[5'd31] = 64'd32; 
    end
    
    //output assignment
    assign readdata1 = reset ? 64'b0 : Registers[rs1]; 
    assign readdata2 = reset ? 64'b0 : Registers[rs2];
    
    //writing data on RD
    always @ ( posedge clk) begin
        if (reg_write) begin
            Registers[rd] <= writedata;
        end 
    end  

endmodule
