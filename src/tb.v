`default_nettype none
`timescale 1ns/1ps


//This file test the top module and create the output signals

module tb;
    reg [7:0] ui_in;
    wire [7:0] uo_out;
    reg [7:0] uio_in;
    wire [7:0] uio_out;
    reg [7:0] uio_oe;
    reg en;
    reg clk;
    reg rst_n;


    // Instantiate the design under test (DUT)
    tt_um_prng#(10_000_000) dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .en(en),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

         // Apply test vectors and observe outputs
        // You can write your test cases here
    // Test vector generation
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
        // Initialize inputs
        ui_in = 8'b0;
        uio_in = 8'b0;
        en = 0;
        clk = 0;
        rst_n = 0;

        // Apply reset
        rst_n = 1;
        #10 rst_n = 0;
        #10 rst_n = 1;

        // Enable the design
        #50 en = 1;

        

        // Simulate for some time
        #1000;

        // Finish simulation
        $finish;
    end
endmodule
