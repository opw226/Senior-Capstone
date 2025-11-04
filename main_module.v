`timescale 1ns / 1ps

module main_module(input CLK, input [2:0] SWITCH, output [2:0] MOTOR);

    reg [2:0] control = 3'b000;
    
    integer periodLength = 1000000;
    
    integer pulseLength1 = 200000;
    integer pulseLength2 = 900000;
    integer pulseLength = 0;
    
    integer counter = 0;
    
    always @(posedge CLK)
    begin
        if (counter < periodLength) counter <=counter+1;
        else counter<=0;
    end
    
    always @(SWITCH)
    begin
    casez(SWITCH)
    3'b??0: begin
                control=3'b000;
            end
    3'b001: control=3'b001;
    3'b101: control=3'b101;
    3'b011: control=3'b010;
    3'b111: control=3'b110;
    default: control=3'b000;
    
    endcase
    
    if (control[2]==1'b0)
        pulseLength=pulseLength1;
    else
        pulseLength=pulseLength2;
    end
    
assign MOTOR[0] = control[0];
assign MOTOR[1] = control[1];
assign MOTOR[2] = (pulseLength>counter) ? 1'b1:1'b0;
    
endmodule
