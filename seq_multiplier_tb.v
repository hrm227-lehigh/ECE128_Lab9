module seq_mult_tb;
reg clk, rst;
reg [3:0] a, b;
wire [7:0] p;

seq_mult uut(.clk(clk),.rst(rst), .a(a), .b(b), .p(p));

always begin
    clk = 1'b1;
    #1;
    clk = 1'b0;
    #1;
end

initial begin
	rst = 1; a = 4'b0000; b = 4'b0000;
	#20 rst = 0; a = 4'b0000; b = 4'b0000;
	#20 a = 4'b1010; b = 4'b0011;
	#20 a = 4'b0001; b = 4'b0011;
	#20 a = 4'b0101; b = 4'b0011;
	#20 a = 4'b1111; b = 4'b0101;
	#20 a = 4'b0100; b = 4'b0101;
	#20 a = 4'b1001; b = 4'b0101;
	#20 a = 4'b0101; b = 4'b1100;
	#30 $stop;
end

endmodule