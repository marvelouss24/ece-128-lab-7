`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 02:16:42 PM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb;

reg clk;
reg rst;
wire [3:0] annode;
wire [6:0] cathode;
wire rdy;

top uut (clk, rst, annode, cathode, rdy);

always #5 clk = ~clk;

initial begin 
    clk = 1'b0; rst = 1'b1;
    
    #10 rst = 1'b0;
    
	#400 $stop;
	
end
endmodule
