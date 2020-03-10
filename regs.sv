module regs #(parameter n = 8) (input logic clock, resetout, C, ready,
 input logic[n-1:0] Qin, Sum, output logic[2*n-1:0] AQ);
always_ff @ (posedge clock)
 if(resetout) // clear A and load Q
 begin
 AQ[2*n-1:n] <= 0;
 AQ[n-1:0] <= Qin; // load multiplier into Q
 end
 // use concatenation to implement shift, shift Carry into MSB of A shift AQ by one bit to right: AQ[0] <= AQ[1], AQ[1] <= AQ[2];
 else if(!ready) AQ <= {C,Sum,AQ[n-1:1]};   // if in adding state
 //loading the Carry(if add=0 it is 0) Sum(if add=0 just A) shifting out the last bit gets the shifting done simutenously with the loading
 endmodule