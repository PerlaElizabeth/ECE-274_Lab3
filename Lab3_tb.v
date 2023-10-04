`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 11:32:24 AM
// Design Name: 
// Module Name: Lab3_tb
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


module Lab3_tb( );
    reg L, R, Rst, Clk;
    wire CA, CB, CF, CG;
    
    Lab3 Lab3_tb(L, R, Rst, Clk, CA, CB, CF, CG);
    
    always begin
    Clk <= 1'b0;
    #100;
    Clk <= 1'b1;
    #100;
    end
    
    initial begin
    Rst <= 1;
    L <= 0;
    R <= 0;
    #200;
    Rst <= 0;
    @(posedge Clk);
    @(posedge Clk);
    #50 L <= 1;
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    #50 R <= 1;
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    #50 L <= 0;
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    @(posedge Clk);
    #50 Rst <= 1;
    @(posedge Clk);
    #50 Rst <= 0;
    
  end
    
endmodule

