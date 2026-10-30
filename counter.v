`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 09:53:12 AM
// Design Name: 
// Module Name: counter
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


module counter(
input clk_s,
input clk,
input rst,
output reg [11:0] counter,
output reg en
);

always @(posedge clk_s or posedge rst) begin
    if (rst)
        counter <= 12'b0;
    else
        counter <= counter + 12'b1;
end

reg [11:0] counter_past;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter_past <= 12'b0;
        en <= 1'b0;
    end
    else begin
        counter_past <= counter;
        en <= (counter != counter_past);
    end
end

endmodule
