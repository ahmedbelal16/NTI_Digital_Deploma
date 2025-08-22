module FSM_TICK(sw,clk,rst,db);
    
parameter ZERO = 3'b000 ;
parameter WAIT1_1 = 3'b001 ;
parameter WAIT1_2 = 3'b010 ;
parameter WAIT1_3 = 3'b011 ;
parameter WAIT0_3 = 3'b100 ;
parameter WAIT0_2 = 3'b101 ;
parameter WAIT0_1 = 3'b110 ;
parameter ONE = 3'b111 ;

input  sw,clk,rst ;
output db ;

reg m_tick ;
reg [2:0] cs,ns ;
reg [19:0] counter ;

always @(posedge clk or posedge rst) begin
    if (rst)
        cs <= ZERO ;
    else
        cs <= ns ;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        m_tick <= 0;
    end else begin
        if (counter == 499999 ) begin
            counter <= 0;
            m_tick <= 1;
        end 
        else begin
            counter <= counter + 1;
            m_tick <= 0;
        end
    end
end

always @(*) begin

    case (cs)
        
        ZERO: begin
            if (sw)
                ns = WAIT1_1 ;
            else
                ns = ZERO ;
        end

        WAIT1_1: begin
            if (sw && m_tick)
                ns = WAIT1_2 ;
            else if (sw && ~m_tick)
                ns = WAIT1_1 ;
            else
                ns = ZERO ;
        end

        WAIT1_2: begin
            if (sw && m_tick)
                ns = WAIT1_3 ;
            else if (sw && ~m_tick)
                ns = WAIT1_2 ;
            else
                ns = ZERO ;
        end

        WAIT1_3: begin
            if (sw && m_tick)
                ns = ONE ;
            else if (sw && ~m_tick)
                ns = WAIT1_3 ;
            else
                ns = ZERO ;
        end

        ONE: begin
            if (~sw)
                ns = WAIT0_1 ;
            else
                ns = ONE ;
        end

        WAIT0_1: begin
            if (~sw && m_tick)
                ns = WAIT0_2 ;
            else if (~sw && ~m_tick)
                ns = WAIT0_1 ;
            else
                ns = ONE ;
        end

        WAIT0_2: begin
            if (~sw && m_tick)
                ns = WAIT0_3 ;
            else if (~sw && ~m_tick)
                ns = WAIT0_2 ;
            else
                ns = ONE ;
        end

        WAIT0_3: begin
            if (~sw && m_tick)
                ns = ZERO ;
            else if (~sw && ~m_tick)
                ns = WAIT0_3 ;
            else
                ns = ONE ;
        end

    endcase


end

assign db = ((cs == ONE) || (cs == WAIT0_1) || (cs == WAIT0_2) || (cs == WAIT0_3)) ? 1 : 0 ;

endmodule
