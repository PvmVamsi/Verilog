module test;
  wire [7:0] dout;
  wire full,empty;
  reg clk,rst,we,re;
  reg [7:0] din;
  integer i ;
  
  syn_lifo #(16,8) rtl(clk,rst,we,re,din,dout,full,empty);
  
  initial begin
    	clk = 0;
    	forever #10 clk = ~clk;
  end
  initial begin
   
    	rst = 1;
    @(negedge clk)
    	rst = 0;

    for(i=0;i<17;i=i+1) begin
      @(negedge clk)
      din = i;
      we = 1;
      
    end
    	we = 0;
    for(i=0;i<17;i=i+1) begin
      @(negedge clk)
      re = 1;
    end
    #40 $finish;
  end
  
   initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
endmodule
