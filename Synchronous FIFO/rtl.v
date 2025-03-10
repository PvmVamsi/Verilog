module syn_fifo #(parameter depth = 16,width = 8) (clk,rst,we,re,din,dout,full,empty);
  input clk,rst,we,re;
  input [width-1 : 0] din;
  output full,empty;
  output reg[width-1 :0]dout;
  
  integer i;
  
  //write and read pointer
  reg [$clog2(depth):0]wptr,rptr;
  
  //meomory
  reg [width-1:0]mem[depth];
  
  //write and read pointer increment
  always@(posedge clk) begin
    if(rst)
      begin
        {wptr,rptr}<=0;
      end
    else if(we && !full)
      	wptr<= wptr+1;
    else if(re && !empty)
      	rptr<= rptr+1;
  end
  
  //write operation
  always@(posedge clk) begin
    if(rst)
      for(i = 0;i<depth;i=i+1)
        mem[i] <= 0;
    else if(we && !full)
      mem[wptr] <= din;
  end
  
  //read operation
  always@(posedge clk) begin
    if(rst)
      dout <= 0;
    else if(re && !empty)
      dout <= mem[rptr];
  end
  
  //full condition something like circular buffer
  assign full = (wptr[$clog2(depth)] != rptr[$clog2(depth)] && 
                 wptr[$clog2(depth)-1:0] == rptr[$clog2(depth)-1:0])
    				? 1'b1 : 1'b0;
  
  //full condition for normal fifo
  //assign full = (wptr +1 == rptr) ? 1'b1 : 1'b0;
  
  
  //empty condition
  assign empty = (wptr == rptr) ? 1'b1 :1'b0;
  
endmodule
