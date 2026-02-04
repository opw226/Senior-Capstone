`timescale 1ns / 1ps



module top_top_top #(
        parameter DEBOUNCE_CYCLES = 500000,  
    parameter PWM_PERIOD = 5000,         
    parameter MAX_POSITION = 200,      
    parameter MIN_POSITION = 0 )(
    input         reset,            // btnC on nexys
    inout         TMP_SDA,          // i2c sda on temp sensor - bidirectional
    output        TMP_SCL,          // i2c scl on temp sensor
    input ACL_MISO,
    output ACL_MOSI,
    output ACL_SCLK,
    output ACL_CSN,
    output [6:0] SEG,
    output DP, 
    output [7:0] AN,
    
    input wire clk,
    input wire enc_a,
    input wire enc_b,
    input wire enc_btn_n,
    input wire dir_switch_r,
    input wire dir_switch_l,
    input wire reed_in,
    output wire [2:0] MOTOR_R,
    output wire [2:0] MOTOR_L,
    output wire led0
    );
    
    
    top_car_module #(
   .DEBOUNCE_CYCLES(DEBOUNCE_CYCLES),  
    .PWM_PERIOD(PWM_PERIOD),         
    .MAX_POSITION(MAX_POSITION),      
    .MIN_POSITION(MIN_POSITION)
     )
    motor_ctl(
    .clk(clk),
    .enc_a(enc_a),
    .enc_b(enc_b),
    .enc_btn_n(enc_btn_n),
    .dir_switch_r(dir_switch_r),
    .dir_switch_l(dir_switch_l),
    .reed_in(reed_in),
    .MOTOR_R(MOTOR_R),
    .MOTOR_L(MOTOR_L),
    .led0(led0)
    );
    
    top TOP (
    .CLK100MHZ(clk),
    .reset(reset),            
    .TMP_SDA(TMP_SDA),          
    .TMP_SCL(TMP_SCL),          
    .ACL_MISO(ACL_MISO),
    .ACL_MOSI(ACL_MOSI),
    .ACL_SCLK(ACL_SCLK),
    .ACL_CSN(ACL_CSN),
    .SEG(SEG),
    .DP(DP),
    .AN(AN)
    );
    
endmodule
