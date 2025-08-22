module Seq_Detector_tb();

parameter S0 = 3'b000 ;
parameter S1 = 3'b001 ;
parameter S2 = 3'b010 ;
parameter S3 = 3'b011 ;
parameter S4 = 3'b100 ;
parameter S5 = 3'b101 ;
parameter S6 = 3'b110 ;

reg x_tb,clk_tb,rst_tb ;
wire y_tb ;

// Moore_Over Moore_tb (x_tb,clk_tb,rst_tb,y_tb);

// Moore_Non_Over Moore_Non_tb (x_tb,clk_tb,rst_tb,y_tb);

Mealy_Over Mealy_tb (x_tb,clk_tb,rst_tb,y_tb);

// Mealy_Non_Over Mealy_Non_tb (x_tb,clk_tb,rst_tb,y_tb);

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

    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;          //y=1
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;          //y=1
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 0 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 1 ;
    @(negedge clk_tb);
    x_tb = 1 ;

$stop;

end



endmodule