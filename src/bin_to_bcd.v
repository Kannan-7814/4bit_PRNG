`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2025 22:35:44
// Design Name: 
// Module Name: bin_to_bcd
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
module bin_to_bcd(
    input [7:0] bin,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
    
);
    always @(*) begin
        if (bin < 10) begin
            hundreds = 4'b0000;
            tens = 4'b0000;
            ones = bin;
        end
        else if (bin < 100) begin
            hundreds = 4'b0000;
            tens = bin / 10;
            ones = bin % 10;
        end
        else begin
            hundreds = bin / 100;
            tens = (bin % 100) / 10;
            ones = bin % 10;
        end
    end
endmodule
