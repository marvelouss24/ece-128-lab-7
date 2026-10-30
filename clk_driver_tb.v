`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 10:05:56 AM
// Design Name: 
// Module Name: clk_driver_tb
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


module clk_driver_tb;

parameter w = 3;
reg clk;
reg rst;
wire [w:0] Q;

clk_driver #(w) uut (clk, rst, Q);

always #5 clk = ~clk;

initial begin 
    clk = 1'b0; rst = 1'b1;
    
    #10 rst = 1'b0;
    
	#170 $stop;

end
endmodule