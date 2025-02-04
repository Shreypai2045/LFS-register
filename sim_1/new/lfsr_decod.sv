`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2024 15:21:31
// Design Name: 
// Module Name: lfsr_decod
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
module tb_lfsr_counter;

    
    logic clk;            
    logic clr;        
    logic reset;          
    logic [3:0] lfsr_out; 

  
    lfsr_counter uut (
        .clk(clk), 
        .clr(clr), 
        .reset(reset), 
        .lfsr_out(lfsr_out)
    );

    
    always begin
        #5 clk = ~clk; 
    end

   
    initial begin
       
        clk = 0;
        clr = 0;
        reset = 0;

      
        $monitor("Time = %0t | lfsr_out = %b | clr = %b | reset = %b", $time, lfsr_out, clr, reset);

       
        $display("Test Case 1: Reset the counter");
        reset = 1;     
        #20 reset = 0;
        #40;           

      
        $display("Test Case 2: Apply clear signal");
        clr = 1;       
        #20 clr = 0;   
        #40;           
       
        $display("Test Case 3: Simulate LFSR behavior");
        #200; 

        
        $display("Test Case 4: Reset and clear at the same time");
        reset = 1;    
        clr = 1;     
        #20;           
        reset = 0;     
        clr = 0;       
        #40;           

     
        $display("Test Case 5: Let LFSR counter run freely");
        #1000;

       
        $finish;
    end

endmodule


