module seven_seg(a,o);
	input [3:0]a;
	output reg [6:0]o;
	
	always@(*)
		case(a)
		4'd0 : o = 7'b1111110;
		4'd1 : o = 7'b0110000;
		4'd2 : o = 7'b1101101;
		4'd3 : o = 7'b1111001;
		4'd4 : o = 7'b0110011;
		4'd5 : o = 7'b1011011;
		4'd6 : o = 7'b1011111;
		4'd7 : o = 7'b1110000;
		4'd8 : o = 7'b1111111;
		4'd9 : o = 7'b1111011;
		default : o = 7'bxxxxxxx;
		endcase
endmodule
module clock_time(clk,rst,h1,h0,m1,m0);
	input clk,rst;
	output reg [3:0] h1,h0,m1,m0;
	
	always@(posedge clk)
		if(rst)
			m0 <= 0;
		else 
			if(m0 == 9)
				m0 <= 0;
			else
				m0 <= m0 +1;
	always@(posedge clk)
		if(rst)
			m1 <= 0;
		else 
			if(m0 == 9)
			    if(m1 == 5)
				m1 <= 0;
			    else
				m1 <= m1 +1;
	 

	always@(posedge clk)
		if(rst)
			{h1,h0} <= 0;
		else 
			if( m0 == 9 && m1 == 5)
				if({h1,h0} == 8'd23)
					{h1,h0} <= 0;
			else
              if(h0 == 9) begin
                 h0<=0;
                 h1<= h1 +1;
              end
  			else
				h0 <= h0 +1'b1;

endmodule	

module sev_clock(clk,rst,oh1,oh0,om1,om0);
  input clk,rst;
  output [6:0]oh1,oh0,om1,om0;
  reg [3:0] h1,h0,m1,m0;
  clock_time dut (clk,rst,h1,h0,m1,m0);
  
  seven_seg hr1(h1,oh1);
  seven_seg hr0(h0,oh0);
  seven_seg mi1(m1,om1);
  seven_seg mi0(m0,om0);
endmodule
  
  
