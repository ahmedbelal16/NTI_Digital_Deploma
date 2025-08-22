module controller(zero,opcode,phase,sel,rd,ld_ir,halt,inc_pc,ld_ac,wr,ld_pc,data_e);

input zero ;
input [2:0] phase,opcode ;
output reg sel,rd,ld_ir,halt,inc_pc,ld_ac,wr,ld_pc,data_e ;

wire HALT,ALUOP,SKZ,STO,JMP ;

assign HALT = (opcode == 3'b000) ? 1 : 0 ;
assign ALUOP = (opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101) ? 1 : 0;
assign SKZ = (opcode == 3'b001) ? 1 : 0 ;
assign STO = (opcode == 3'b110) ? 1 : 0 ;
assign JMP = (opcode == 3'b111) ? 1 : 0 ;

always @(*) begin
    
    case (phase)
        
        3'b000:begin
            sel = 1 ;
            rd = 0 ;
            ld_ir = 0 ;
            halt = 0 ;
            inc_pc = 0 ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = 0 ;
            data_e = 0 ;
            end

        3'b001:begin
            sel = 1 ;
            rd = 1 ;
            ld_ir = 0 ;
            halt = 0 ;
            inc_pc = 0 ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = 0 ;
            data_e = 0 ;
            end

        3'b010:begin
            sel = 1 ;
            rd = 1 ;
            ld_ir = 1 ;
            halt = 0 ;
            inc_pc = 0 ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = 0 ;
            data_e = 0 ;
            end

        3'b011:begin
            sel = 1 ;
            rd = 1 ;
            ld_ir = 1 ;
            halt = 0 ;
            inc_pc = 0 ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = 0 ;
            data_e = 0 ;
            end

        3'b100:begin
            sel = 0 ;
            rd = 0 ;
            ld_ir = 0 ;
            halt = HALT ;
            inc_pc = 1 ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = 0 ;
            data_e = 0 ;
            end

        3'b101:begin
            sel = 0 ;
            rd = ALUOP ;
            ld_ir = 0 ;
            halt = 0 ;
            inc_pc = 0 ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = 0 ;
            data_e = 0 ;
            end

        3'b110:begin
            sel = 0 ;
            rd = ALUOP ;
            ld_ir = 0 ;
            halt = 0 ;
            inc_pc = SKZ && zero ;
            ld_ac = 0 ;
            wr = 0 ;
            ld_pc = JMP ;
            data_e = STO ;
            end

        3'b111:begin
            sel = 0 ;
            rd = ALUOP ;
            ld_ir = 0 ;
            halt = 0 ;
            inc_pc = 0 ;
            ld_ac = ALUOP ;
            wr = STO ;
            ld_pc = JMP ;
            data_e = STO ;
            end

    endcase


end



endmodule