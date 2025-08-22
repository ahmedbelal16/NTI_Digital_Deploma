`timescale 1ns/100ps ;
module LAB_1_moore_tb();
    
parameter ZERO = 2'b00 ;
parameter EDG = 2'b01 ;
parameter ONE = 2'b10 ;

reg level_tb,clk_tb,rst_tb ;
wire tick_tb ;

LAB_1_moore tb (level_tb,clk_tb,tick_tb,rst_tb);

initial begin
    clk_tb = 0 ;
    forever begin
        #1 clk_tb = ~clk_tb ;
    end
end

initial begin
    rst_tb = 1 ;

    @(negedge clk_tb);
    rst_tb = 0 ;

    level_tb = 0 ;
    @(negedge clk_tb);

    level_tb = 1 ;
    #2 ;

    level_tb = 0 ;
    #0.2 ;
    level_tb = 1 ;
    #0.2 ;
    level_tb = 0 ;
    repeat(5) @(negedge clk_tb);

$stop ;
end


endmodule