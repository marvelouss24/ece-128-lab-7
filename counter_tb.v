`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 03:43:35 PM
// Design Name: 
// Module Name: counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_tb;

reg clk_s;
reg clk;
reg rst;
wire [11:0] counter;
wire en;

counter uut (clk_s, clk, rst, counter, en);

always #50 clk_s = ~clk_s;
always #5 clk = ~clk;

initial begin 
    clk_s = 1'b0; clk = 1'b0; rst = 1'b1;
    
    #10 rst = 1'b0;
    
	#200 $stop;
end

endmodule
