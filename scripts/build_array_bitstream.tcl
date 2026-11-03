# ==============================================================================
# Script: build_array_bitstream.tcl
# Description:
#   Non-project batch build for the 128-Core CBDC-PUF Array on Digilent Basys 3
#   (Xilinx Artix-7 XC7A35TCPG236-1).
#
# Usage:
#   vivado -mode batch -source scripts/build_array_bitstream.tcl
# ==============================================================================

set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_array_128
file mkdir $out

set_param general.maxThreads 8

# Create in-memory project
create_project -in_memory -part xc7a35tcpg236-1

# Read RTL Sources
read_verilog [list \
    $root/rtl/cbdc_uart.v \
    $root/rtl/cbdc_button.v \
    $root/rtl/cbdc_puf_element.v \
    $root/rtl/cbdc_puf_chain.v \
    $root/rtl/cbdc_puf_core.v \
    $root/rtl/cbdc_puf_ctrl.v \
    $root/rtl/response_assembly.v \
    $root/rtl/cbdc_puf_array_serial.v \
    $root/rtl/bch_31_16_3.v \
    $root/rtl/sha3_2048_wrapper.v \
]

# Read Constraints
read_xdc $root/constraints/basys3_serial.xdc
read_xdc $root/constraints/puf_feedback_acknowledge.xdc
if {[file exists $root/constraints/puf_128cores_placement.xdc]} {
    puts "Applying 128-core symmetrical physical placement constraints..."
    read_xdc $root/constraints/puf_128cores_placement.xdc
}

# Synthesis
puts "=== Running Synthesis (Top: cbdc_puf_array_serial) ==="
synth_design -top cbdc_puf_array_serial -part xc7a35tcpg236-1 -flatten_hierarchy rebuilt

write_checkpoint -force $out/post_synth.dcp
report_utilization -file $out/post_synth_utilization.rpt

# Implementation: Opt, Place, Route
puts "=== Running Logic Optimization ==="
opt_design

puts "=== Running Placement ==="
place_design

puts "=== Running Routing ==="
route_design

write_checkpoint -force $out/post_route.dcp

# Reports
puts "=== Generating Implementation Reports ==="
report_utilization -file $out/post_route_utilization.rpt
report_timing_summary -file $out/post_route_timing.rpt
report_route_status -file $out/post_route_status.rpt

# Bitstream Generation
puts "=== Generating Bitstream ==="
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
write_bitstream -force $out/cbdc_puf_array_128cores.bit

puts "=========================================================================="
puts "Build Complete! Bitstream: $out/cbdc_puf_array_128cores.bit"
puts "=========================================================================="
