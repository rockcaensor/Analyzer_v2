`timescale 1ns / 1ps/////////////////////////////////////////////////////////////////////////


module summ
#(parameter WIDTH_0 = 1,
            WIDTH_1 = 2,
            WIDTH_2 = 3,
            WIDTH_3 = 4,
            WIDTH_4 = 5,
            WIDTH_5 = 6)
(
    input clk, rs, en, en_count, error_in,
    input [63:0] in_data_1,
    input [63:0] in_data_2,
    output [7:0] out_data    
    );
 
 reg [63:0] in_data;   
 
 wire [63:0] in_data_1_wire;   
 wire [1:0] bus_0[31:0];   
 wire [2:0] bus_1[15:0];
 wire [3:0] bus_2[7:0];
 wire [4:0] bus_3[3:0];  
 wire [5:0] bus_4[1:0]; 
 wire [6:0] bus_5[0:0]; 
 wire [6:0] err_sum_wire;
 
 assign in_data_1_wire[63:1] = in_data_1[63:1];
 assign in_data_1_wire[0]    = in_data_1[0] | error_in; 

   
 genvar i;
 generate for(i=0; i<32; i = i + 1) begin:
   smm0  summator #(.WIDTH(WIDTH_0)) one (.en(en_count | en), .rs(rs), .in_1(in_data[i*2]), .in_2(in_data[i*2+1]), .clk(clk), .out_data(bus_0[i]));
 end endgenerate
 
 genvar j;
 generate for(j=0; j<16; j = j + 1) begin:
   smm1  summator #(.WIDTH(WIDTH_1)) two (.en(en_count | en), .rs(rs), .in_1(bus_0[j*2]), .in_2(bus_0[j*2+1]), .clk(clk), .out_data(bus_1[j]));
 end endgenerate   
 
  genvar k;
 generate for(k=0; k<8; k = k + 1) begin:
   smm2  summator #(.WIDTH(WIDTH_2))three(.en(en_count | en), .rs(rs), .in_1(bus_1[k*2]), .in_2(bus_1[k*2+1]), .clk(clk), .out_data(bus_2[k]));
 end endgenerate 
 
   genvar l;
 generate for(l=0; l<4; l = l + 1) begin:
   smm3  summator #(.WIDTH(WIDTH_3))four(.en(en_count | en), .rs(rs), .in_1(bus_2[l*2]), .in_2(bus_2[l*2+1]), .clk(clk), .out_data(bus_3[l]));
 end endgenerate 
 
    genvar m;
 generate for(m=0; m<2; m = m + 1) begin:
   smm4  summator #(.WIDTH(WIDTH_4))five(.en(en_count | en), .rs(rs), .in_1(bus_3[m*2]), .in_2(bus_3[m*2+1]), .clk(clk), .out_data(bus_4[m]));
 end endgenerate 
 
   summator #(.WIDTH(WIDTH_5)) smm5 (.en(en_count | en), .rs(rs), .in_1(bus_4[0]), .in_2(bus_4[1]), .clk(clk), .out_data(bus_5[0]));

error_summ ers (.en(en_count | en), .rs(rs), .clk(clk), .in_data(bus_5[0]), .error_sum(out_data));
   
 always @(negedge clk)
    if(en)
        in_data <= in_data_1_wire ^ in_data_2;  
    else
        in_data = 0;
endmodule

module summator
#(parameter WIDTH = 1)
(   input clk, en, rs,
    input [WIDTH-1:0]in_1,
    input [WIDTH-1:0]in_2,
    output reg [WIDTH:0] out_data
);

always @(posedge clk)
    if (rs)
        out_data <= 0;
    else if (en)
        out_data <= in_1+in_2;
    else
        out_data <= out_data;    

endmodule

module error_summ
(
    input [6:0] in_data,
    input clk, en,
    input rs,
    output [7:0] error_sum
);

reg [7:0] count;
initial begin 
     count = 0;
    end
assign error_sum = count;

always @(posedge clk or posedge rs)
    begin
        if (rs)
            count <= 0;
        else if (en)    
            count <= count + in_data;
        else 
            count <= count;    
    end

endmodule
