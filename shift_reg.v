module shift_reg
 #( parameter shift = 1)
(
    input clk, data_in,    
    output out_0);
 

   reg [shift-1:0] reg_0 = {shift{1'b0}};

   always @(posedge clk)
      begin
      if (shift == 1)
        reg_0 <= data_in;
      
      else
        reg_0  <= {data_in, reg_0[shift-1:1]};
      end

   assign out_0 = reg_0[0];
					
endmodule	