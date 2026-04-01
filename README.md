# Lecture Homework Week 01 - Thursday

## Introduction

In this lecture homework, you will create a basic module called a **half-adder** and verify your design with a testbench. The testbench will ensure that your half-adder implementation functions correctly.

## Getting the Code

You are not required to write all the code from scratch. Instead, we have provided a scaffolded outline, and you will implement the remaining logic.

As with the previous lecture homework, this assignment is hosted on GitHub. This time, however, you will create your own repository using this one as a **template**. To do this:
1. Click on **"Use this template"**.
2. Select **"Create a new repository"**.
3. Give your repository a descriptive name.
4. Click **"Create repository"**.

Once created, clone the repository to your local machine or open it in a **GitHub Codespace** to begin working.

## Writing the Code for a Half-Adder

Your first task is to write the logic for the half-adder. The template code is located in `halfadder.sv`. Write your design beneath the following comment:

```verilog
// Put your implementation of a halfadder here
```

A half-adder takes two Boolean inputs and adds them. The outputs are the **sum** (`s`) and the **carry** (`c`). You may implement your solution using either a **continuous assignment** (`assign`) or an **always block**—whichever you find more intuitive.

## Writing the Testbench

Next, you will complete the testbench in `testbench.sv`. The testbench verifies your design by applying various input combinations and checking if the outputs match expected results.

First, locate the following comment:

```verilog
// Instantiate the unit under test
```

Instantiate your half-adder module by entering the following code:
```verilog
halfadder uut(A, B, S, C);
```

This code creates an instance of the `halfadder` module named `uut`. It maps the signals `A`, `B`, `S`, and `C` to the module’s inputs and outputs.

Next, find the initialization section:

```verilog
// Initialize signals
```

Initialize the registers used for the tests. For example, set `A = 1'b0;` to initialize register `A` to a 1-bit value of 0. You must also initialize the `pass` variable to `1'b1`. You will use this flag later to determine if all tests have succeeded.

Finally, implement the remaining tests. The first test (for `A=0, B=0`) is provided as an example. Complete the other test cases by copying the template and modifying the values to cover all possible input combinations.

## Synthesizing

Before running the simulation, you must compile (synthesize) the code using `iverilog`. Run the following command in your terminal:

```sh
iverilog -o testbench -g2009 testbench.sv halfadder.sv
```

This command generates a simulation file named `testbench`.

## Running the Testbench

Run the simulation and observe the results. If your design is correct, you should see:

```sh
VCD info: dumpfile tb.vcd opened for output.
Tests Passed!
```

If the design is incorrect, the output will show:

```sh
VCD info: dumpfile tb.vcd opened for output.
Failed tests
```

If your tests are failing and you cannot identify the error, use **GTKWave** to inspect the waveforms stored in `tb.vcd`.

## Extra Fun

If you're feeling adventurous, you can also try to add some functionality. There is a
integer called `tests_failed` in the testbench. Modify the testbench so that it can count
the number of tests failed and print them out at the end. If this feature works, I will 
give one extra point. However, this functionality is not required to earn full credit.


## What to Turn In

Submit your work by committing and pushing your changes to your GitHub repository. 

Upload the assignment via **Gradescope**. When prompted, log in to GitHub, select your homework repository, and submit.

