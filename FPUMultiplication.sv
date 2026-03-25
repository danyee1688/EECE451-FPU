`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Yee
// 
// Create Date: 12/02/2024 09:09:22 PM
// Design Name: 
// Module Name: FPUMultiplier
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

module FPUMultiplier (
    input  logic [31:0] input1,
    input  logic [31:0] input2,
    output logic [31:0] product
);
    // Signals
    logic sign1; 
    logic sign2;
    logic productSign;
    logic [7:0] exponent1;
    logic [7:0] exponent2;
    logic [7:0] productExponent;
    logic [23:0] mantissa1;
    logic [23:0] mantissa2;
    logic [23:0] productMantissa;
    logic [47:0] mantissaProduct; 

    // Initial Assignments
    assign sign1 = input1[31];
    assign sign2 = input2[31];
    assign exponent1 = input1[30:23];
    assign exponent2 = input2[30:23];
    assign mantissa1 = (exponent1 == 8'hFF) ? {1'b0, input1[22:0]} : (exponent1 == 8'h00) ? {1'b0, input1[22:0]} : {1'b1, input1[22:0]}; 
    assign mantissa2 = (exponent2 == 8'hFF) ? {1'b0, input2[22:0]} : (exponent2 == 8'h00) ? {1'b0, input2[22:0]} : {1'b1, input2[22:0]}; 
    
    // Compute the product's sign
    assign productSign = sign1 ^ sign2;

    // Multiply the mantissas
    assign mantissaProduct = mantissa1 * mantissa2;

    // Start of procedural process
    always_comb begin
        // Handle NaN inputs
        if ((exponent1 == 8'hFF && mantissa1 != 0) || (exponent2 == 8'hFF && mantissa2 != 0)) begin
            product = {1'b0, 8'hFF, (input1[22:0] | input2[22:0]) | 23'h400000};
        // Handle Infinity * zero
        end else if ((exponent1 == 8'hFF && mantissa1 == 0 && exponent2 == 8'h00 && mantissa2 == 0) ||
                 (exponent2 == 8'hFF && mantissa2 == 0 && exponent1 == 8'h00 && mantissa1 == 0)) begin
            product = {1'b0, 8'hFF, 23'h400000};
        // Handle Infinity * Infinity
        end else if ((exponent1 == 8'hFF && mantissa1 == 0) && (exponent2 == 8'hFF && mantissa2 == 0)) begin
            product = {productSign, 8'hFF, 23'b0}; // Infinity
        // Handle zero inputs
        end else if ((exponent1 == 8'h00 && mantissa1 == 0) || (exponent2 == 8'h00 && mantissa2 == 0)) begin
            product = {productSign, 8'b0, 23'b0}; // Zero
        // Else no special case
        end else begin
            // Compute exponent
            productExponent = exponent1 + exponent2 - 127;

            // Normalize mantissa product
            if (mantissaProduct[47]) begin
                productMantissa = mantissaProduct[46:24];
                productExponent = productExponent + 1;
            end else begin
                productMantissa = mantissaProduct[45:23];
            end

            // Handle overflow or underflow
            // If overflow, product is infinity
            // If underflow, product is zero
            if (productExponent >= 8'hFF) begin
                product = {productSign, 8'hFF, 23'b0};
            end else if (productExponent <= 0) begin
                product = {productSign, 8'b0, 23'b0};
            end else begin
                product = {productSign, productExponent[7:0], productMantissa[22:0]};
            end
        end
    end
    
endmodule


