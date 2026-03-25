`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 09:09:22 PM
// Design Name: 
// Module Name: FPUMain
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


module FPUMain(
    input  int mode,
    input  logic [31:0] input1, 
    input  logic [31:0] input2, // Inputs into the main module
    output logic [31:0] result // Resulting sum/product/quotient
    );
    
    logic [31:0] sum;
    logic [31:0] product;
    logic [31:0] quotient;
    
    // Instantiate the addition module
    FPUAddition adder (
        .input1(input1),
        .input2(input2),
        .sum(sum)
        );
    
    // Instantiate the multiplier module
    FPUMultiplier multiplier (
        .input1(input1),
        .input2(input2),
        .product(product)
        );
    
    // Instantiate the divider module
    FPUDivider divider (
        .input1(input1),
        .input2(input2),
        .result(quotient)
        );
    
    // Start of procedural process
    always_comb begin
        // Switch-case statement for mode
        // 0 -> addition
        // 1 -> multiplication
        // 2 -> division
        // by default, return 0;
        case (mode)
            0: result = sum;
            1: result = product;
            2: result = quotient;
            default: result = 0;
        endcase
    end
endmodule
