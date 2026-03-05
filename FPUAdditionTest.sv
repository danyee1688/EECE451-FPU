`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/17/2024 05:52:20 PM
// Design Name: 
// Module Name: FPUAdditionTest
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

module FPUAdditionTest;
    // Signals
    logic [31:0] input1;
    logic [31:0] input2;     // Inputs to the adder
    logic [31:0] sum;               // Output from the adder
    logic [31:0] expectedSum;      // Expected result
    int errors;                     // Error counter

    // Instantiate the addition module
    FPUAddition uut (
        .input1(input1),
        .input2(input2),
        .sum(sum)
        );
    
    // Test procedure
    initial begin
        errors = 0; // Initialize error counter
        $display("---FPU Addition Testbench---");
        
        // Test 1
        input1 = 32'h7f800000; // Infinity in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        
        #100; // Delay for 10ns
        
        expectedSum = 32'h7f800000; // Infinity in IEEE 754
        
        if (sum !== expectedSum) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Sum = %h", expectedSum);
            $display("  FPU Output Sum = %h", sum);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Sum = %h", sum);
        end
        
        // Test 2
        input1 = 32'h7f800000; // 0 in IEEE 754
        input2 = 32'hbf800000; // -1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedSum = 32'hbf800000; // -1 in IEEE 754
        
        if (sum !== expectedSum) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Sum = %h", expectedSum);
            $display("  FPU Output Sum = %h", sum);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Sum = %h", sum);
        end
        
        // Test 3
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedSum = 32'h40000000; // 2 in IEEE 754
        
        if (sum !== expectedSum) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Sum = %h", expectedSum);
            $display("  FPU Output Sum = %h", sum);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Sum = %h", sum);
        end
        
        // Test 4
        input2 = 32'h3f800000; // 1 in IEEE 754
        input1 = 32'hbf800000; // -1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedSum = 32'h00000000; // 0 in IEEE 754
        
        if (sum !== expectedSum) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Sum = %h", expectedSum);
            $display("  FPU Output Sum = %h", sum);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Sum = %h", sum);
        end
        
        // Display test results
        if (errors == 0) begin
            $display("All tests PASSED!");
        end else begin
            $display("Simulation completed with %d errors.", errors);
        end
        
        $display("---FPU Addition Testbench End---");
        $finish;
    end
endmodule
