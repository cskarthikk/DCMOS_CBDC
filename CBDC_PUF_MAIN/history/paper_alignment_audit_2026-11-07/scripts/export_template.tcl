set root [file normalize [file join [file dirname [info script]] ..]]
open_checkpoint $root/../paper_baseline_candidate_2026-11-06/build_internal_matched_v2/routed.dcp
set f [open $root/evidence/internal_route_template.tcl w]
foreach side {upper lower} {
 set suffixes {gen_fixed_parity_gate.u_head_gate/O}
 for {set i 0} {$i<16} {incr i} {
  foreach kind {buf inv} {lappend suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_%s/O} $i $kind]}
  if {$i<15} {lappend suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_mux/O} $i]}
 }
 foreach suffix $suffixes {
  set name u_puf/u_core/u_chain_$side/$suffix
  set p [get_pins -hier -filter [format {NAME == "%s"} $name]]
  if {[llength $p]!=1} {error "Missing template pin"}
  set route [get_property ROUTE [get_nets -of_objects $p]]
  puts $f [list [list $side $suffix $route]]
 }
}
close $f
