module LAB_1_mealy(level,clk,tick,rst);

parameter ZERO = 1'b0 ;
parameter ONE = 1'b1 ;

input level,clk,rst ;
output reg tick ;

reg cs,ns ;

always @(posedge clk or posedge rst) begin
    if(rst)
        cs <= ZERO ;
    else
        cs <= ns ;
end

always @(*) begin
    
    case (cs)
        
        ZERO: begin
            if(level)
                ns = ONE ;
            else
                ns = ZERO ;
        end

        ONE: ns = ZERO ;

    endcase
end

always @(*) begin
    
    if (cs ==  ZERO && level)
        tick = 1 ;
    else
        tick = 0 ;
end

endmodule
