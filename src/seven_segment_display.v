module seven_segment_display(
    input [3:0] num,
    output reg [6:0] seg_out
);
always @(*) begin
    case (num)
        4'd0: seg_out = 7'b0000001; // 0
        4'd1: seg_out = 7'b1001111; // 1
        4'd2: seg_out = 7'b0010010; // 2
        4'd3: seg_out = 7'b0000110; // 3
        4'd4: seg_out = 7'b1001100; // 4
        4'd5: seg_out = 7'b0100100; // 5
        4'd6: seg_out = 7'b0100000; // 6
        4'd7: seg_out = 7'b0001111; // 7
        4'd8: seg_out = 7'b0000000; // 8
        4'd9: seg_out = 7'b0000100; // 9
        default: seg_out = 7'b1111111; // Blank for invalid values
    endcase
end
endmodule