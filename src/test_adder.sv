module test_adder #(parameter n = 8);
logic[n-1:0] A, M, Sum;
logic C, add;
adder Add(.*);
initial
	begin
		add='0;
		M = 8'b11111111;
		A = 8'b00000010;
		#1s add='1;
		
	end
endmodule