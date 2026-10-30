# ece-128-lab-7
ECE 128 Lab 7. Design and Implementation of an up counter using a Moore state machine in Verilog using Vivado

### Instructions
There are 6 design files. One for a binary to BCD converter, one for a clock driver, one for a counter, one for a multi segment driver, one for a BCD to seven segment display converter, and a top module to actually create the top module. In order to simulate the top module, there are two options. The first one is to use the original clock values intended for the FPGA, all this requires is using the top module test bench and running the simulation. However in order to see the counting up, since the clock for counting is a value the human eye can see, it results in a very long waveform being needed to see the counting up. The other option is to edit the 
