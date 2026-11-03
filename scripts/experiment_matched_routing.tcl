# Separate post-route experiment for the existing Basys 3 serial diagnostic build.
# Run from Vivado Tcl: source {C:/BTech/Semester_5/DCMOS/Project/scripts/experiment_matched_routing.tcl}
# No project edits, bitstream generation, or hardware programming.
set mr_root [file normalize [file join [file dirname [info script]] ..]]
set mr_out $mr_root/build_m1/matched_routing
set mr_center_launch [expr {[info exists argv] && [lsearch -exact $argv --center-launch] >= 0}]
if {$mr_center_launch} {set mr_out $mr_root/build_m1/matched_routing_center_launch}
file mkdir $mr_out
if {[current_design -quiet] ne ""} {error "Run in a separate empty Vivado session to preserve your open design."}
open_checkpoint $mr_root/vivado/cbdc_serial_diagnostic/cbdc_serial_diagnostic.runs/impl_1/cbdc_puf_serial_routed.dcp
proc mr_one {xs label} {
 if {[llength $xs] != 1} {error "Expected one $label, got $xs"}
 return [lindex $xs 0]
}
proc mr_cell {name} {return [mr_one [get_cells -quiet -hier -filter [format {NAME == "%s"} $name]] $name]}
proc mr_net {side suffix} {
 return [mr_one [get_nets -of_objects [get_pins u_puf/u_core/u_chain_${side}/$suffix]] $suffix]
}
proc mr_canonical {route} {return [regsub -all {\s+} [string trim $route] { }]}
proc mr_delays {path} {
 set f [open $path w]
 puts $f "side,connection,sink,slow_max_ps,slow_min_ps,fast_max_ps,fast_min_ps"
 foreach side {upper lower} {
  foreach suffix $::mr_suffixes {
   set net [mr_net $side $suffix]
   foreach d [get_net_delays -of_objects $net] {
    puts $f "$side,$suffix,[get_property TO_PIN $d],[get_property SLOW_MAX $d],[get_property SLOW_MIN $d],[get_property FAST_MAX $d],[get_property FAST_MIN $d]"
   }
  }
 }
 close $f
}
set mr_suffixes {u_head_gate/O}
for {set i 0} {$i < 16} {incr i} {
 foreach kind {buf inv} {lappend mr_suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_%s/O} $i $kind]}
 if {$i < 15} {lappend mr_suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_mux/O} $i]}
}
# 48 corresponding internal connections per chain; final fanout nets are separate.
mr_delays $mr_out/before_internal_delays.csv
foreach suffix $mr_suffixes {set mr_templates($suffix) [get_property ROUTE [mr_net upper $suffix]]}
report_drc -file $mr_out/before_drc.rpt
route_design -unroute
# X20 and X21 are different slice positions IN THE SAME TILE. X21 and X25
# instead use the same slice position in two corresponding CLBLL_L tiles.
set mr_moves {}
foreach c [get_cells -hier -filter {NAME =~ u_puf/u_core/u_chain_lower/* && (REF_NAME == LUT2 || REF_NAME == LUT3)}] {
 set old [get_property LOC $c]
 if {![regexp {^SLICE_X20Y([0-9]+)$} $old -> y]} {error "Unexpected lower placement $c $old"}
 lappend mr_moves [list $c SLICE_X25Y$y [get_property BEL $c]]
}
if {[llength $mr_moves] != 49} {error "Expected 49 lower LUTs"}
lappend mr_moves [list [mr_cell u_puf/u_core/u_arbiter_dff] SLICE_X23Y116 BFF]
lappend mr_moves [list [mr_cell u_puf/u_core/gen_diagnostic.qb_seen] SLICE_X25Y117 AFF]
lappend mr_moves [list [mr_cell u_puf/u_core/gen_diagnostic.qu_seen] SLICE_X21Y117 AFF]
if {$mr_center_launch} {
 set launch_nets [get_nets -segments -of_objects [get_pins u_puf/u_core/u_chain_upper/u_head_gate/I0]]
 set launch_pin [mr_one [get_pins -leaf -of_objects $launch_nets -filter {DIRECTION == OUT}] launch_driver]
 set launch_cell [mr_one [get_cells -of_objects $launch_pin] launch_register]
 if {[get_property REF_NAME $launch_cell] ne "FDRE"} {error "Unexpected launch driver $launch_cell"}
 lappend mr_moves [list $launch_cell SLICE_X23Y100 AFF]
}
foreach move $mr_moves {
 lassign $move c loc bel
 # Fail rather than silently displacing unrelated logic.
 foreach other [get_cells -quiet -of_objects [get_sites $loc]] {
  if {$other ne $c && [string match *$bel [get_property BEL $other]]} {error "Occupied target $loc/$bel by $other"}
 }
 set_property IS_LOC_FIXED false $c
 set_property IS_BEL_FIXED false $c
 unplace_cell $c
 set_property BEL $bel $c
 set_property LOC $loc $c
}
if {$mr_center_launch} {
 # Moving a packed register can unplace its associated controller LUTs.
 # Re-place that controller logic while the core LOC/BEL/pin constraints remain.
 place_design
}
foreach side {upper lower} {
 foreach suffix $mr_suffixes {
  set n [mr_net $side $suffix]
  set_property FIXED_ROUTE $mr_templates($suffix) $n
 }
}
route_design
set f [open $mr_out/route_comparison.txt w]
set mr_equal 0
foreach suffix $mr_suffixes {
 set a [mr_net upper $suffix]
 set b [mr_net lower $suffix]
 set same [expr {[mr_canonical [get_property ROUTE $a]] eq [mr_canonical [get_property ROUTE $b]]}]
 puts $f "$suffix equal=$same upper=[get_property ROUTE_STATUS $a] lower=[get_property ROUTE_STATUS $b]"
 incr mr_equal $same
}
puts $f "MATCHED_INTERNAL_PAIRS $mr_equal / [llength $mr_suffixes]"
close $f
if {$mr_equal != 48} {error "Not all internal route patterns matched"}
mr_delays $mr_out/after_internal_delays.csv
report_route_status -file $mr_out/route_status.rpt
report_drc -file $mr_out/after_drc.rpt
report_timing_summary -delay_type min_max -report_unconstrained -file $mr_out/timing_summary.rpt
report_methodology -file $mr_out/methodology.rpt
set f [open $mr_out/terminal_delays.txt w]
foreach pin {u_puf/u_core/u_arbiter_dff/D u_puf/u_core/u_arbiter_dff/C u_puf/u_core/u_chain_upper/u_head_gate/I1 u_puf/u_core/u_chain_lower/u_head_gate/I1 u_puf/u_core/u_chain_upper/u_head_gate/I0 u_puf/u_core/u_chain_lower/u_head_gate/I0} {
 set p [get_pins $pin]
 foreach d [get_net_delays -of_objects [get_nets -of_objects $p] -to $p] {
  puts $f "$pin slow_max_ps=[get_property SLOW_MAX $d] fast_min_ps=[get_property FAST_MIN $d]"
 }
}
close $f
write_checkpoint -force $mr_out/experimental_routed.dcp
write_xdc -force $mr_out/experimental_constraints.xdc
puts "EXPERIMENT_COMPLETE: $mr_out ; no bitstream generated"
