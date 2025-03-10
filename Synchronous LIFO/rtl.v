module syn_lifo #(parameter depth = 16, width = 8)
  (clk,rst,we,re,din,dout,full,empty);
  input clk,rst,we,re;
  input [width-1:0]din;
  output reg [width-1:0]dout ;
  output reg full,empty;
  
  integer i;
  
  //pointer
  reg [$clog2(depth):0]ptr;
  
  //memory
  reg [width-1:0]mem[depth];
  
  //pointer increment
  always@(posedge clk) begin
    if(rst)
    	ptr<=0;
    else if(we && !full)
      	ptr<= ptr+1;
    else if(re && !empty)
      	ptr<= ptr-1;
  end
  
  //write
  always@(posedge clk) 
    if(rst)
      for(i = 0;i<depth;i = i+1)
        mem[i] = 0;
  	else if(we && !full)
      mem[ptr]  = din;
  
  //read
  always@(posedge clk) 
    if(rst)
      dout <= 0;
  	else if(re && !empty)
      dout <=mem[ptr-1] ;
  
  assign full = (ptr[$clog2(depth)] == 1) ? 1'b1:1'b0;
  assign empty = (ptr == 0)?1'b1 :1'b0;
endmodule
