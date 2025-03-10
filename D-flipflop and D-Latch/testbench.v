module test;
  	wire dff_out,dl_out;
  	reg clk,in;
  dff_dl dd (clk,in,dff_out,dl_out);
  
  initial begin 
    	clk = 0;
    	forever clk = # 5 ~clk;
  end
  
  initial begin
    	in = 1;
    	#3;
    	in = 0;
    	#2;
    	in = 1;
    	#2;
    	in = 0;
    #2;
    	in = 1;
    #2;
    	in = 0;
    #2;
    in = 1;
    #2;
    in = 0;
    #2;

  end  
  initial #15 $finish;
  
   initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
endmodule
