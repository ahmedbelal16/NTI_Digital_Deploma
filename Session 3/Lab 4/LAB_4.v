module LAB_4(data_in,data_out,data_en);
    
parameter WIDTH = 8 ;

input data_en ;
input [WIDTH-1:0] data_in ;

output [WIDTH-1:0] data_out ;

    assign data_out = (data_en) ? data_in : {WIDTH{1'bz}} ;


endmodule