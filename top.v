`timescale 1ns / 1ps

module top(
    input         CLK100MHZ,
    input         reset,            // btnC on nexys
    inout         TMP_SDA,          // i2c sda on temp sensor - bidirectional
    output        TMP_SCL,          // i2c scl on temp sensor
    input ACL_MISO,
    output ACL_MOSI,
    output ACL_SCLK,
    output ACL_CSN,
    output [6:0] SEG,
    output DP, 
    output [7:0] AN
);

wire [23:0] adc_data;
wire [7:0] temp_data;
 


SPI spi(
    .CLK100MHZ(CLK100MHZ),
    .ACL_MISO(ACL_MISO),
    .ACL_MOSI(ACL_MOSI),
    .ACL_SCLK(ACL_SCLK),
    .adc_data(adc_data),
    .ACL_CSN(ACL_CSN)
);

tempSens temp(
.CLK100MHZ(CLK100MHZ),
.reset(reset),
.TMP_SDA(TMP_SDA),
.TMP_SCL(TMP_SCL),
.w_data(temp_data)
);


diplayModule display(
    .CLK100MHZ(CLK100MHZ),
    .adc_value(adc_data),
    .temp_data(temp_data),          // Temp data from i2c master
    .NAN(NAN),
    .seg(SEG),
    .dp(DP),
    .an(AN)
);



endmodule