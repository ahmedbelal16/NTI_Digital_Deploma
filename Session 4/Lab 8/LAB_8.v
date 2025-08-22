module mem(addr,data,clk,rd,wr);

parameter AWIDTH = 5 ;
parameter DWIDTH = 8 ;

input [AWIDTH-1:0] addr ;
input clk,wr,rd ;

inout reg [DWIDTH-1:0] data ;

always @(posedge clk) begin
    
    if (wr) begin
        addr <= data ;
        rd <= 0 ;
    end

end

generate;
    if (rd) begin
        data = addr ;
        wr = 0 ;
    end
endgenerate
    
endmodule