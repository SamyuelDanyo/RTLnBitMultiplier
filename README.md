# RTLnBitMultiplier
Parameterised (8-bit ready) Multiplier with 1-Cycle Shift+Add SystemVerilog RTL Design

Find the full documentation attached as PDF file.

The system modules:
  1.	Adder
  2.  Counter
  3.	Register
  4.	Sequencer
  5.  Multiplier
  
Verification TBs:
  1.  test_adder.sv
  2.  test_regs.sv
  3.  test_sequencer.sv
  4.  test_multiplier.sv
  
| System Design: |
-------------------
The algorithmic state machine has three states: idle, adding
(more appropriate name is calculating) and stopped.
In the sequential block the progress from the present state to the next
is dependent on the start input, if it is high the system changes states,
else if it is low the system stays in idle.
The second part of the sequential block is for the cycle counter.
If the system is in idle it is reset to (3’b111) for eight bits multiplication,
if the system is in calculation state the counter decreases.
In the combinational block first I take care of the outputs. “add” goes high
if the system is in calculating state and Q0 is one. The reset – “resetout”
goes high if the system is in “idle” state and “ready” goes high if the system is in stopped state.
Last, following the ASM flow is the next state logic. If the system is in “idle” and start goes high
the next state is “adding”, otherwise it stays in “idle”. Once in “adding” it loops-in
while the counter is more than zero. If the counter is zero, the machine gets in “stopped” state.
It stays there until start goes low and it resets.

| Extension & Future Work: |
---------------------------
Shift and add states are combined in one clock cycle and the multiplier is operational with 8-bit inputs.
The adder and registers are parameterised meaning that the multiplier can easily be extended to more bits
with adjusting the counter in the sequencer. The debouncer module can be used to debounce the start button
and so internal clock be used.
