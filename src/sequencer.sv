//	state	machine	for n bit multiplier	
//	File	name:	sequencer.sv	
//	Last	modified:	28/11/2016	
//	Author:	Samyuel Danyo
//	---------------------------------------------	
module	sequencer(input	logic start, Q0, clock,
					output	logic add, resetout, ready);						
typedef enum logic [1:0] {idle,	adding, stopped} state;	
state present, next;	//	local signals for present and next state	
logic [2:0] count;	
always_ff @(posedge clock)//sequantial logic
begin
	if(start)	
	present <= next;
	else
	present <= idle;
	
	if(present==idle)
		count <= 3'b111;//restarting the counter
	else if(present==adding)
		count <= count-1;	
end
//	combinational	logic	
always_comb
begin	
	
	add = Q0 & (present==adding);//add if the last bit of Q=1
	resetout = (present==idle);
	ready=(present==stopped);

	unique case(present)
		idle: next = (start ? adding:idle);	
		adding: next = (count>0 ? adding: stopped);
		stopped: next = (!start ? idle: stopped);
	endcase
end	
endmodule//sequencer