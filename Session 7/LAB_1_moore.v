module LAB_1_moore(level,clk,tick,rst);

parameter ZERO = 2'b00 ;
parameter EDG = 2'b01 ;
parameter ONE = 2'b10 ;

input level,clk,rst ;
output reg tick ;

reg [1:0] cs,ns ;

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
                ns = EDG ;
            else
                ns = ZERO ;
        end

        EDG: begin
            if(level)
                ns = ONE ;
            else
                ns = ZERO ;
        end

        ONE: ns = ZERO ;

    endcase
end

always @(*) begin
    
    if (cs ==  EDG)
        tick = 1 ;
    else
        tick = 0 ;
end

endmodule