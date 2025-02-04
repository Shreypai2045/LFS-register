`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2024 15:47:49
// Design Name: 
// Module Name: four_bit_counter
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
module four_bit_counter (
    input logic clk,    
    input logic clr,    
    output logic [3:0] Q 
);

    
    always_ff @(posedge clk or posedge clr) begin
        if (clr) begin
            Q <= 4'b0000;  
        end else begin
            Q <= Q + 1;    
        end
    end
endmodule
