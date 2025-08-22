module LAB_9(cnt_in,cnt_out,enab,load,clk,rst);

input [4:0] cnt_in ;
input load,clk,rst,enab ;

output reg [4:0] cnt_out ;
reg [4:0] cout ;

always @(posedge clk or posedge rst) begin
    
    if (rst)
        cnt_out <= 0 ;
    else
        cnt_out <= cout ;

end

always @(*) begin
    
    if (load)
            cout <= cnt_in ;
    else if (enab) begin
            cout <= cnt_out + 1 ;
        end

end

endmodule