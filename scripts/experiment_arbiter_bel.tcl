# Separate experiment: vary only arbiter BEL at its existing site. Preserve
# the chain route trunks; never select a candidate using measured response bits.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_m1/arbiter_bel
set candidates {AFF CFF DFF}
if {[llength $argv]} {
 set candidates $argv;set out $root/build_m1/arbiter_bel_round2
 foreach candidate $candidates {if {$candidate ni {AFF CFF DFF}} {error "Unknown BEL $candidate"}}
}
file mkdir $out
open_checkpoint $root/build_m1/timing_diagnostic/timing_routed.dcp
set arb [get_cells u_puf/u_core/u_arbiter_dff]
set site [get_property LOC $arb]
set fields {SLOW_MAX SLOW_MIN FAST_MAX FAST_MIN}
proc pin_net {pin} {return [get_nets -of_objects [get_pins $pin]]}
proc delays {pin} {
 set p [get_pins $pin]
 set ds [get_net_delays -of_objects [get_nets -of_objects $p] -to $p]
 if {[llength $ds]!=1} {error "Expected one delay for $pin"}
 set vals {}
 foreach field $::fields {lappend vals [get_property $field [lindex $ds 0]]}
 return $vals
}
set summary [open $out/comparison.csv w]
puts $summary "bel,D_slow_max,C_slow_max,D_slow_min,C_slow_min,D_fast_max,C_fast_max,D_fast_min,C_fast_min,worst_abs_wire_difference_ps,feedback_monitor_delays_preserved"
set protected_pins {u_puf/u_core/u_chain_upper/u_head_gate/I1 u_puf/u_core/u_chain_lower/u_head_gate/I1 u_puf/u_core/gen_diagnostic.qb_seen/C u_puf/u_core/gen_diagnostic.qu_seen/C}
foreach p $protected_pins {set protected($p) [delays $p]}
foreach name {C CE CLR} {set saved($name) [get_property ROUTE [pin_net u_puf/u_core/u_arbiter_dff/$name]]}
proc score {bel} {
 set a [delays u_puf/u_core/u_arbiter_dff/D]
 set b [delays u_puf/u_core/u_arbiter_dff/C]
 set worst 0;set line [list $bel]
 foreach x $a y $b {lappend line $x $y;set worst [expr {max($worst,abs($x-$y))}]}
 set intact 1
 set detail [open $::out/protected_delay_comparison.txt a]
 foreach p $::protected_pins {
  set now [delays $p]
  puts $detail "$bel $p before=$::protected($p) after=$now"
  if {$now ne $::protected($p)} {set intact 0}
 }
 close $detail
 lappend line $worst $intact
 puts $::summary [join $line ,];flush $::summary
 return [list $worst $intact]
}
score BFF
foreach bel $candidates {
 set d [get_pins $arb/D];set qu [get_nets -of_objects $d]
 set_property IS_ROUTE_FIXED false $qu
 set_property FIXED_ROUTE {} $qu
 route_design -unroute -pins $d
 # Freeze the remaining Qu branches before moving the D terminal.
 set trunk [get_property ROUTE $qu]
 set others {}
 foreach name {C CE CLR Q} {lappend others [pin_net u_puf/u_core/u_arbiter_dff/$name]}
 foreach n $others {set_property IS_ROUTE_FIXED false $n;set_property FIXED_ROUTE {} $n}
 route_design -unroute -nets $others
 set_property IS_BEL_FIXED false $arb
 set_property IS_LOC_FIXED false $arb
 unplace_cell $arb
 set_property BEL $bel $arb
 set_property LOC $site $arb
 set_property FIXED_ROUTE $trunk $qu
 foreach name {C CE CLR} {set_property FIXED_ROUTE $saved($name) [pin_net u_puf/u_core/u_arbiter_dff/$name]}
 route_design -preserve
 set scored [score $bel]
 file mkdir $out/$bel
 report_route_status -file $out/$bel/route_status.rpt
 report_drc -file $out/$bel/drc.rpt
 report_timing_summary -delay_type min_max -file $out/$bel/timing_summary.rpt
 write_checkpoint -force $out/$bel/routed.dcp
 if {![lindex $scored 1]} {puts "CANDIDATE_NOT_ACCEPTED: protected delay changed for $bel"}
}
close $summary
puts "ARBITER_BEL_EXPERIMENT_COMPLETE: $out ; no hardware programmed"
