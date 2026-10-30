`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 11:29:12 AM
// Design Name: 
// Module Name: mult_seg_driver_tb
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


module mult_seg_driver_tb;

reg clk;
reg rst;
reg [15:0] BCD;
wire [3:0] an;
wire [6:0] cath;

mult_seg_driver uut (clk, rst, BCD, an, cath);

always #5 clk = ~clk;

initial begin 
    clk = 1'b0; rst = 1'b1; BCD = 16'h1234;
  
    #10 rst = 1'b0;
    
	#100 $stop;
end

endmodule
