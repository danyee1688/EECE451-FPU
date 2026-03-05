`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/17/2024 11:19:56 PM
// Design Name: 
// Module Name: FPUDivisionTest
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

module FPUDividerTest;
    // Signals
    logic [31:0] input1; 
    logic [31:0] input2;       // Inputs to the divider
    logic [31:0] quotient;            // Output of the divider
    logic [31:0] expectedQuotient;    // Expected result
    int errors; // Error counter

    // Instantiate the divider module
    FPUDivider uut (
        .input1(input1),
        .input2(input2),
        .result(quotient)
        );

    // Initialize the testbench
    initial begin
        errors = 0; // Initialize error counter
        $display("---FPU Divider Testbench---");
        
        // Test 1
        input1 = 32'h00000000; // 0 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedQuotient = 32'h00000000; // 0 in IEEE 754
        
        if (quotient !== expectedQuotient) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Quotient = %h", expectedQuotient);
            $display("  FPU Output Quotient = %h", quotient);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Quotient = %h", quotient);
        end
        
        // Test 2
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h40000000; // 2 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedQuotient = 32'h3f000000; // 0.5 in IEEE 754
        
        if (quotient !== expectedQuotient) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Quotient = %h", expectedQuotient);
            $display("  FPU Output Quotient = %h", quotient);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Quotient = %h", quotient);
        end
        
        // Test 3
        input1 = 32'h7f800000; // Infinity in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedQuotient = 32'h7f800000; // Infinity in IEEE 754
        
        if (quotient !== expectedQuotient) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Quotient = %h", expectedQuotient);
            $display("  FPU Output Quotient = %h", quotient);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Quotient = %h", quotient);
        end
        
        // Test 4
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedQuotient = 32'h7f800000; // Infinity in IEEE 754
        
        if (quotient !== expectedQuotient) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Quotient = %h", expectedQuotient);
            $display("  FPU Output Quotient = %h", quotient);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Quotient = %h", quotient);
        end
        
        // Test 5
        input1 = 32'hc0c00000; // -6 in IEEE 754
        input2 = 32'h40000000; // 3 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedQuotient = 32'hc0000000; // -2 in IEEE 754
        
        if (quotient !== expectedQuotient) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Quotient = %h", expectedQuotient);
            $display("  FPU Output Quotient = %h", quotient);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Quotient = %h", quotient);
        end

        // Display test results
        if (errors == 0) begin
            $display("All tests PASSED!");
        end else begin
            $display("Simulation completed with %d errors.", errors);
        end
        
        $display("---FPU Divider Testbench End---");
        $finish;
    end
endmodule
