`timescale 1ns / 1ps

module d_trigger
#(parameter WIDTH = 1)
(
    input clk,
    input en,
    input rs,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
    );
 
always @(posedge clk or posedge rs)
    if (rs)
        q <= 0;
    else if(en)
        q <= d;
    else
        q <= q;            
    
endmodule

module d_trigger_neg
#(parameter WIDTH = 1)
(
    input clk,
    input en,
    input rs,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
    );
 
always @(negedge clk or posedge rs)
    if (rs)
        q <= 0;
    else if(en)
        q <= d;
    else
        q <= q;            
    
endmodule