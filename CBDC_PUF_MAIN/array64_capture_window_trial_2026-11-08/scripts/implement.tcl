set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set base $root/../array64_candidate_2026-11-08
set_param general.maxThreads 2
open_checkpoint $out/synthesized.dcp
set cells [dict create];foreach c [get_cells -hier] {dict set cells $c $c}
proc cell {n} {if {![dict exists $::cells $n]} {error "Missing cell $n"};return [dict get $::cells $n]}
proc locate {n site bel pins} {
 set c [cell $n];set_property BEL [lindex [split $bel .] end] $c;set_property LOC $site $c
 if {$pins ne ""} {set_property LOCK_PINS $pins $c}
}
source $out/reference_cells.tcl
set f [open $root/layout.tcl r];set layout [read $f];close $f
set pb [create_pblock puf_sites];set ranges {};set members {}
for {set i 0} {$i<64} {incr i} {
 lassign [lindex $layout $i] x z y ax type
 foreach sx [list $x $z] {lappend ranges "SLICE_X${sx}Y${y}:SLICE_X${sx}Y[expr {$y+16}]"}
 lappend ranges SLICE_X${ax}Y[expr {$y+17}] SLICE_X${ax}Y[expr {$y-1}]
 set b [format {gen_core[%d].u_engine/u_core} $i]
 lappend members [cell $b] [cell [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg} $i]]
 set p [get_pins -of_objects [cell $b/u_chain_upper/gen_fixed_parity_gate.u_head_gate] -filter {REF_PIN_NAME == O}]
 set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -of_objects $p]
}
resize_pblock $pb -add $ranges;add_cells_to_pblock $pb $members;set_property EXCLUDE_PLACEMENT TRUE $pb
# Let Vivado reuse ordinary placements/routes where synthesis still matches them.
read_checkpoint -incremental $base/build/routed.dcp
place_design
write_checkpoint $out/placed.dcp
set pinmap [dict create];foreach p [get_pins -hier] {dict set pinmap $p $p}
set locked 0
proc lock_route {p route} {
 if {![dict exists $::pinmap $p]} {error "Missing signal driver $p"}
 set_property FIXED_ROUTE $route [get_nets -of_objects [dict get $::pinmap $p]]
 incr ::locked
}
source $out/reference_routes.tcl
if {$locked!=6272} {error "Incomplete PUF route preservation"}
route_design
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_utilization -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
source $root/scripts/audit_structure.tcl
source $root/scripts/verify_physical.tcl
write_verilog $out/implemented.v
puts "LONG_CAPTURE_IMPLEMENTED"
