`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2024 15:16:52
// Design Name: 
// Module Name: lfsr_dec
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

module lfsr_counter (
    input logic clk,         
    input logic clr,        
    input logic reset,      
    output logic [3:0] lfsr_out  
);
    logic clk_out;          
    logic [3:0] Q;           

    
    Clock_1hz clk_div (
        .clk_in(clk), 
        .clk_out(clk_out)
    );

   
    four_bit_counter counter (
        .clk(clk_out), 
        .clr(clr), 
        .Q(Q)
    );

    always_ff @(posedge clk_out or posedge reset) begin
        if (reset) begin
            lfsr_out <= 4'b0000; 
        end else begin
            case (Q)
                4'b0000: lfsr_out <= 4'b0000;
                4'b0001: lfsr_out <= 4'b0001;
                4'b0010: lfsr_out <= 4'b0010;
                4'b0011: lfsr_out <= 4'b0101;
                4'b0100: lfsr_out <= 4'b1010;
                4'b0101: lfsr_out <= 4'b0100;
                4'b0110: lfsr_out <= 4'b1001;
                4'b0111: lfsr_out <= 4'b0011;
                4'b1000: lfsr_out <= 4'b0110;
                4'b1001: lfsr_out <= 4'b1101;
                4'b1010: lfsr_out <= 4'b1011;
                4'b1011: lfsr_out <= 4'b0111;
                4'b1100: lfsr_out <= 4'b1110;
                4'b1101: lfsr_out <= 4'b1100;
                4'b1110: lfsr_out <= 4'b1000;
                4'b1111: lfsr_out <= 4'b0000;
                default: lfsr_out <= 4'b0000;  
            endcase
        end
    end
endmodule
