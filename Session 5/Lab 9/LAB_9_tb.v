module LAB_9_tb();
    
reg [4:0] cnt_in_tb ;
reg load_tb,clk_tb,rst_tb,enab_tb ;

wire [4:0] cnt_out_tb ;

LAB_9 tb (cnt_in_tb,cnt_out_tb,enab_tb,load_tb,clk_tb,rst_tb);

initial begin
    clk_tb = 0 ;
    forever begin
        #1 clk_tb = ~clk_tb ;
    end
end

initial begin
    rst_tb = 1;

    @(negedge clk_tb);
    rst_tb = 0 ;

    repeat(30) begin
        cnt_in_tb = $random ;
        load_tb = $random ;
        enab_tb = $random ;
        @(negedge clk_tb);
    end
$stop ;
end

endmodule