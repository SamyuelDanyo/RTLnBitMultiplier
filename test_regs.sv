 module test_regs #(parameter n=8);
 logic clock, resetout, C, ready;
 logic [n-1:0] Qin, Sum;
 logic [2*n-1:0] AQ;
 initial
  begin
  clock = 1'b0; 
  forever #1s clock = ~clock; 
 end
 regs r(.*);
 initial
  begin
	resetout = '1;
	Qin = 8'b00000111;
	C = '1;
	Sum = 8'b00000111;
	ready = '1;
	#1s resetout = '1;
	#1s resetout = '0;
	#2s ready = '0;
end
endmodule