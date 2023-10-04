`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 11:28:19 AM
// Design Name: 
// Module Name: Lab3
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


module Lab3(L, R, Rst, Clk, CA, CB, CF, CG);
    input L, R, Rst, Clk;
    output reg CA, CB, CF, CG;
    
    reg[3:0] State, NextState;
    parameter S0 = 0, SR1 = 1, SR2 = 2, SR3 = 3, SR4 =4, SL1 = 5, SL2 = 6, SL3 = 7, SL4 = 8, SA = 9;
    
    always @(State, L, R)begin
    
        case(State)  // RIGHT SIDE
        S0: begin
        CA <= 1; CB <=1; CF <=1; CG <=1;
        if(L == 1 & R ==1)
            NextState <= SA;
        else if(L == 0 & R == 1)
            NextState <= SR1;
        else if (L == 1 & R ==0)
            NextState <= SL1;
        else
            NextState <= S0;
        end
        
        
        SR1: begin
        CA <= 0; CB <=1; CF <=1; CG <=1;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 0 & R == 1)
            NextState <= SR2;
        else if (L == 1 & R ==0)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SR2: begin
        CA <= 0; CB <=0; CF <=1; CG <=1;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 0 & R == 1)
            NextState <= SR3;
        else if (L == 1 & R ==0)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SR3: begin
        CA <= 0; CB <=0; CF <=1; CG <=0;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 0 & R == 1)
            NextState <= SR4;
        else if (L == 1 & R ==0)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SR4: begin
        CA <= 0; CB <=0; CF <=0; CG <=0;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 0 & R == 1)
            NextState <= SR1;
        else if (L == 1 & R ==0)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
       
        // LEFT SIDE
        SL1: begin
        CA <= 0; CB <=1; CF <=1; CG <=1;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 1 & R == 0)
            NextState <= SL2;
        else if (L == 0 & R ==1)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SL2: begin
        CA <= 0; CB <=1; CF <=0; CG <=1;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 1 & R == 0)
            NextState <= SL3;
        else if (L == 0 & R ==1)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SL3: begin
        CA <= 0; CB <=1; CF <=0; CG <=0;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 1 & R == 0)
            NextState <= SL4;
        else if (L == 0 & R == 1)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SL4: begin
        CA <= 0; CB <=0; CF <=0; CG <=0;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 1 & R == 0)
            NextState <= SL1;
        else if (L == 0 & R ==1)
            NextState <= S0;
        else
            NextState <= S0;
        end
        
        
        SA: begin
        CA <= 0; CB <=0; CF <=0; CG <=0;
        if(L == 1 & R ==1)
            NextState <= S0;
        else if(L == 1 & R == 0)
            NextState <= S0;
        else if (L == 0 & R ==1)
            NextState <= S0;
        else
            NextState <= S0;
        end   
        
        default: begin
            CA <= 1; CB <= 1; CF <=1; CG <=1;
            NextState <= S0;
            end
        endcase
        end
        
    always @(posedge Clk) begin
        if( Rst == 1)
        State <= S0;
        else
        State <= NextState;
        end

endmodule
