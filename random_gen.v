module random_gen
#(parameter BITS = 64, INITIAL_VALUE = 64'h 5083_e3e3_8587_694b)(
input clk, en, rs,
output [BITS-1:0] random_data
    );
    
reg [BITS-1:0] shift_reg;
integer i;
assign random_data = shift_reg;

initial begin shift_reg = INITIAL_VALUE; end

always @(posedge clk or posedge rs)
    begin
        if(rs)
            begin
              shift_reg <= INITIAL_VALUE;  
            end
        else if(en)
            begin
                if(en)
                    begin
                        for (i = 1; i<BITS; i = i + 1)
                            begin
                                shift_reg[0] <= ((shift_reg[3] ^ shift_reg[12]));
                                shift_reg[i] <= shift_reg[i-1];
                            end //for
                    end  //begin
                else
                    shift_reg[i] <= shift_reg[i];        
            end
    end

endmodule

module random_gen_neg
#(parameter BITS = 64,  INITIAL_VALUE = 64'h 5083_e3e3_8587_694b)(
input clk, en, rs,
output [BITS-1:0] random_data
    );
    
reg [BITS-1:0] shift_reg;
integer i;
assign random_data = shift_reg;

initial begin shift_reg = INITIAL_VALUE; end

always @(negedge clk or posedge rs)
    begin
        if(rs)
            begin
              shift_reg <= INITIAL_VALUE;  
            end
        else
            begin
                if(en)
                    begin
                        for (i = 1; i<BITS; i = i + 1)
                            begin
                                shift_reg[0] <= ((shift_reg[3] ^ shift_reg[12]));
                                shift_reg[i] <= shift_reg[i-1];
                            end //for
                    end  //begin
                else
                    shift_reg[i] <= shift_reg[i];        
            end
    end
endmodule