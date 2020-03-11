module debouncer (input logic startin,
 osc_clk, output logic startout);
logic [7:0] reg;
always_ff @ (posedge osc_clk) 
begin
reg[7:0] <= {reg[6:0],startin};
if(reg[7:0] == 8'b00000000)
  startout <= 1'b0;
else if(reg[7:0] == 8'b11111111)
  startout <= 1'b1;
else startout <= startout;
end
endmodule