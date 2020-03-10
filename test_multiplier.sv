module test_multiplier;

logic add, resetout, ready, C, start, slow_clock;
logic [7:0] M, Qin, Sum;
logic[15:0] AQ, leds;

multiplier Mu(.*);

initial
begin
start = '0;
#3s start = '1;
#30s start = '1;
end 
endmodule