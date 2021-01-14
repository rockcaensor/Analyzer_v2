//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Jun 30 19:58:15 2020
//Host        : CST_PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

 
module Analyzer_v2
   #(parameter WIDTH_1 = 26, BRAM_COUNT = 65536010, INITIAL_VALUE = 64'h 5083_e3e3_8587_694b)
   (   
    clk_p,
    end_of_bram,
    compare_start,
    error_in,
    error_summ,
    random_data_0,
    random_data_1,
    returned_data,
    rs,
    end_compare,
    test_start,
    test_stop);
  output end_compare;
  input clk_p;
  input end_of_bram;
  input compare_start;
  input error_in;
  output [7:0]error_summ;
  output [63:0]random_data_0;
  output [63:0]random_data_1;
  input [63:0]returned_data;
  input rs;
  input test_start;
  input test_stop;

  wire clk_0_1;
  wire constant_0_cont_out;
  wire [0:0]d_trigger_0_q;
  wire [0:0]d_trigger_1_q;
  wire [0:0]d_trigger_2_q;
  wire en_0_1;
  wire error_in_0_1;
  wire [63:0]random_gen_0_random_data;
  wire [63:0]random_gen_1_random_data;
  wire [63:0]returned_data_1;
  wire rs_0_1;
  wire shift_reg_0_out_0;
  wire shift_reg_1_out_0;
  wire shift_reg_2_out_0;
  wire shift_reg_3_out_0;
  wire [7:0]summ_0_out_data;
  wire test_start_1;
  wire test_stop_1;
  wire [6:0]ud_counter_1_count_out;
  wire ud_counter_1_null_out;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_1_Res;
  wire [0:0]util_vector_logic_2_Res;
  wire [0:0]util_vector_logic_3_Res;
  wire [0:0]util_vector_logic_4_Res;
  wire [0:0]util_vector_logic_5_Res;
  wire [0:0]util_vector_logic_6_Res;
  wire [0:0]util_vector_logic_7_Res;
  wire [0:0]util_vector_logic_8_Res;
  wire [0:0]util_vector_logic_9_Res;

  
  assign clk_0_1 = clk_p;
  assign en_0_1 = compare_start;
  assign error_in_0_1 = error_in;
  assign error_summ[7:0] = summ_0_out_data;
  assign random_data_0[63:0] = random_gen_0_random_data;
  assign random_data_1[63:0] = random_gen_1_random_data;
  assign returned_data_1 = returned_data[63:0];
  assign rs_0_1 = rs;
  assign test_start_1 = test_start;
  assign test_stop_1 = test_stop;
  assign end_compare = ud_counter_1_null_out;
  assign util_vector_logic_0_Res = d_trigger_1_q | d_trigger_0_q;
//  design_1_util_vector_logic_0_0 util_vector_logic_0
//       (.Op1(d_trigger_1_q),
//        .Op2(d_trigger_0_q),
//        .Res(util_vector_logic_0_Res));
  assign util_vector_logic_1_Res =  end_of_bram & d_trigger_2_q;     
//  design_1_util_vector_logic_0_1 util_vector_logic_1
//       (.Op1(ud_counter_0_max_value),
//        .Op2(d_trigger_2_q),
//        .Res(util_vector_logic_1_Res));
        
 assign util_vector_logic_2_Res = rs_0_1 | shift_reg_0_out_0; 
// design_1_util_vector_logic_0_2 util_vector_logic_2
//       (.Op1(rs_0_1),
//        .Op2(shift_reg_0_out_0),
//        .Res(util_vector_logic_2_Res));
 assign  util_vector_logic_3_Res =  ~d_trigger_2_q;     
//  design_1_util_vector_logic_3_0 util_vector_logic_3
//       (.Op1(d_trigger_2_q),
//        .Res(util_vector_logic_3_Res));
  assign util_vector_logic_4_Res =  end_of_bram & util_vector_logic_3_Res;      
//  design_1_util_vector_logic_1_0 util_vector_logic_4
//       (.Op1(ud_counter_0_max_value),
//        .Op2(util_vector_logic_3_Res),
//        .Res(util_vector_logic_4_Res));
  assign util_vector_logic_5_Res = ~d_trigger_0_q; 
//  design_1_util_vector_logic_3_1 util_vector_logic_5
//       (.Op1(d_trigger_0_q),
//        .Res(util_vector_logic_5_Res));
  assign  util_vector_logic_6_Res = util_vector_logic_0_Res & util_vector_logic_5_Res;     
//  design_1_util_vector_logic_4_0 util_vector_logic_6
//       (.Op1(util_vector_logic_0_Res),
//        .Op2(util_vector_logic_5_Res),
//        .Res(util_vector_logic_6_Res));
assign   util_vector_logic_7_Res =    test_start_1 | rs_0_1;  
//  design_1_util_vector_logic_0_4 util_vector_logic_7
//       (.Op1(test_start_1),
//        .Op2(rs_0_1),
//        .Res(util_vector_logic_7_Res));
 assign util_vector_logic_8_Res =  ud_counter_1_null_out | rs_0_1;      
//  design_1_util_vector_logic_0_3 util_vector_logic_8
//       (.Op1(ud_counter_1_null_out),
//        .Op2(rs_0_1),
//        .Res(util_vector_logic_8_Res));
 assign  util_vector_logic_9_Res = shift_reg_2_out_0 | shift_reg_3_out_0;      
//  design_1_util_vector_logic_0_5 util_vector_logic_9
//       (.Op1(shift_reg_2_out_0),
//        .Op2(shift_reg_3_out_0),
//        .Res(util_vector_logic_9_Res));
  constant constant_0
       (.cont_out(constant_0_cont_out));
       
  d_trigger d_trigger_0
       (.clk(clk_0_1),
        .d(constant_0_cont_out),
        .en(test_start_1),
        .q(d_trigger_0_q),
        .rs((end_of_bram & test_stop) | rs));
        
 d_trigger d_trigger_1
       (.clk(compare_start),
        .d(constant_0_cont_out),
        .en(constant_0_cont_out),
        .q(d_trigger_1_q),
        .rs(util_vector_logic_8_Res));
        
 d_trigger_neg d_trigger_2
       (.clk(clk_0_1),
        .d(constant_0_cont_out),
        .en(test_stop_1), 
        .q(d_trigger_2_q),
        .rs(util_vector_logic_2_Res));
        
 random_gen_neg #(.INITIAL_VALUE(INITIAL_VALUE)) random_gen_0
       (.clk(clk_0_1),
        .en(d_trigger_0_q),
	  .rs(rs_0_1),        
        .random_data(random_gen_0_random_data));
        
 random_gen #(.INITIAL_VALUE(INITIAL_VALUE)) random_gen_1
       (.clk(clk_0_1),
        .en(d_trigger_1_q | shift_reg_2_out_0),  
	   .rs(rs_0_1),     
        .random_data(random_gen_1_random_data));
        
 shift_reg shift_reg_0
       (.clk(clk_0_1),
        .data_in(util_vector_logic_1_Res),
        .out_0(shift_reg_0_out_0));
        
 shift_reg  #(.shift(10)) shift_reg_1
       (.clk(clk_0_1),
        .data_in(d_trigger_1_q),
        .out_0(shift_reg_1_out_0));
        
 shift_reg shift_reg_2
       (.clk(clk_0_1),// was negedge
        .data_in(d_trigger_1_q),
        .out_0(shift_reg_2_out_0));
        
// shift_reg shift_reg_3
//       (.clk(clk_0_1),// was negedge
//        .data_in(util_vector_logic_6_Res),
//        .out_0(shift_reg_3_out_0));
        
 summ summ_0
       (.clk(clk_0_1),
        .en(d_trigger_1_q),
        .en_count(shift_reg_1_out_0),
        .error_in(error_in_0_1),
        .in_data_1(returned_data_1),
        .in_data_2(random_gen_1_random_data),
        .out_data(summ_0_out_data),
        .rs(test_start_1));
        
// ud_counter #(.END_VALUE(BRAM_SIZE), .WIDTH(WIDTH_0)) ud_counter_0
//       (.clk(clk_0_1),
//        .en(shift_reg_1_out_0),
//        .max_value(ud_counter_0_max_value),
//        .rs(rs_0_1),
//        .up(util_vector_logic_0_Res));
        
  ud_counter #(.END_VALUE(BRAM_COUNT), .WIDTH(WIDTH_1))  ud_counter_1
       (.clk(end_of_bram),        
        .en(util_vector_logic_0_Res),
        .null_out(ud_counter_1_null_out),
        .rs(util_vector_logic_7_Res),
        .up(d_trigger_0_q));      
endmodule
