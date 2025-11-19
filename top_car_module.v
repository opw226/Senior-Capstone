`timescale 1ns / 1ps

module top_car_module(
    input wire clk,
    input wire [2:0] SWITCH,
    input wire reed_in,
    output wire [2:0] MOTOR_R,
    output wire [2:0] MOTOR_L,
    output wire led0
    );
    
    main_module u_motor(
    .clk(clk),
    .SWITCH(SWITCH),
    .MOTOR_R(MOTOR_R),
    .MOTOR_L(MOTOR_L)
    );
    
    reed_switch_top u_reed(
    .clk(clk),
    .reed_in(reed_in),
    .led0(led0)
    );
    
endmodule
