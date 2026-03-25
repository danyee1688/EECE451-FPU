`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/02/2024 09:09:22 PM
// Design Name: 
// Module Name: FPUAddition
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

module FPUAddition(
    input logic [31:0] input1,
    input logic [31:0] input2,
    output logic [31:0] sum
    );
    
    // Signals
    logic input1Sign;
    logic input2Sign;
    logic [7:0] input1Exponent;
    logic [7:0] input2Exponent;
    logic [7:0] effectiveInput1Exponent;
    logic [7:0] effectiveInput2Exponent;
    logic [7:0] exponentAligned;
    logic [23:0] input1Mantissa;
    logic [23:0] input2Mantissa;
    logic [23:0] input1MantissaAligned;
    logic [23:0] input2MantissaAligned;
    logic sumSign;
    logic [7:0] sumExponent;
    logic [24:0] sumMantissa;
    logic roundBit;
    
    // Initial assignments
    assign input1Sign = input1[31];
    assign input2Sign = input2[31];
    assign input1Exponent = input1[30:23];
    assign input2Exponent = input2[30:23];
    assign input1Mantissa = (input1Exponent == 8'hFF) ? {1'b0, input1[22:0]} : (input1Exponent == 8'h00) ? {1'b0, input1[22:0]} : {1'b1, input1[22:0]};
    assign input2Mantissa = (input2Exponent == 8'hFF) ? {1'b0, input2[22:0]} : (input2Exponent == 8'h00) ? {1'b0, input2[22:0]} : {1'b1, input2[22:0]}; 
    assign effectiveInput1Exponent = (input1Exponent == 0) ? 8'b1 : input1Exponent;
    assign effectiveInput2Exponent = (input2Exponent == 0) ? 8'b1 : input2Exponent;
    
    // Start of procedural process
    always_comb begin
        // Handle NaN and Infinity
        // Check if either input is infinity or NaN
        if (input1Exponent == 8'hFF && input1Mantissa != 0) begin
            sum = {1'b0, 8'hFF, 23'h400000};
        end else if (input2Exponent == 8'hFF && input2Mantissa != 0) begin
            sum = {1'b0, 8'hFF, 23'h400000};
        end else if (input1Exponent == 8'hFF) begin
            if (input2Exponent == 8'hFF) begin
                sum = (input1Sign == input2Sign) ? {input1Sign, 8'hFF, 23'b0} : {1'b0, 8'hFF, 23'h400000}; // NaN for opposite infinities
            end else begin
                sum = {input1Sign, 8'hFF, 23'b0};
            end
        end else if (input2Exponent == 8'hFF) begin
            sum = {input2Sign, 8'hFF, 23'b0};
        // Else no special case
        end else begin
            // Align mantissas based off of exponents
            if (effectiveInput1Exponent > effectiveInput2Exponent) begin
                exponentAligned = effectiveInput1Exponent - effectiveInput2Exponent;
                input1MantissaAligned = input1Mantissa;
                input2MantissaAligned = input2Mantissa >> exponentAligned;
                sumExponent = effectiveInput1Exponent;
            end else begin
                exponentAligned = effectiveInput2Exponent - effectiveInput1Exponent;
                input1MantissaAligned = input1Mantissa >> exponentAligned;
                input2MantissaAligned = input2Mantissa;
                sumExponent = effectiveInput2Exponent;
            end
            
            // Perform addition or subtraction
            // If neither inputs are negative, addition is implied
            if (input1Sign == input2Sign) begin
                sumMantissa = input1MantissaAligned + input2MantissaAligned;
                
                // Set sign to copy input 1's sign
                sumSign = input1Sign;
            // If any of the inputs are positive, subtraction is implied
            end else begin
                // If input 1's mantissa is larger than input 2's mantissa, the sum will have the same sign as input1
                if (input1MantissaAligned >= input2MantissaAligned) begin
                    sumMantissa = input1MantissaAligned - input2MantissaAligned;
                    
                    // Set sign to copy input 1's sign
                    sumSign = input1Sign;
                // Else if input 1's mantissa is smaller than input 2's mantissa, the sum will have the same sign as input2
                end else begin
                    sumMantissa = input2MantissaAligned - input1MantissaAligned;
                    
                    // Set sign to copy input 2's sign
                    sumSign = input2Sign;
                end
            end
            
                    // Normalization
            // Check for overflow
            if (sumMantissa[24]) begin
                sumMantissa = sumMantissa >> 1;
                sumExponent = sumExponent + 1;
            end else if (sumMantissa == 0) begin
                sumExponent = 0;
                sumSign = 0;
            // Check for underflow
            end else begin
                while (!sumMantissa[23] && sumExponent > 0) begin
                    sumMantissa = sumMantissa << 1;
                    sumExponent = sumExponent - 1;
                end
            end
    
            
            // Rounding
            if (roundBit && sumMantissa[0]) begin
                sumMantissa = sumMantissa + 1;
                if (sumMantissa[24]) begin // Handle overflow after rounding
                    sumMantissa = sumMantissa >> 1;
                    sumExponent = sumExponent + 1;
                end
            end
            
            // Piece together sum
            sum = {sumSign, sumExponent, sumMantissa[22:0]};
        end
    end

endmodule
