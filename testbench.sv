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

initial begin
    // Set up output to VCDD file
    $dumpfile("tb.vcd");
    $dumpvars(0, testbench);

    // Initialize testbench variables
end

// Write Test Stimulus
task test_00();
    A = 0;
    B = 0;
    #5;
    pass &= S == 0 & C == 0;
endtask

task test_01();
    // Put your test for A = 0, and B = 1
endtask

task test_10();
    // Put your test for A = 1, and B = 0
endtask

task test_11 ();
    // Put your test for A = 1, and B = 1
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

endmodule;
