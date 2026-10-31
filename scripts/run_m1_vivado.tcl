#===============================================================================
# File: scripts/run_m1_vivado.tcl
# Description:
#   Automated Vivado batch script for Milestone 1 (M1-M3):
#     1. Compiles RTL only (excluding sim/) and runs Out-of-Context synthesis
#        targeting the Basys 3 Artix-7 FPGA (xc7a35tcpg236-1).
#     2. Verifies that DONT_TOUCH preserved every LUT2, LUT3, and FDCE_1
#        primitive without merging or deleting the combinational loop (Test 8).
#     3. Generates utilization and loop check reports.
#
# Usage (from project root directory):
#   vivado -mode batch -source scripts/run_m1_vivado.tcl
#===============================================================================

set part_num "xc7a35tcpg236-1"
file mkdir build_m1

puts "=== \[M1/M3\] Reading synthesizable RTL files (strictly excluding sim/) ==="
read_verilog [list \
    rtl/cbdc_puf_element.v \
    rtl/cbdc_puf_chain.v \
    rtl/cbdc_puf_core.v \
    rtl/cbdc_puf_ctrl.v \
]

puts "=== \[M3\] Synthesizing cbdc_puf_core (Style P: 3 LUTs/element) ==="
synth_design -top cbdc_puf_core -part $part_num -mode out_of_context

report_utilization -file build_m1/cbdc_puf_core_style_p_util.rpt

# Count preserved primitives in the post-synthesis netlist (Test 8)
set num_lut2 [llength [get_cells -hierarchical -filter {REF_NAME == LUT2}]]
set num_lut3 [llength [get_cells -hierarchical -filter {REF_NAME == LUT3}]]
set num_fdce [llength [get_cells -hierarchical -filter {REF_NAME =~ FDCE*}]]

puts "-------------------------------------------------------------------------"
puts "Post-Synthesis Primitive Audit (Style P, 1 Instance):"
puts "  LUT2 count : $num_lut2  (Expected: 66 = 64 buffer/inverter + 2 entrance gates)"
puts "  LUT3 count : $num_lut3  (Expected: 32 = 16 upper muxes + 16 lower muxes)"
puts "  FDCE count : $num_fdce  (Expected: 1  = negative-edge arbiter DFF)"
puts "-------------------------------------------------------------------------"

if {$num_lut2 != 66 || $num_lut3 != 32 || $num_fdce != 1} {
    puts "ERROR: Primitive count mismatch in Style P synthesis!"
    exit 1
} else {
    puts "PASS \[Test 8 - Style P\]: Exact primitive counts preserved."
}

# Inspect combinational loop DRC (LUTLP-1) to confirm it points ONLY at our PUF loop
report_drc -checks {LUTLP-1} -file build_m1/cbdc_puf_core_loop_drc.rpt
puts "Saved combinational loop DRC report to build_m1/cbdc_puf_core_loop_drc.rpt"

write_checkpoint -force build_m1/cbdc_puf_core_style_p_synth.dcp

puts "=== \[M3\] Synthesizing cbdc_puf_core (Style 2LUT: Table 1 Count Check) ==="
synth_design -top cbdc_puf_core -part $part_num -mode out_of_context -generic {ELEMENT_STYLE=1}

set num_lut2_v2 [llength [get_cells -hierarchical -filter {REF_NAME == LUT2}]]
set num_fdce_v2 [llength [get_cells -hierarchical -filter {REF_NAME =~ FDCE*}]]
puts "-------------------------------------------------------------------------"
puts "Post-Synthesis Primitive Audit (Style 2LUT, 1 Instance):"
puts "  LUT2 count : $num_lut2_v2  (Expected: 66 = 64 element LUT2s + 2 gate LUT2s)"
puts "  FDCE count : $num_fdce_v2  (Expected: 1)"
puts "-------------------------------------------------------------------------"

if {$num_lut2_v2 != 66 || $num_fdce_v2 != 1} {
    puts "ERROR: Primitive count mismatch in Style 2LUT synthesis!"
    exit 1
} else {
    puts "PASS \[Test 8 - Style 2LUT\]: Matches Table 1 count (64 element LUT2s + 2 gate LUT2s + 1 FDCE_1)."
}

puts "=== ALL MILESTONE 1-3 SYNTHESIS CHECKS PASSED ==="
exit 0