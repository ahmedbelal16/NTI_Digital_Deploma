module LFSR_tb();
    

reg clk_tb,arst_n_tb,en_tb,si_tb ;
wire q_tb ;

LFSR tb (clk_tb,arst_n_tb,en_tb,si_tb,q_tb);

initial begin
    clk_tb = 0 ;
    forever begin
        #1 clk_tb = ~clk_tb ;
    end
end

initial begin
    arst_n_tb = 0 ;

    @(negedge clk_tb);
    arst_n_tb = 1 ;

    si_tb = 1 ; @(negedge clk_tb);

    en_tb = 0 ;
    repeat (20) begin
        si_tb = ~ si_tb ;
        @(negedge clk_tb);
    end

    en_tb = 1 ;
    repeat (10) begin
        @(negedge clk_tb);
    end

$stop ;
end


endmodule