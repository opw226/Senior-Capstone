## clock
set_property PACKAGE_PIN E3 [get_ports {clk}];
create_clock -name sysclk -period 10 -waveform {0 5} [get_ports {clk}];
set_property IOSTANDARD LVCMOS33 [get_ports {clk}];

## motor pins -Pmod
## IN3
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {MOTOR[0]}];
## IN4
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {MOTOR[1]}];
## ENB
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {MOTOR[2]}];

## switches for controlling the motor
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {SWITCH[0]}];
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {SWITCH[1]}];
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {SWITCH[2]}];

## Reed switch input
set_property PACKAGE_PIN C17 [get_ports reed_in]
set_property IOSTANDARD LVCMOS33 [get_ports reed_in]
set_property PULLUP true [get_ports reed_in]

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { led0 }];