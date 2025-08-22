module mem_tb();
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 8;                       // 256 locations
 
    reg clk , rd , wr ;
    reg [ADDR_WIDTH-1:0]     addr       ;
    reg [DATA_WIDTH-1:0]     wdata      ;
    wire [DATA_WIDTH-1:0]    rdata      ;

    reg [DATA_WIDTH-1:0]     wdata_task      ;
        reg [ADDR_WIDTH-1:0]     addr_task       ;
 
    mem # (
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    )
    dut (
        .clk(clk),
        .rd(rd),
        .wr(wr),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata)
    );
 

initial begin
    clk = 0 ;
    forever begin
        #1 clk = ~clk ;
    end
end

    initial
    begin
 
        @(negedge clk)
        wr      <= 1;
        addr    <= 10;
        wdata   <= 32'hcafebabe;
        @(negedge clk)
        wr <= 1;
        addr <= 10;
        wdata <= 32'hcafebabe;

        wr_word (32'habcdefe , 8'h15) ;
        rd_word (8'h15) ;
        $stop ;
    end
 
    task wr_word (input wdata_task , input addr_task);
        begin
            wr <= 1 ;
            rd <= 0 ;
            addr <= addr_task ;
            wdata <= wdata_task ;
            @(negedge clk);

        end
    endtask
 
    task rd_word (input addr_task);
        begin
            wr <= 0 ;
            rd <= 1 ;
            addr <= addr_task ;
            @(negedge clk);
        end
    endtask


endmodule