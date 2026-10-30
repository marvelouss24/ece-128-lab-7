`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 01:43:27 PM
// Design Name: 
// Module Name: bin2bcd_tb
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


module bin2bcd_tb;

reg clk;
reg rst;
reg en;
reg [11:0] count;
wire [15:0] BCD;
wire rdy;

bin2bcd uut (clk, rst, en, count, BCD, rdy);

always #5 clk = ~clk;

initial begin 
    clk = 1'b0; rst = 1'b1; en = 1'b0; count = 12'b10111101;
    
    #10 rst = 1'b0; en = 1'b1;
    
	#300 $stop;
end

endmodule
