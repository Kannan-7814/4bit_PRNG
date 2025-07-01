module prng
    #(parameter N = 8)(
    input clk,         // Clock input
    input rst,         // Reset input
    output reg [N-1:0] prng_out  // 8-bit PRNG output
);
    reg [N-1:0] lfsr;
    wire taps;
    reg [25:0] counter;        // Clock divider counter
    reg slow_clk;              // Slow clock for visible changes

    
     // Tap points for maximal length sequence for 8-bit LFSR
    assign taps = lfsr[8] ^ lfsr[6] ^ lfsr[5] ^ lfsr[4];
    
    // Clock divider to slow down updates (~1 Hz)
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 26'd50_000_000) begin  // 1 Hz (100M / 50M)
            slow_clk <= ~slow_clk;
            counter <= 0;
    end
end
    // LFSR update with clock and reset
    always @(posedge slow_clk or posedge rst) begin
        if (rst) begin
            lfsr <= 8'b00000001;  // Initial non-zero seed (can be changed if needed)
        end else begin
            lfsr <= {lfsr[6:0], taps};  // Shift and feedback logic
        end
    end
    // PRNG output assignment updated every clock cycle
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prng_out <= 0;
        end else begin
            prng_out <= lfsr;  // Updated correctly every clock cycle
        end
    end
endmodule
