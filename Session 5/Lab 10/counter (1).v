`timescale 1ns / 10ps

module counter 
#(parameter WIDTH = 5)
(
  input wire                clk,
  input wire                rst,
  input wire                enab,
  input wire                load,
  input wire  [WIDTH-1 : 0] cnt_in,
  
  output reg  [WIDTH-1 : 0] cnt_out 
);

  reg [WIDTH-1 : 0] cnt_reg;
  
  always @(posedge clk or posedge rst)
    begin
	  if(rst)
	    cnt_out <= 'b0;
	  else 
	    cnt_out <= cnt_reg;
	end

  always@(*)
    begin
	  if(rst)
	    cnt_reg = 'b0;
	  
	  else if (load)
	    cnt_reg = cnt_in;
	  
	  else if (enab)
	    cnt_reg = cnt_reg + 1'b1;
	
	  else cnt_reg = cnt_out;
	  
	end

endmodule