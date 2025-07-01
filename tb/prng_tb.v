`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2025 22:07:53
// Design Name: 
// Module Name: prng_tb
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
module prng_tb;

    // Testbench signals
    reg clk;
    reg rst;
    wire [8:1] prng_out;
    
    // Instantiate the PRNG module
    prng #(.N(8)) uut (
        .clk(clk),
        .rst(rst),
        .prng_out(prng_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns period (100 MHz clock)
    end

    // Stimulus block
    initial begin
        // Reset the system
        rst = 0;
        #20;
        
        // Release reset
        rst = 1;
        #100;
        
        // Apply a longer simulation to observe the PRNG output
        #500;
        
        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t, PRNG Output = %0d", $time, prng_out);
    end

    // Dump waveform for analysis
    initial begin
        $dumpfile("prng_tb.vcd");
        $dumpvars(0, prng_tb);
    end
endmodule
