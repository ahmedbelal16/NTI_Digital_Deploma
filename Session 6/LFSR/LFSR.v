module LFSR(clk,arst_n,en,si,q);
    
input clk,arst_n,en,si ;
output q ;

wire q1,qbar_1,q2,qbar_2,q3,qbar_3 ;
reg q_mux ;

Register first (q_mux,arst_n,clk,q1,qbar_1);

Register second (q1,arst_n,clk,q2,qbar_2);

Register third (q2,arst_n,clk,q3,qbar_3);

Register forth (q3,arst_n,clk,q,qbar_4);


always @(posedge clk or negedge arst_n) begin

    if (en == 0)
        q_mux <= si ;
    else
        q_mux <= q1 ^ q2 ;
end


endmodule