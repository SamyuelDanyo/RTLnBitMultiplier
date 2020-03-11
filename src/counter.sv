/////////////////////////////////////////////////////////////////////
// Design unit: counter
//            :
// File name  : counter.sv
//            :
// Description: counter used to produce a slow clock from
// 				the MachXO2 internal clock
//            :
// Limitations: None
//            : 
// System     : SystemVerilog IEEE 1800-2005
//            :
// Revision   : Version 1.0 11/15
/////////////////////////////////////////////////////////////////////

module counter #(parameter n = 20)
(input logic osc_clk, output logic slow_clock);
logic [n-1:0] count;

always_ff @(posedge osc_clk) begin
 count <= count + 1;
end
// copy top bit to output - slow clock
assign slow_clock = count[n-1];

endmodule