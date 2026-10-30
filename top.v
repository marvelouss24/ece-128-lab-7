`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 02:00:05 PM
// Design Name: 
// Module Name: top
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


module top(
input clk,
input rst,
output [3:0] annode,
output [6:0] cathode,
output rdy
);

wire [26:0] clk_s;
clk_driver driver (clk, rst, clk_s);

wire [11:0] count;
wire en;
counter counter (clk_s[26], clk, rst, count, en);

wire [15:0] BCD;
bin2bcd converter (clk, rst, en, count, BCD, rdy);

mult_seg_driver display (clk_s[16], rst, BCD, annode, cathode);

endmodule
