vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../SeniorCapstone.gen/sources_1/ip/temperatureSensor/temperatureSensor.v" \


vlog -work xil_defaultlib \
"glbl.v"

