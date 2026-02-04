`timescale 1ns / 1ps

module top_car_module #(
    parameter DEBOUNCE_CYCLES = 500000,  
    parameter PWM_PERIOD = 5000,         
    parameter MAX_POSITION = 200,      
    parameter MIN_POSITION = 0 )(
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
    
    wire rst = 1'b0;
    wire motor_r_in3;
    wire motor_r_in4;
    wire motor_r_enb;
    
    motor_encoder_top #(
        .DEBOUNCE_CYCLES(DEBOUNCE_CYCLES),
        .PWM_PERIOD(PWM_PERIOD),
        .MAX_POSITION(MAX_POSITION),
        .MIN_POSITION(MIN_POSITION)
    ) motor_right_ctrl (
        .clk(clk),
        .rst(rst),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .enc_btn_n(enc_btn_n),
        .dir_switch(dir_switch_r),
        .motor_in3(motor_r_in3),
        .motor_in4(motor_r_in4),
        .motor_enb(motor_r_enb)
    );
    
    assign MOTOR_R[0] = motor_r_in3;
    assign MOTOR_R[1] = motor_r_in4;
    assign MOTOR_R[2] = motor_r_enb;
    
    
    wire motor_l_in3;
    wire motor_l_in4;
    wire motor_l_enb;
    
    motor_encoder_top #(
        .DEBOUNCE_CYCLES(DEBOUNCE_CYCLES),
        .PWM_PERIOD(PWM_PERIOD),
        .MAX_POSITION(MAX_POSITION),
        .MIN_POSITION(MIN_POSITION)
    ) motor_left_ctrl (
        .clk(clk),
        .rst(rst),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .enc_btn_n(enc_btn_n),
        .dir_switch(dir_switch_l),
        .motor_in3(motor_l_in3),
        .motor_in4(motor_l_in4),
        .motor_enb(motor_l_enb)
    );
    
    assign MOTOR_L[0] = motor_l_in3;
    assign MOTOR_L[1] = motor_l_in4;
    assign MOTOR_L[2] = motor_l_enb;
    
    reed_switch_top u_reed(
    .clk(clk),
    .reed_in(reed_in),
    .led0(led0)
    );
    
endmodule
