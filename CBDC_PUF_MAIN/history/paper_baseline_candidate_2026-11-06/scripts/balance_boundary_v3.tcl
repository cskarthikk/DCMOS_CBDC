# Targeted physical-only experiment, preserving the measured checkpoint.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_boundary_v3
if {[file exists $out]} {error "Refusing to overwrite an experiment"}
file mkdir $out
set_param general.maxThreads 2
open_checkpoint $root/build_boundary_v1/routed.dcp
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
# Bounded physical search: six D-branch routing budgets. No response data used.
set log [open $out/arbiter_trials.csv w]
puts $log {max_interconnect_ps,D_slow,D_fast,C_slow,C_fast,score,eligible}
set best_score 1e9
set p [exact_pin u_puf/u_core/u_arbiter_dff/D]
foreach maximum {680 700 720 740 760 780} {
 route_design -unroute -pins $p
 route_design -pins $p -min_delay 220 -max_delay $maximum
 foreach pin {D C} net {qu_w qb_w} {
  foreach d [get_net_delays -of_objects [get_nets u_puf/u_core/$net]] {
   if {[get_property TO_PIN $d] eq "u_puf/u_core/u_arbiter_dff/$pin"} {
    set slow($pin) [get_property SLOW_MAX $d]
    set fast($pin) [get_property FAST_MIN $d]
   }
  }
 }
 set ds [expr {abs($slow(D)-$slow(C))}]
 set df [expr {abs($fast(D)-$fast(C))}]
 set score [expr {$ds+3*$df}]
 set eligible [expr {$ds < 67 && $df < 51}]
 puts $log "$maximum,$slow(D),$fast(D),$slow(C),$fast(C),$score,$eligible"
 flush $log
 if {$eligible && $score < $best_score} {
  set best_score $score
  write_checkpoint -force $out/routed.dcp
  source $root/scripts/audit_routes.tcl
  report_route_status -file $out/route_status.rpt
 }
}
close $log
if {$best_score == 1e9} {error "No boundary variant improves both arbiter corners"}
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

close_design
open_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_drc -file $out/drc.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
source $root/scripts/audit_routes.tcl
puts "BOUNDARY_EXPERIMENT_COMPLETE"

