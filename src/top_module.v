module top_module(
    input clk,       // Clock input
    input rst,       // Reset input
    output [6:0] seg_out, // Fixed to wire
    output [3:0] an,  // Active-low enable for 7-segment
    output [7:0] led  // LED output to display binary value
);
    wire [7:0] prng_out;
    wire [3:0] hundreds, tens, ones;
    wire [6:0] seg2, seg1, seg0;
    wire [6:0] seg_mux;

    // Instantiate PRNG
    prng U1 (
        .clk(clk),
        .rst(rst),
        .prng_out(prng_out)
    );

    // Binary to BCD conversion
    bin_to_bcd U2 (
        .bin(prng_out),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    // Instantiate 7-segment display for all digits
    seven_segment_display U3 (
        .num(hundreds),
        .seg_out(seg2)
    );

    seven_segment_display U4 (
        .num(tens),
        .seg_out(seg1)
    );

    seven_segment_display U5 (
        .num(ones),
        .seg_out(seg0)
    );

   // Refresh logic and display control
    reg [16:0] refresh_counter;
    wire [1:0] led_select;

    always @(posedge clk or posedge rst) begin
        if (rst)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    assign led_select = refresh_counter[16:15];

    // Multiplex 7-segment display based on led_select
    assign seg_mux = (led_select == 2'b00) ? seg0 : 
                     (led_select == 2'b01) ? seg1 : 
                     (led_select == 2'b10) ? seg2 : 
                     7'b1111111;

    assign an = (led_select == 2'b00) ? 4'b1110 : // Ones
            (led_select == 2'b01) ? 4'b1101 : // Tens
            (led_select == 2'b10) ? 4'b1011 : // Hundreds
            4'b1111;                          // Off (default)

    assign seg_out = seg_mux;
    // Display binary value on LEDs
    assign led = prng_out;
endmodule
