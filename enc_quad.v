`timescale 1ns / 1ps

module enc_quad (
  input  wire       clk,        // 100 MHz
  input  wire       enc_a,      // raw A (with pull-up)
  input  wire       enc_b,      // raw B (with pull-up)
  input  wire       btn_rst,    // optional: encoder pushbutton to reset speed
  output reg        step_p,     // 1 clk pulse when a step occurs
  output reg        dir,        // 1 = CW, 0 = CCW
  output reg [15:0] pos         // signed-ish count (wraps), for debug if needed
);
  // 1) synchronize inputs (2-flop)
  reg a1=1,b1=1,a2=1,b2=1;
  always @(posedge clk) begin
    a1 <= enc_a; a2 <= a1;
    b1 <= enc_b; b2 <= b1;
  end

  // 2) very light debounce by sampling at ~1 MHz (every 100 cycles)
  reg [6:0] div=0;
  reg da=1, db=1;       // debounced
  reg pa=1, pb=1;       // previous debounced
  always @(posedge clk) begin
    if (div==7'd99) begin
      div <= 0;
      pa <= da; pb <= db;
      da <= a2; db <= b2;
    end else begin
      div <= div + 1;
    end
  end

  // 3) quadrature: track 2-bit state transitions
  // states: 00,01,11,10 are valid; other transitions = bounce, ignore
  reg [1:0] prev=2'b11;
  wire [1:0] cur = {da,db};

  function signed [1:0] quad_dir;
    input [1:0] s0, s1;
    begin
      // CW edges: 00->01->11->10->00 (+1)
      // CCW edges: 00->10->11->01->00 (-1)
      case ({s0,s1})
        4'b00_01,4'b01_11,4'b11_10,4'b10_00: quad_dir =  1;
        4'b00_10,4'b10_11,4'b11_01,4'b01_00: quad_dir = -1;
        default:                               quad_dir =  0; // invalid/duplicate
      endcase
    end
  endfunction

  always @(posedge clk) begin
    step_p <= 1'b0;
    if (div==0) begin
      // only evaluate on the 1MHz "tick" that updated debounced lines
      if (cur != prev) begin
        case (quad_dir(prev,cur))
          1:  begin dir<=1; step_p<=1; pos <= pos + 1; end
         -1:  begin dir<=0; step_p<=1; pos <= pos - 1; end
          0:  /* ignore */ ;
        endcase
        prev <= cur;
      end
    end
    if (btn_rst) pos <= 0; // pushbutton resets "speed" level if you want
  end
endmodule
