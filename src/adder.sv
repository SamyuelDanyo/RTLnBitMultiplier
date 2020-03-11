module adder #(parameter n = 8) 
(input logic[n-1:0] A,M, input logic add,
 output logic C, output logic [n-1:0] Sum);
// Synplify can synthesise A+M, but extra logic is needed to derive output carry
// here 9-bit unsigned arithmetic addition allows to obtain carry
always_comb
begin
{C,Sum} = {add ? {1'b0,A} + {1'b0,M} : {1'b0,A}};//If add is high sum is equal to A+M(we add), otherwise Sum=A (shift)
end
endmodule//adder