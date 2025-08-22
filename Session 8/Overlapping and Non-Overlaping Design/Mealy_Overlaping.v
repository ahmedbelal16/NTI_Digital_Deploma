module Mealy_Over(x,clk,rst,y);
    
parameter S0 = 3'b000 ;
parameter S1 = 3'b001 ;
parameter S2 = 3'b010 ;
parameter S3 = 3'b011 ;
parameter S4 = 3'b100 ;
parameter S5 = 3'b101 ;
parameter S6 = 3'b110 ;

input x,clk,rst ;
output y ;

reg [2:0] cs,ns ;

always @(posedge clk or posedge rst) begin
    
    if (rst)
        cs <= S0 ;
    else
        cs <= ns ;
end

always @(*) begin
    
    case (cs)
        
        S0: begin
            if (x)
                ns = S1 ;
            else
                ns = S0 ;
        end

        S1: begin
            if (x)
                ns = S2 ;
            else
                ns = S0 ;
        end     

        S2: begin
            if (x)
                ns = S2 ;
            else
                ns = S3 ;
        end

        S3: begin
            if (x)
                ns = S4 ;
            else
                ns = S0 ;
        end

        S4: begin
            if (x)
                ns = S2 ;
            else
                ns = S5 ;
        end

        S5: begin
            if (x)
                ns = S2 ;
            else
                ns = S0 ;
        end


        default: ns = S0 ;
            
    endcase
end

assign y = (cs == S5 && x) ? 1 : 0 ;

endmodule