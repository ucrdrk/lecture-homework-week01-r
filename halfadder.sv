module halfadder(
    input a,
    input b,
    output s,
    output c
);

// Put your implementation of a halfadder goes here
assign s = a ^ b;
assign c = a & b;

endmodule