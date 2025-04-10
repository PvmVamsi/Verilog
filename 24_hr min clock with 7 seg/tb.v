// Code your testbench here
// or browse Examples
module tb();
  reg clk,rst;
  //wire [3:0] h1,h0,m1,m0;
  wire [6:0] oh1,oh0,om1,om0;
  //clock_time dut(clk,rst,h1,h0,m1,m0);
  sev_clock jja(clk,rst,oh1,oh0,om1,om0);
  
  initial begin 
    clk =0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #2;
    rst =0;
    #10 $finish;
  end
  
  initial begin 
    //$monitor (" h1h0:m1m0 = %0d %0d : %0d %0d",h1,h0,m1,m0);
    $monitor (" h1h0:m1m0 = %0b %0b : %0b %0b",oh1,oh0,om1,om0);
  end
endmodule
  
