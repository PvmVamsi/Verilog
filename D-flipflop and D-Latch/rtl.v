module dff_dl(clk,in,dff_out,dl_out);
  	input clk;
  	input in;
  	output reg dff_out,dl_out;
  
  always@(*) begin
    if(clk)
   		 dl_out = in;
  end
  
  always @(posedge clk) begin
    	dff_out <= in;
  end
endmodule
    
