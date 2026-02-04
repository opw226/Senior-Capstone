`timescale 1ns / 1ps

module Debouncer #(
    parameter integer SAMPLE_DIV = 100  // 100MHz / 100 = 1 us
)(
    input  wire clk,
    input  wire Ain,
    input  wire Bin,
    output reg  Aout = 1'b0,
    output reg  Bout = 1'b0
);
  reg [$clog2(SAMPLE_DIV)-1:0] div = 0;
  reg sa = 1'b0, sb = 1'b0;

  always @(posedge clk) begin
    sa <= Ain;
    sb <= Bin;

    if (div == SAMPLE_DIV-1) begin
      div <= 0;
      if (sa == Ain) Aout <= Ain;
      if (sb == Bin) Bout <= Bin;
    end else begin
      div <= div + 1;
    end
  end
endmodule