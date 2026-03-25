`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/02/2024 09:09:22 PM
// Design Name: 
// Module Name: FPUDivider
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

module FPUDivider (
    input  logic [31:0] input1,
    input  logic [31:0] input2,
    output logic [31:0] result 
);
    // Signals
    logic sign1;
    logic sign2;
    logic resultSign;
    logic [7:0] exponent1;
    logic [7:0] exponent2;
    logic [7:0] resultExponent;
    logic [23:0] mantissa1;
    logic [23:0] mantissa2;
    logic [23:0] mantissaQuotient;
    logic [47:0] mantissaQuotientExtended;
    logic [24:0] normalizedMantissa;

    // Initial Assignments
    assign sign1 = input1[31];
    assign sign2 = input2[31];
    assign exponent1 = input1[30:23];
    assign exponent2 = input2[30:23];
    assign mantissa1 = (exponent1 == 8'hFF) ? {1'b0, input1[22:0]} : (exponent1 == 8'h00) ? {1'b0, input1[22:0]} : {1'b1, input1[22:0]};
    assign mantissa2 = (exponent2 == 8'hFF) ? {1'b0, input2[22:0]} : (exponent2 == 8'h00) ? {1'b0, input2[22:0]} : {1'b1, input2[22:0]};

    // Compute result's sign
    assign resultSign = sign1 ^ sign2;

    // Start of procedural process
    always_comb begin
        // Default values to avoid uninitialized signals
        result = 32'b0;
        normalizedMantissa = 25'b0;
        resultExponent = 8'b0;

        // Special case handling
        // Handle NaN
        if ((exponent1 == 8'hFF && mantissa1 != 0) || (exponent2 == 8'hFF && mantissa2 != 0)) begin
            $display ("Handling NaN");
            result = {1'b0, 8'hFF, 23'h400000};
        // Handle Infinity divided by something
        end else if (exponent1 == 8'hFF && mantissa1 == 0) begin
            if (exponent2 == 8'hFF && mantissa2 == 0) begin
                // Infinity divided by Infinity
                result = {1'b0, 8'hFF, 23'h400000};
            end else begin
                // Infinity divided by finite number
                result = {resultSign, 8'hFF, 23'b0}; 
            end
        // Handle something divided by infinity
        end else if (exponent2 == 8'hFF && mantissa2 == 0) begin
            result = {resultSign, 8'b0, 23'b0};
        // Handle division by zero
        end else if (exponent2 == 8'h00 && mantissa2 == 0) begin
            // Division by zero -> Infinity
            result = {resultSign, 8'hFF, 23'b0};
        // Handle zero divided by something
        end else if (exponent1 == 8'h00 && mantissa1 == 0) begin
            result = {resultSign, 8'b0, 23'b0};
        // Else no special case
        end else begin
            // Calculate exponent
            resultExponent = exponent1 - exponent2 + 127;

            // Calculate quotient with added precision
            mantissaQuotientExtended = mantissa1 * 24 / mantissa2;

            // Rounding
            if (mantissaQuotientExtended[47]) begin
                normalizedMantissa = mantissaQuotientExtended[46:23] + 1; // Round up
                resultExponent = resultExponent + 1; // Adjust exponent
            end else begin
                normalizedMantissa = mantissaQuotientExtended[45:22];
            end

            // Handle overflow or underflow
            if (normalizedMantissa[24]) begin
                normalizedMantissa = normalizedMantissa >> 1; // Right shift for normalization
                resultExponent = resultExponent + 1; // Increase exponent
            end else if (resultExponent <= 0) begin
                normalizedMantissa = normalizedMantissa >> (1 - resultExponent); // Right shift mantissa
                resultExponent = 0; // Clamp exponent
            end

            // Final assignment of the result
            result = {resultSign, resultExponent[7:0], normalizedMantissa[22:0]};
        end
    end
endmodule
