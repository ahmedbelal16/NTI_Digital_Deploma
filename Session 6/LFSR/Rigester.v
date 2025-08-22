module Register(d,rstn,clk,q,qbar);

input d,rstn,clk ;
output reg q,qbar ;

always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        q <= 1'b0 ;
        qbar <= 1'b1 ;
    end
    else begin
        q <= d ;
        qbar <= ~d ;
    end
end
    
endmodule

