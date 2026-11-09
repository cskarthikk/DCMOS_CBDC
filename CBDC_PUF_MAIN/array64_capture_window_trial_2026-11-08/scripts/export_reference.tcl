set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set base $root/../array64_candidate_2026-11-08
set_param general.maxThreads 2
open_checkpoint $base/build/routed.dcp
set f [open $out/reference_cells.tcl w]
set t [open $out/reference_routes.tcl w]
set rows [open $out/reference_fingerprint.csv w]
puts $rows {driver,net,source_sinks,route,pips}
set luts 0;set fixed 0;set controls 0
foreach c [get_cells -hier -filter {IS_PRIMITIVE}] {
 set iscore [string match {*u_core/*} $c]
 set ref [get_property REF_NAME $c]
 set control [expr {[string match {gen_core*} $c] && [regexp {/(puf_excite_o_reg|puf_latch_o_reg|puf_clr_o_reg|q_sync[12]_r_reg)$} $c]}]
 if {!$iscore && !$control} {continue}
 if {$ref in {GND VCC}} {continue}
 puts $f [list locate $c [get_property LOC $c] [get_property BEL $c] [expr {[string match LUT* $ref] ? [get_property LOCK_PINS $c] : ""}]]
 if {$control} {incr controls}
 if {$iscore && [string match LUT* $ref]} {
  incr luts
  foreach p [get_pins -of_objects $c -filter {DIRECTION == OUT}] {
   set n [get_nets -of_objects $p]
   puts $t [list lock_route $p [get_property ROUTE $n]]
   set endpoints [lsort [get_pins -leaf -of_objects [get_nets -segments -of_objects $p]]]
   set route [get_property ROUTE $n]
   set pips [lsort [get_pips -of_objects $n]]
   puts $rows "$p,$n,$endpoints,$route,$pips"
   incr fixed
  }
 }
}
close $f;close $t;close $rows
if {$luts!=6272 || $fixed!=6272 || $controls!=320} {error "Incomplete reference export: $luts $fixed $controls"}
puts "REFERENCE_EXPORTED: $luts PUF LUTs; $controls control/synchronizer FFs; $fixed signal route trees including terminal/feedback."
