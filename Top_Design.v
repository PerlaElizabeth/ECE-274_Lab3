`timescale 1ns / 1ps

module Top_Design(CLK100MHZ, BTNC, SW, CA, CB, CF, CG);
    input CLK100MHZ, BTNC;
    input [1:0] SW; //SW[1] is L, SW[0] is R
    output CA, CB, CF, CG;
    wire ClkOut;
    Lab3 RE(SW[1], SW[0], BTNC, ClkOut, CA, CB, CF, CG);
    ClkDiv L(CLK100MHZ, 0, ClkOut);
    
        
	//start writing your code below by instantiating the components
	//used for lab 3 top-level design which are ClkDiv and the light-sequence generator

    
endmodule