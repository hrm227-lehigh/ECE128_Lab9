module comb_mult_tb;
reg [3:0] a, b;
wire [7:0] p;

com_mult uut(.a(a), .b(b), .p(p));

initial begin
	a = 4'b0000; b = 4'b0000;
	#20 a = 4'b1010; b = 4'b0011;
	#20 a = 4'b0001; b = 4'b0011;
	#20 a = 4'b0101; b = 4'b0011;
	#20 a = 4'b1111; b = 4'b0101;
	#20 a = 4'b0100; b = 4'b0101;
	#20 a = 4'b1001; b = 4'b0101;
	#20 a = 4'b0101; b = 4'b1100;
	#20 $stop;
end

endmodule