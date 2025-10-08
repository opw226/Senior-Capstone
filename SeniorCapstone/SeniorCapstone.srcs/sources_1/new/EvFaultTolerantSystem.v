`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 01:17:46 PM
// Design Name: 
// Module Name: EvFaultTolerantSystem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EvFaultTolerantSystem( output alarm, output LCD, input maglock, input batteryLife);

    temperatureSensor tempAlarm(
        .dclk_in(clk),               // clk
        .reset_in(reset),            // rst
        .user_temp_alarm_out(alarm_led), // goes high when temp > user temp defined in ip
        .ot_out(),                   // unused
        .vccaux_alarm_out(),         // unused
        .alarm_out(),               // unused
        .eoc_out(), .eos_out(), .busy_out(), // Unused
        .channel_out(),              // unused
        .s_drp(),                    // unused
        .vp_vn()                     // unused
    );

endmodule


