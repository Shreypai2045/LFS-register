`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2024 15:39:56
// Design Name: 
// Module Name: clk
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


module Clock_1hz(
    input  logic clk_in,     
    output logic clk_out   
);

    
    logic [25:0] count = 0;

    
    always_ff @(posedge clk_in) begin
        count <= count + 1;  

        
        if (count == 50_000_000 - 1) begin
            count <= 0;              
            clk_out <= ~clk_out;     
        end
    end
endmodule

