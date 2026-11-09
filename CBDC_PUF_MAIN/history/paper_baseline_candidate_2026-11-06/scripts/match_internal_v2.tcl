# Separate physical experiment; never changes the first candidate checkpoint.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_internal_matched_v2
file mkdir $out
if {[file exists $out/routed.dcp]} {error "Output exists; preserve the previous experiment"}
open_checkpoint $root/build/routed.dcp
set suffixes {gen_fixed_parity_gate.u_head_gate/O}
for {set i 0} {$i < 16} {incr i} {
 foreach kind {buf inv} {lappend suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_%s/O} $i $kind]}
 if {$i < 15} {lappend suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_mux/O} $i]}
}
proc net_for {side suffix} {
 set wanted u_puf/u_core/u_chain_${side}/$suffix
 set p [get_pins -hier -filter [format {NAME == "%s"} $wanted]]
 if {[llength $p] != 1} {error "Expected one exact pin: $wanted"}
 set n [get_nets -of_objects $p]
 if {[llength $n] != 1} {error "Expected one net: $wanted"}
 return $n
}
set targets {}
foreach suffix $suffixes {
 set upper [net_for upper $suffix]
 set lower [net_for lower $suffix]
 if {$suffix eq {gen_elem[7].u_elem/gen_style_p.u_inv/O}} {
  set templates($suffix) [get_property ROUTE $lower]
  lappend targets $upper
 } else {
  set templates($suffix) [get_property ROUTE $upper]
 }
 lappend targets $lower
}
# Unroute only the lower internal nets, retaining the board routing.
route_design -unroute -nets $targets
foreach suffix $suffixes {
 set_property FIXED_ROUTE $templates($suffix) [net_for upper $suffix]
 set_property FIXED_ROUTE $templates($suffix) [net_for lower $suffix]
}
route_design
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_drc -file $out/drc.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
source $root/scripts/audit_routes.tcl
puts "INTERNAL_ROUTE_EXPERIMENT_COMPLETE"
