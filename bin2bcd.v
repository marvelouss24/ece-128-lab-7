`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 09:53:12 AM
// Design Name: 
// Module Name: bin2bcd
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

module bin2bcd(
input clk,
input rst,
input en,
input [11:0] count,
output reg [15:0] BCD,
output reg rdy
);

localparam idle = 3'b000,
           setup = 3'b001,
           add = 3'b010,
           shift = 3'b011,
           done = 3'b100;
           
reg [2:0] state;
reg [27:0] bcd_data;
reg [3:0] sh_counter;

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        state <= idle;
        bcd_data <= 28'b0;
        sh_counter <= 4'b0;
        BCD <= 16'b0;
        rdy <= 1'b0;
    end
    else begin
        case(state)
            idle: begin
                if (en)
                    state <= setup;
                else
                    state <= idle;
            end
            setup: begin
                bcd_data <= {16'b0, count};
                sh_counter <= 4'b0;
                rdy <= 1'b0;
                state <= add;
            end
            add: begin
                if (bcd_data[27:24] > 4)
                    bcd_data[27:24] <= bcd_data[27:24] + 2'd3;
                if (bcd_data[23:20] > 4)
                    bcd_data[23:20] <= bcd_data[23:20] + 2'd3;
                if (bcd_data[19:16] > 4)
                    bcd_data[19:16] <= bcd_data[19:16] + 2'd3;
                if (bcd_data[15:12] > 4)
                    bcd_data[15:12] <= bcd_data[15:12] + 2'd3;
                state <= shift;
            end
            shift: begin
                sh_counter <= sh_counter + 1;
                bcd_data <= bcd_data << 1;
                if (sh_counter == 11)
                    state <= done;
                else
                    state <= add;
            end
            done: begin
                BCD <= bcd_data[27:12];
                rdy <= 1'b1;
                state <= idle;
            end
            default: state <= idle;
        endcase    
    end
end
endmodule