set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_v2
if {[file exists $out]} {error "Preserve existing build; use a fresh output directory"}
file mkdir $out
set_param general.maxThreads 2
create_project -in_memory -part xc7a35tcpg236-1
foreach name {cbdc_uart cbdc_button cbdc_puf_element cbdc_puf_chain cbdc_puf_core cbdc_puf_ctrl cbdc_serial_engine cbdc_array8_serial} {read_verilog $root/rtl/$name.v}
read_xdc $root/constraints/basys3_serial.xdc
synth_design -top cbdc_array8_serial -part xc7a35tcpg236-1 -flatten_hierarchy none
opt_design
write_checkpoint $out/synthesized.dcp
proc cell {name} {
 set c [get_cells -quiet -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1} {error "Expected one cell $name"};return $c
}
proc locate {name site bel {pins ""}} {
 set c [cell $name]
 set_property BEL $bel $c;set_property LOC $site $c
 if {$pins ne ""} {set_property LOCK_PINS $pins $c}
}
set layout [open $root/layout.tcl r];set placements [read $layout];close $layout
set map [open $out/placement.csv w];puts $map {core,upper_x,lower_x,head_y,arbiter_x}
for {set i 0} {$i<8} {incr i} {
 set base [format {gen_core[%d].u_engine/u_core} $i]
 lassign [lindex $placements $i] xu y
 set xl [expr {$xu+4}];set xa [expr {$xu+2}]
 puts $map "$i,$xu,$xl,$y,$xa"
 foreach side {upper lower} x [list $xu $xl] {
  set chain $base/u_chain_$side
  locate $chain/gen_auto_parity_gate.u_head_gate SLICE_X${x}Y$y A6LUT {I0:A1 I1:A2 I2:A3}
  for {set stage 0} {$stage<16} {incr stage} {
   set b [format {%s/gen_elem[%d].u_elem/gen_style_p} $chain $stage]
   set site SLICE_X${x}Y[expr {$y+1+$stage}]
   locate $b.u_buf $site A6LUT {I0:A1 I1:A2}
   locate $b.u_inv $site B6LUT {I0:A1 I1:A2}
   locate $b.u_mux $site C6LUT {I0:A1 I1:A2 I2:A3}
  }
 }
 locate $base/u_arbiter_dff SLICE_X${xa}Y[expr {$y+16}] BFF
 locate $base/gen_dual_arbiter.u_arbiter_b_dff SLICE_X${xa}Y[expr {$y+18}] BFF
 locate $base/gen_first_edge_lock.u_qb_edge_lock SLICE_X${xl}Y[expr {$y+17}] AFF
 locate $base/gen_first_edge_lock.u_qu_edge_lock SLICE_X${xu}Y[expr {$y+17}] AFF
 set ffs {}
 foreach ff [get_cells -hier -filter {REF_NAME =~ FD*}] {if {[string first "$base/" $ff]==0} {lappend ffs $ff}}
 if {[llength $ffs]!=4} {error "Expected 4 preserved core FFs at $base"}
 set p [get_pins -of_objects [cell $base/u_chain_upper/gen_auto_parity_gate.u_head_gate] -filter {REF_PIN_NAME == O}]
 set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -of_objects $p]
}
close $map
write_checkpoint $out/optimized.dcp
place_design
route_design
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_utilization -hierarchical -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
write_verilog $out/implemented.v
source $root/scripts/audit.tcl
write_bitstream $out/array8.bit
puts "ARRAY8_READY $out/array8.bit"
