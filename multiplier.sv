module multiplier // for MachXO implementation – read MachXO lab notes
 #(parameter n=8)
 (input logic start,
 //input logic [n-1:0] Q, M,
 output logic [2*n-1:0] leds);
 logic add, resetout, ready, slow_clock, osc_clk, C;
 logic [n-1:0] M, Qin, Sum;
 logic[2*n-1:0] AQ;
 	defparam OSCH_inst.NOM_FREQ = "3.33";
	OSCH OSCH_inst
		( 
		.STDBY(1'b0), 		// 0=Enabled, 1=Disabled
		.OSC(osc_clk),
		.SEDSTDBY() 
		);
// slow clock is defined here only for simulation
/*initial 
begin
  slow_clock = 1'b0; 
  forever #1s slow_clock = ~slow_clock; 
end
*/
 assign M = 8'b00010000; // multiplicand - hardwired
 assign Qin = 8'b00010000; // multiplier - hardwired
 assign leds = AQ; // MachXO Mini Kit leds are active low
counter c(.*); // produces slow clock comment out for simmulation
adder a(.A(AQ[2*n-1:n]), .M(M), .C(C), .Sum(Sum), .add(add));
regs r(.clock(slow_clock), .resetout(resetout), .ready(ready), .C(C), .Sum(Sum), .Qin(Qin), .AQ(AQ));
sequencer S(.start(start), .clock(slow_clock), .resetout(resetout), .Q0(AQ[0]), .add(add), .ready(ready));
endmodule