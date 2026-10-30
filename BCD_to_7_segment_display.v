`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 06:12:28 AM
// Design Name: 
// Module Name: BCD_to_7_segment_display
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

module BCD_to_7_segment_display(
    input [3:0] A,
    output reg [6:0] SEG
    );
    
    always @(*)
    begin
        case(A)
            4'd0 : SEG = 7'b0000001;
            4'd1 : SEG = 7'b1001111;
            4'd2 : SEG = 7'b0010010;
            4'd3 : SEG = 7'b0000110;
            4'd4 : SEG = 7'b1001100;
            4'd5 : SEG = 7'b0100100;
            4'd6 : SEG = 7'b0100000;
            4'd7 : SEG = 7'b0001111;
            4'd8 : SEG = 7'b0000000;
            4'd9 : SEG = 7'b0000100;
            default : SEG = 7'b1111111;
        endcase
    end
endmodule    