`timescale 1ns / 1ps

module constant
#(parameter VALUE = 1)
(
    output reg cont_out
);
initial
begin
    if (VALUE==0)
        cont_out <= 0;
    else
        cont_out <= 1;   
end

endmodule
