`timescale 1ns / 1ps
//paramerized counter
module ud_counter
#(parameter WIDTH = 7, FIRST_VALUE = 0, END_VALUE = 4, LEFT = 1)
    (input clk, en, rs, up,
     output [WIDTH-1:0] count_out,
     output reg max_value,   
     output reg null_out     
    );

reg [WIDTH-1:0] count = FIRST_VALUE;

assign count_out = count;
  
always @(posedge clk or posedge rs)
begin
        if (rs)
            begin
                count <= 0;
                max_value <= 0;
            end    
        else if (en)
            begin
                if (count == END_VALUE)
                    begin
                        count <= 0;   
                        max_value <= 0;                 
                    end
                    
                else if (count == END_VALUE - LEFT)
                    begin
                        if(up)
                            begin
                                count <= count + 1;
                                max_value <= 1;
                            end
                        else
                            begin
                                count <= count - 1;
                                max_value <= 1;
                            end    
                    end    
                else
                    begin
                        if(up)
                            begin
                                count <= count + 1;
                                max_value <= 0;
                            end
                        else
                            begin
                                count <= count - 1;
                                max_value <= 0;
                            end   
                    end
            end    
end        
always @(posedge clk or posedge rs)
     if (rs)
            begin
                null_out <= 0;                
            end   
    
    else
        begin
            if (count == 1 & (~up))
                null_out = 1;
            else
                null_out = 0;    
        end       
endmodule
