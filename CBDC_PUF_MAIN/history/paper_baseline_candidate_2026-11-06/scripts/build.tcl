# One instance of the CURRENT pulled PUF. No array/BCH/hash sources read.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
if {[file exists $out/candidate.bit]} {error "Preserve existing candidate bitstream; use a new build folder"}
file mkdir $out
create_project -in_memory -part xc7a35tcpg236-1
set_param general.maxThreads 2
foreach source {cbdc_uart cbdc_button cbdc_puf_element cbdc_puf_chain cbdc_puf_core cbdc_puf_ctrl cbdc_puf_serial} {
 read_verilog $root/rtl/$source.v
}
read_xdc $root/constraints/basys3_serial.xdc
synth_design -top cbdc_puf_serial -part xc7a35tcpg236-1 -flatten_hierarchy none
opt_design
proc exactcell {name} {
 set c [get_cells -quiet -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1} {error "Expected exactly one cell: $name; got $c"}
 return $c
}
proc loccell {name loc bel {pins ""}} {
 set c [exactcell $name]
 set_property BEL $bel $c
 set_property LOC $loc $c
 if {$pins ne ""} {set_property LOCK_PINS $pins $c}
}
# Paired placement only: routes are chosen by Vivado, not claimed identical.
foreach chain {upper lower} x {21 25} {
 set base u_puf/u_core/u_chain_$chain
 loccell $base/gen_fixed_parity_gate.u_head_gate SLICE_X${x}Y100 A6LUT {I0:A1 I1:A2}
 for {set i 0} {$i<16} {incr i} {
  set stage [format {%s/gen_elem[%d].u_elem/gen_style_p} $base $i]
  set site SLICE_X${x}Y[expr {101+$i}]
  loccell $stage.u_buf $site A6LUT {I0:A1 I1:A2}
  loccell $stage.u_inv $site B6LUT {I0:A1 I1:A2}
  loccell $stage.u_mux $site C6LUT {I0:A1 I1:A2 I2:A3}
 }
}
loccell u_puf/u_core/u_arbiter_dff SLICE_X23Y116 BFF
# Resolve the actual canonical net: pulled qu_w/qb_w wildcard acknowledgement
# can miss aliases. Acknowledge only this known 98-LUT intentional PUF loop.
set loop_output [get_pins -of_objects [exactcell u_puf/u_core/u_chain_upper/gen_fixed_parity_gate.u_head_gate] -filter {REF_PIN_NAME == O}]
set loop_net [get_nets -of_objects $loop_output]
if {[llength $loop_net]!=1} {error "Expected one intentional PUF feedback net"}
set_property ALLOW_COMBINATORIAL_LOOPS TRUE $loop_net
set coreffs [get_cells -hier -filter {NAME =~ u_puf/u_core/* && REF_NAME =~ FD*}]
if {[llength $coreffs] != 1} {error "Expected exactly one core FF; got $coreffs"}
write_checkpoint -force $out/optimized.dcp
report_utilization -hierarchical -file $out/utilization_synth.rpt
place_design
route_design
write_checkpoint -force $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
report_utilization -hierarchical -file $out/utilization.rpt
write_verilog -force $out/routed.v
source $root/scripts/audit_routes.tcl
write_bitstream -force $out/candidate.bit
puts "CANDIDATE_READY: $out/candidate.bit"