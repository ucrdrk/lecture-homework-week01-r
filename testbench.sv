`timescale 1ns / 1ps

`include "halfadder.sv"

module testbench();

// Signals for UUT connection
reg A;
reg B;
wire S;
wire C;
reg pass;
integer tests_failed;

// Instantiate the unit under test
halfadder uut(A, B, S, C);

initial begin
    // Set up output to VCDD file
    $dumpfile("tb.vcd");
    $dumpvars(0, testbench);

    // Initialize testbench variables
    pass = 1'b1;
end

// Write Test Stimulus
task test_00();
begin
    A = 0;
    B = 0;
    #5;
    pass &= S == 0 & C == 0;
end
endtask

task test_01();
begin
    // Put your test for A = 0, and B = 1
    A = 0;
    B = 1;
    #5;
    pass &= S == 1 & C == 0;
end
endtask

task test_10();
begin
    // Put your test for A = 1, and B = 0
    A = 1;
    B = 0;
    #5;
    pass &= S == 1 & C == 0;
end
endtask

task test_11 ();
begin
    // Put your test for A = 1, and B = 1
    A = 1;
    B = 1;
    #5;
    pass &= S == 0 & C == 1;
end
endtask

// Write Checker
initial begin

    test_00(); #15;
    test_01(); #15;
    test_10(); #15;
    test_11(); #15;

    if (pass) begin
        $display("Tests Passed!");
    end else begin
        $display("Failed tests");
    end
end

endmodule
