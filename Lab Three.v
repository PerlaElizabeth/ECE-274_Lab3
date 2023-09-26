`timescale 1ns / 1ps


    //Nexys4DDR_Master()
    /*
module LabThree(S3, S2, S1, S0, L, R, Res, D3, D2, D1, D0, CA, CB, CF, CG);
    input S3, S2, S1, S0, L, R, Res;
    output D3, D2, D1, D0, CA, CB, CF, CG;
    reg D3, D2, D1, D0, CA, CB, CF, CG;
    */

module LabThree(Clk, Res, L, R, reg C);
    input Clk, Res, L, R;
    output reg [3:0] C; //C is our LED output [A, B, F, G]
    reg [3:0] State, [3:0] Dest;

    C =     4'b0000;
    Dest =  4'b0000;
    State = 4'b0000;

    // Define the states
    parameter S0  = 4'b0000; //State 0 "OFF"

    parameter S1  = 4'b0001; //State 1 "Right state 1"
    parameter S2  = 4'b0010; //State 2 "Right state 2"
    parameter S3  = 4'b0011; //State 3 "Right state 3"
    parameter S4  = 4'b0100; //State 4 "Right state 4"

    parameter S5  = 4'b0101; //State 5 "Left state 1"
    parameter S6  = 4'b0110; //State 6 "Left state 2"
    parameter S7  = 4'b0111; //State 7 "Left state 3"
    parameter S8  = 4'b1000; //State 8 "Left state 4"

    parameter S9  = 4'b1001; //State 9 "Flash state 0"
    parameter S10 = 4'b1010; //State 10 "Flash state 1"


    always @ (*)
        begin

            //if (Res) Dest <= S0;
            //Can this just go here??

            case (State)
                //Off state
                S0: begin
                    C <= 4'b1111;
                    if (!L && R) Dest <= S1;
                    else if (L && !R) Dest <= S5;
                    else if (L && R) Dest <= S9;
                    else Dest <= S0;
                    //State =??
                end

                //Branch R
                S1: begin
                    C <= 4'b0111;
                    if (Res) Dest <= S0;
                    else Dest <= S2;
                end

                S2: begin
                    C <= 4'b0011;
                    if (Res) Dest <= S0;
                    else Dest <= S3;
                end

                s3: begin
                    C <= 4'b0001;
                    if (Res) Dest <= S0;
                    else Dest <= S4;
                end

                S4: begin
                    C <= 4'b0000;
                    if (Res) Dest <= S0;
                    else Dest <= S1;
                end

                //Branch L
                S5: begin
                    C <= 4'b0111;
                    if (Res) Dest <= S0;
                    else Dest <= S6;
                end

                S6: begin
                    C <= 4'b0101;
                    if (Res) Dest <= S0;
                    else Dest <= S7;
                end

                S7: begin
                    C <= 4'b0100;
                    if (Res) Dest <= S0;
                    else Dest <= S8;
                end

                S8: begin
                    C <= 4'b0000;
                    if (Res) Dest <= S0;
                    else Dest <= S5;
                end

                //Branch L & R

                S9: begin
                    C <= 4'b1111;
                    if (Res) Dest <= S0;
                    else Dest <= S10
                end

                S10: begin
                    C <= 4'b0000;
                    if (Res) Dest <= S0;
                    else Dest <= S9;
                end

                //Default Case
                default begin
                    C <= 4'b1111;
                    Dest <= S0;
                end

            endcase
        end


        always @(posedge Clk) 
        begin
            if (Res) State <= S0;
            else State <= Dest;
        end
endmodule