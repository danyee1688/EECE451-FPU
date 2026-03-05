`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/16/2024 9:22:43 PM
// Design Name: 
// Module Name: FPUMainTest
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

module FPUMainTest;
    // Signals
    int mode;
    logic [31:0] input1; 
    logic [31:0] input2;       // Inputs to the main module
    logic [31:0] result;            // Output of the main module
    logic [31:0] expectedResult;    // Expected result
    int errors; // Error counter

    // Instantiate the divider module
    FPUMain uut (
        .mode(mode),
        .input1(input1),
        .input2(input2),
        .result(result)
        );

    // Initialize the testbench
    initial begin
        errors = 0; // Initialize error counter
        $display("---FPU Main Testbench---");
        
        // Test 1
        input1 = 32'h00000000; // 0 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 0; // Addition
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h3f800000; // 1 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 2
        input1 = 32'h00000000; // 0 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 1; // Multiplication
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h00000000; // 1 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 3
        input1 = 32'h00000000; // 0 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 2; // Division
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h00000000; // 0 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 4
        input1 = 32'hbf800000; // -1 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 0; // Addition
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h00000000; // 0 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 5
        input1 = 32'hbf800000; // -1 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 1; // Multiplication
        
        #10; // Delay for 10ns
        
        expectedResult = 32'hbf800000; // -1 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 6
        input1 = 32'hbf800000; // -1 in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 2; // Division
        
        #10; // Delay for 10ns
        
        expectedResult = 32'hbf800000; // -1 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 7
        input1 = 32'hc0600000; // -3.5 in IEEE 754
        input2 = 32'h40000000; // 2 in IEEE 754
        mode = 0; // Addition
        
        #10; // Delay for 10ns
        
        expectedResult = 32'hbfc00000; // -1.5 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 8
        input1 = 32'hc0600000; // -3.5 in IEEE 754
        input2 = 32'h40000000; // 2 in IEEE 754
        mode = 1; // Multiplication
        
        #10; // Delay for 10ns
        
        expectedResult = 32'hc0e00000; // -7 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 9
        input1 = 32'hc0600000; // -3.5 in IEEE 754
        input2 = 32'h40000000; // 2 in IEEE 754
        mode = 2; // Division
        
        #10; // Delay for 10ns
        
        expectedResult = 32'hbf800000; // -1.75 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 10
        input1 = 32'h7f800000; // Infinity in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        mode = 0; // Addition
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7f800000; // Infinity in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 11
        input1 = 32'h7f800000; // Infinity in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        mode = 1; // Multiplication
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7fc00000; // NaN in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 12
        input1 = 32'h7f800000; // Infinity in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        mode = 2; // Division
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7f800000; // -1.75 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 13
        input1 = 32'h7fc00000; // NaN in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 0; // Addition
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7fc00000; // NaN in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 14
        input1 = 32'h7fc00000; // NaN in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 1; // Multiplication
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7fc00000; // NaN in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 15
        input1 = 32'h7fc00000; // NaN in IEEE 754
        input2 = 32'h3f800000; // 1 in IEEE 754
        mode = 2; // Division
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7fc00000; // NaN in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 16
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        mode = 0; // Addition
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h3f800000; // 1 in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 17
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        mode = 1; // Multiplication
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h00000000; // NaN in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Test 18
        input1 = 32'h3f800000; // 1 in IEEE 754
        input2 = 32'h00000000; // 0 in IEEE 754
        mode = 2; // Division
        
        #10; // Delay for 10ns
        
        expectedResult = 32'h7f800000; // NaN in IEEE 754
        
        if (result !== expectedResult) begin
            errors++;
            $display("Test FAILED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Expected Result = %h", expectedResult);
            $display("      FPU Output Result = %h", result);
        end else begin
            $display("Test PASSED:");
            
            case (mode)
                0: $display("   Operation: Addition (mode = %d)", mode);
                1: $display("   Operation: Multiplication (mode = %d)", mode);
                2: $display("   Operation: Division (mode = %d)", mode);
                default: $display("   Operation: None (mode = %d)", mode);
            endcase
            
            $display("      Input1 = %h", input1);
            $display("      Input2 = %h", input2);
            $display("      Result = %h", result);
        end
        
        // Display test results
        if (errors == 0) begin
            $display("All tests PASSED!");
        end else begin
            $display("Simulation completed with %d errors.", errors);
        end
        
        $display("---FPU Main Testbench End---");
        $finish;
     end
endmodule
