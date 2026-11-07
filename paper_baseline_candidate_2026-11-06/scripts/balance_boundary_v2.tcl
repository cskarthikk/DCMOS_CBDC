# Targeted physical-only experiment, preserving the measured checkpoint.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_boundary_v2
if {[file exists $out]} {error "Refusing to overwrite an experiment"}
file mkdir $out
set_param general.maxThreads 2
open_checkpoint $root/build_internal_matched_v2/routed.dcp
proc exact_pin {name} {
 set p [get_pins -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $p] != 1} {error "Expected one pin: $name"}
 return $p
}
set boundary_names {u_puf/excite u_puf/u_core/qu_w u_puf/u_core/qb_w}
# Save actual routes of every net, including hierarchical aliases, for comparison.
foreach n [get_nets -hier] {set before_route($n) [get_property ROUTE $n]}
foreach c [get_cells -hier -filter {IS_PRIMITIVE}] {
 set before_cell($c) [list [get_property REF_NAME $c] [get_property LOC $c] [get_property BEL $c]]
}
# Match faster sink branches towards their slower partners. Min targets use fast corner, max uses slow; arbiter limits exclude intra-site delay. Targets are ps
# of interconnect only; exported timing is the acceptance evidence.
foreach spec {
 {u_puf/u_core/u_chain_upper/gen_fixed_parity_gate.u_head_gate/I0 530 1490}
 {u_puf/u_core/u_chain_upper/gen_fixed_parity_gate.u_head_gate/I1 600 1645}
 {u_puf/u_core/u_arbiter_dff/D 240 650}
} {
 lassign $spec name minimum maximum
 set p [exact_pin $name]
 route_design -unroute -pins $p
 route_design -pins $p -min_delay $minimum -max_delay $maximum
}
set f [open $out/invariance_checks.txt w]
foreach c [array names before_cell] {
 set after [list [get_property REF_NAME [get_cells $c]] [get_property LOC [get_cells $c]] [get_property BEL [get_cells $c]]]
 if {$after ne $before_cell($c)} {error "Placement/primitive changed: $c"}
}
puts $f "All primitive types, sites and BELs unchanged."
foreach n [get_nets -hier] {
 if {[get_property ROUTE $n] ne $before_route($n)} {
  puts $f "Changed route: $n"
  # Aliases of the same three physical nets are allowed, identified by driver.
  set drivers [get_pins -leaf -of_objects $n -filter {DIRECTION == OUT}]
  set legal 0
  foreach base $boundary_names {
   set bn [get_nets -hier -filter [format {NAME == "%s"} $base]]
   if {$drivers eq [get_pins -leaf -of_objects $bn -filter {DIRECTION == OUT}]} {set legal 1}
  }
  if {!$legal} {error "Unrelated route changed: $n"}
 }
}
puts $f "Only excitation and the two terminal/feedback nets may change."
close $f
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_drc -file $out/drc.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
source $root/scripts/audit_routes.tcl
puts "BOUNDARY_EXPERIMENT_COMPLETE"

