`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 09:53:12 AM
// Design Name: 
// Module Name: clk_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:a 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module t_flip_flop(
input T,
input clk,
input rst,
output reg Q
);

always @(posedge clk or posedge rst)begin
    if (rst)
        Q <= 0;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
    end
    
endmodule

module clk_driver #(
parameter w = 26) (
input clk,
input rst,
output [w:0] Q
);

t_flip_flop T0(1'b1, clk, rst, Q[0]);

genvar i; 

    // Generate block containing the loop structure
    generate
        for (i = 1; i < w + 1; i = i + 1) begin : clk_divider
            t_flip_flop div (1'b1, Q[i -1], rst, Q[i]);
        end
    endgenerate
    
endmodule
