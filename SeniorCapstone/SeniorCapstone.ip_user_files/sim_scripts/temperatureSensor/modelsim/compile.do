vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../SeniorCapstone.gen/sources_1/ip/temperatureSensor/temperatureSensor.v" \


vlog -work xil_defaultlib \
"glbl.v"

