`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 09:53:12 AM
// Design Name: 
// Module Name: mult_seg_driver
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

module refresh_counter(
input clk,
input rst,
output reg [1:0] counter
);

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 2'b0;
    else
        counter <= counter + 2'b1;
end

endmodule

module decoder_2to4(
input [1:0] sel,
output reg [3:0] an
);

always @(*)
    begin
        case(sel)
            2'b00 : an = 4'b1110;
            2'b01 : an = 4'b1101;
            2'b10 : an = 4'b1011;
            2'b11 : an = 4'b0111;
            default : an = 4'b1111;
        endcase
    end
    
endmodule

module mux_4to1(
input [1:0] sel,
input [15:0] BCD,
output reg [3:0] bcd_digit
);

always @(*)
    begin
        case(sel)
            2'b00 : bcd_digit = BCD[3:0];
            2'b01 : bcd_digit = BCD[7:4];
            2'b10 : bcd_digit = BCD[11:8];
            2'b11 : bcd_digit = BCD[15:12];
            default : bcd_digit = 4'b0000;
        endcase
    end
    
endmodule

module mult_seg_driver(
input clk_refresh,
input rst,
input [15:0] BCD,
output [3:0] an,
output [6:0] cath
);

wire [1:0] sel;
wire [3:0] seg_decoder_in;
refresh_counter count (clk_refresh, rst, sel);
decoder_2to4 decoder(sel, an);
mux_4to1 mux (sel, BCD, seg_decoder_in);

BCD_to_7_segment_display display (seg_decoder_in, cath);

endmodule