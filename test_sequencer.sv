 module test_sequencer;
 logic start, Q0, clock, add, resetout, ready;
 logic [2:0] count;
 typedef enum logic [1:0] {idle, adding, stopped} state;	
state present, next;		
 initial
   begin
  clock = 1'b0; 
  forever #1s clock = ~clock; 
 end
 sequencer s(.*);
 initial
  begin
	start = '0;
	Q0 = '1;
	#2s start=1;
	#2s start='0;
	#4s Q0 = '0;
	#19s start='1;
	#2s start ='0;
 end
endmodule//test_sequencer