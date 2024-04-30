module DATA_Memory
  (input [63:0] writeData,
   input [63:0] address,
   input MemWrite, clk, MemRead,
   output reg [63:0] read_data);
  
    reg [7:0] Mem [127:0];
    initial begin
        Mem[0] = 8'd1;
        Mem[1] = 8'd2;
        Mem[2] = 8'd3;
        Mem[3] = 8'd4;
        Mem[4] = 8'd5;
        Mem[5] = 8'd6;
        Mem[6] = 8'd7;
        Mem[7] = 8'd8;
        Mem[8] = 8'd9;
        Mem[9] = 8'd10;
        Mem[10] = 8'd11;
        Mem[11] = 8'd12;
        Mem[12] = 8'd13;
        Mem[13] = 8'd14;
        Mem[14] = 8'd15;
        Mem[15] = 8'd16;
        Mem[16] = 8'd17;
        Mem[17] = 8'd18;
        Mem[18] = 8'd19;
        Mem[19] = 8'd20;
        Mem[20] = 8'd21;
        Mem[21] = 8'd22;
        Mem[22] = 8'd23;
        Mem[23] = 8'd24;
        Mem[24] = 8'd25;
        Mem[25] = 8'd26;
        Mem[26] = 8'd27;
        Mem[27] = 8'd28;
        Mem[28] = 8'd29;
        Mem[29] = 8'd30;
        Mem[30] = 8'd31;
        Mem[31] = 8'd32;
        Mem[32] = 8'd33;
        Mem[33] = 8'd34;
        Mem[34] = 8'd35;
        Mem[35] = 8'd36;
        Mem[36] = 8'd37;
        Mem[37] = 8'd38;
        Mem[38] = 8'd39;
        Mem[39] = 8'd40;
        Mem[40] = 8'd41;
        Mem[41] = 8'd42;
        Mem[42] = 8'd43;
        Mem[43] = 8'd44;
        Mem[44] = 8'd45;
        Mem[45] = 8'd46;
        Mem[46] = 8'd47;
        Mem[47] = 8'd48;
        Mem[48] = 8'd49;
        Mem[49] = 8'd50;
        Mem[50] = 8'd51;
        Mem[51] = 8'd52;
        Mem[52] = 8'd53;
        Mem[53] = 8'd54;
        Mem[54] = 8'd55;
        Mem[55] = 8'd56;
        Mem[56] = 8'd57;
        Mem[57] = 8'd58;
        Mem[58] = 8'd59;
        Mem[59] = 8'd60;
        Mem[60] = 8'd61;
        Mem[61] = 8'd62;
        Mem[62] = 8'd63;
        Mem[63] = 8'd64;
        Mem[64] = 8'd65;
        Mem[65] = 8'd66;
        Mem[66] = 8'd67;
        Mem[67] = 8'd68;
        Mem[68] = 8'd69;
        Mem[69] = 8'd70;
        Mem[70] = 8'd71;
        Mem[71] = 8'd72;
        Mem[72] = 8'd73;
        Mem[73] = 8'd74;
        Mem[74] = 8'd75;
        Mem[75] = 8'd76;
        Mem[76] = 8'd77;
        Mem[77] = 8'd78;
        Mem[78] = 8'd79;
        Mem[79] = 8'd80;
        Mem[80] = 8'd81;
        Mem[81] = 8'd82;
        Mem[82] = 8'd83;
        Mem[83] = 8'd84;
        Mem[84] = 8'd85;
        Mem[85] = 8'd86;
        Mem[86] = 8'd87;
        Mem[87] = 8'd88;
        Mem[88] = 8'd89;
        Mem[89] = 8'd90;
        Mem[90] = 8'd91;
        Mem[91] = 8'd92;
        Mem[92] = 8'd93;
        Mem[93] = 8'd94;
        Mem[94] = 8'd95;
        Mem[95] = 8'd96;
        Mem[96] = 8'd97;
        Mem[97] = 8'd98;
        Mem[98] = 8'd99;
        Mem[99] = 8'd100;
        Mem[100] = 8'd101;
        Mem[101] = 8'd102;
        Mem[102] = 8'd103;
        Mem[103] = 8'd104;
        Mem[104] = 8'd105;
        Mem[105] = 8'd106;
        Mem[106] = 8'd107;
        Mem[107] = 8'd108;
        Mem[108] = 8'd109;
        Mem[109] = 8'd110;
        Mem[110] = 8'd111;
        Mem[111] = 8'd112;
        Mem[112] = 8'd113;
        Mem[113] = 8'd114;
        Mem[114] = 8'd115;
        Mem[115] = 8'd116;
        Mem[116] = 8'd117;
        Mem[117] = 8'd118;
        Mem[118] = 8'd119;
        Mem[119] = 8'd120;
        Mem[120] = 8'd121;
        Mem[121] = 8'd122;
        Mem[122] = 8'd123;
        Mem[123] = 8'd124;
        Mem[124] = 8'd125;
        Mem[125] = 8'd126;
        Mem[126] = 8'd127;
        Mem[127] = 8'd128;
        
    end
    
    always @ (posedge clk) begin
        //write data in memory
        if (MemWrite == 1 & MemRead == 0) begin 
            Mem[address] <= writeData[7:0];
            Mem[address + 1] <= writeData[15:8];
            Mem[address + 2] <= writeData[23:16];
            Mem[address + 3] <= writeData[31:24];
            Mem[address + 4] <= writeData[39:32];
            Mem[address + 5] <= writeData[47:40];
            Mem[address + 6] <= writeData[55:48];
            Mem[address + 7] <= writeData[63:56];
        end
    end
    
    always @ (*) begin
        //read data from memory
        if (MemRead == 1 & MemWrite == 0) begin
            read_data[7:0] <= Mem[address];
            read_data[15:8] <= Mem[address + 1];
            read_data[23:16] <= Mem[address + 2];
            read_data[31:24] <= Mem[address + 3];
            read_data[39:32] <= Mem[address + 4];
            read_data[47:40] <= Mem[address + 5];
            read_data[55:48] <= Mem[address + 6];
            read_data[63:56] <= Mem[address + 7];            
        end
    end
    
endmodule
