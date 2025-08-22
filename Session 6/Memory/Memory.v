module mem #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8                      // 256 locations
)(
    input  wire                     clk     ,   //! sys clk
    input  wire                     rd      ,
    input  wire                     wr      ,
    input  wire [ADDR_WIDTH-1:0]    addr    ,
    input  wire [DATA_WIDTH-1:0]    wdata   ,
    output reg  [DATA_WIDTH-1:0]    rdata
);
 
    // Memory array
    reg [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];
 
    //Initialize memory from file
    initial begin
        $readmemh("mem.txt", mem);       //$readmemb()
    end
 
    always @(posedge clk) begin
        if (wr) begin
            mem[addr] <= wdata;
        end else if (rd) begin
            rdata <= mem[addr];
        end
    end
 
endmodule
 
 
 