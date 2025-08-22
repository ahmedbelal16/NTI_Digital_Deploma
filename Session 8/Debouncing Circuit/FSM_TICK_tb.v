module FSM_TICK_tb();
    
parameter ZERO = 3'b000 ;
parameter WAIT1_1 = 3'b001 ;
parameter WAIT1_2 = 3'b010 ;
parameter WAIT1_3 = 3'b011 ;
parameter WAIT0_3 = 3'b100 ;
parameter WAIT0_2 = 3'b101 ;
parameter WAIT0_1 = 3'b110 ;
parameter ONE = 3'b111 ;

reg sw_tb,clk_tb,rst_tb ;
wire db_tb ;

FSM_TICK tb (sw_tb,clk_tb,rst_tb,db_tb);

initial begin
    clk_tb = 0 ;
    forever begin
        #10 clk_tb = ~clk_tb ;
    end
end

initial begin
    rst_tb = 1 ;

    @(negedge clk_tb);
    rst_tb = 0 ;

    sw_tb = 1 ;
    #100 ;
    sw_tb = 0 ;
    #100;    
    sw_tb = 1 ;
    #100 ;
    sw_tb = 0 ;
    #100;  
    sw_tb = 1 ;
    #100 ;
    sw_tb = 0 ;
    #100;    
    sw_tb = 1 ;
    #100 ;
    sw_tb = 0 ;
    #100; 

    sw_tb = 1 ;
    #31000000 ;
    sw_tb = 0 ;
    #31000000

$stop ;

end



endmodule