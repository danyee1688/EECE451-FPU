`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/17/2024 05:52:20 PM
// Design Name: 
// Module Name: FPUMultiplierTest
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

module FPUMultiplierTest;
    // Signals
    logic [31:0] input1;
    logic [31:0] input2;       // Inputs to the multiplier
    logic [31:0] product;             // Output of the multiplier
    logic [31:0] expectedProduct;     // Expected result
    int errors; // Error counter

    // Instantiate the multiplier module
    FPUMultiplier uut (
        .input1(input1),
        .input2(input2),
        .product(product)
        );

    // Initialize the testbench
    initial begin
        errors = 0; // Initialize error counter
        $display("---FPU Multiplier Testbench---");
        
        // Test 1
        input1 = 32'h00000000; // 0 in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h00000000;
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 2
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h3f800000; // 1 in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 3
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h00000000; // 0 in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 4
        input1 = 32'h40a00000; // 5 in IEEE 754
        input2 = 32'h40a00000; // 5 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h41c80000; // 25 in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 5
        input1 = 32'hc0600000; // -3.5 in IEEE 754
        input2 = 32'h40000000; // 2 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'hc0e00000; // -7 in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 6
        input1 = 32'h7f800000; // Infinity in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h7fc00000; // NaN in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 7
        input1 = 32'hff800000; // -Infinity in IEEE 754
        input2 = 32'hff800000; // -Infinity in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h7f800000; // +Infinity in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Test 7
        input1 = 32'h7fc00000; // NaN in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        
        #10; // Delay for 10ns
        
        expectedProduct = 32'h7fc00000; // NaN in IEEE 754
        
        if (product !== expectedProduct) begin
            errors++;
            $display("Test FAILED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Expected Product = %h", expectedProduct);
            $display("  FPU Output Product = %h", product);
        end else begin
            $display("Test PASSED:");
            $display("  Input1 = %h", input1);
            $display("  Input2 = %h", input2);
            $display("  Product = %h", product);
        end
        
        // Display test results
        if (errors == 0) begin
            $display("All tests PASSED!");
        end else begin
            $display("Simulation completed with %d errors.", errors);
        end
        
        $display("---FPU Multiplier Testbench End---");
        $finish;
    end
endmodule


