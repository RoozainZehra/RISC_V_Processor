module Instruction_Memory(
  input [63:0] inst_address,
  output reg [31:0] instruction
);
  
   reg [7:0] Mem [151:0];
    initial begin;
        {Mem[3], Mem[2], Mem[1], Mem[0]} = 32'h0;
        {Mem[7], Mem[6], Mem[5], Mem[4]} = 32'hff810113;
        {Mem[11], Mem[10], Mem[9], Mem[8]} = 32'h00a12223;
        {Mem[15], Mem[14], Mem[13], Mem[12]} = 32'h00b12023;
        {Mem[19], Mem[18], Mem[17], Mem[16]} = 32'h10000513;
        {Mem[23], Mem[22], Mem[21], Mem[20]} = 32'h00600593;
        {Mem[27], Mem[26], Mem[25], Mem[24]} = 32'h00400393;
        {Mem[31], Mem[30], Mem[29], Mem[28]} = 32'h00752023;
        {Mem[35], Mem[34], Mem[33], Mem[32]} = 32'h00500393;
        {Mem[39], Mem[38], Mem[37], Mem[36]} = 32'h00752223;
        {Mem[43], Mem[42], Mem[41], Mem[40]} = 32'h00100393;
        {Mem[47], Mem[46], Mem[45], Mem[44]} = 32'h00752423;
        {Mem[51], Mem[50], Mem[49], Mem[48]} = 32'hfff00293;
        {Mem[55], Mem[54], Mem[53], Mem[52]} = 32'h00000313;
        {Mem[59], Mem[58], Mem[57], Mem[56]} = 32'h04058a63;
        {Mem[63], Mem[62], Mem[61], Mem[60]} = 32'h004000ef;
        {Mem[67], Mem[66], Mem[65], Mem[64]} = 32'h04b2d663;
        {Mem[71], Mem[70], Mem[69], Mem[68]} = 32'h00128293;
        {Mem[75], Mem[74], Mem[73], Mem[72]} = 32'h004000ef;
        {Mem[79], Mem[78], Mem[77], Mem[76]} = 32'hfeb35ae3;
        {Mem[83], Mem[82], Mem[81], Mem[80]} = 32'h00229393;
        {Mem[87], Mem[86], Mem[85], Mem[84]} = 32'h007503b3;
        {Mem[91], Mem[90], Mem[89], Mem[88]} = 32'h0003ae03;
        {Mem[95], Mem[94], Mem[93], Mem[92]} = 32'h00231f13;
        {Mem[99], Mem[98], Mem[97], Mem[96]} = 32'h01e50f33;
        {Mem[103], Mem[102], Mem[101], Mem[100]} = 32'h000f2e83;
        {Mem[107], Mem[106], Mem[105], Mem[104]} = 32'h01de4663;
        {Mem[111], Mem[110], Mem[109], Mem[108]} = 32'h00130313;
        {Mem[115], Mem[114], Mem[113], Mem[112]} = 32'hfc000ee3;
        {Mem[119], Mem[118], Mem[117], Mem[116]} = 32'h000e0f93;
        {Mem[123], Mem[122], Mem[121], Mem[120]} = 32'h000e8e13;
        {Mem[127], Mem[126], Mem[125], Mem[124]} = 32'h000f8e93;
        {Mem[131], Mem[130], Mem[129], Mem[128]} = 32'h01c3a023;
        {Mem[135], Mem[134], Mem[133], Mem[132]} = 32'h01df2023;
        {Mem[139], Mem[138], Mem[137], Mem[136]} = 32'h00008067;
        {Mem[143], Mem[142], Mem[141], Mem[140]} = 32'h00012583;
        {Mem[147], Mem[146], Mem[145], Mem[144]} = 32'h00412503;
        {Mem[151], Mem[150], Mem[149], Mem[148]} = 32'h00810113;
        
    end
    
    always @ (inst_address) begin
        instruction[31:24] = Mem[inst_address + 3];
        instruction[23:16] = Mem[inst_address + 2];
        instruction[15:8] = Mem[inst_address + 1];
        instruction[7:0]= Mem[inst_address];
    end
  
endmodule
