set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 2
if {[llength [get_designs -quiet]]} {close_design}
open_checkpoint $out/placed.dcp
set cells [dict create];foreach c [get_cells -hier] {dict set cells $c $c}
proc cell {n} {return [dict get $::cells $n]}
set f [open $root/layout.tcl r];set layout [read $f];close $f
set skipped_controls [dict create]
set target_tiles [dict create]
foreach row $layout {lassign $row x z y ax type;dict set target_tiles [get_tiles -of_objects [get_sites SLICE_X${ax}Y[expr {$y+16}]]] 1}
set f [open $out/reference_cells.tcl r]
while {[gets $f line]>=0} {
 lassign $line command n site bel pins
 if {![string match {*u_core/*} $n] && [dict exists $target_tiles [get_tiles -of_objects [get_sites $site]]]} {dict set skipped_controls $n $site}
}
close $f
set arbs {};set locations {}
for {set i 0} {$i<64} {incr i} {
 lassign [lindex $layout $i] x z y ax type
 set c [cell [format {gen_core[%d].u_engine/u_core/u_arbiter_dff} $i]]
 lappend arbs $c;lappend locations [list $c SLICE_X${ax}Y[expr {$y+16}]/AFF]
}
unplace_cell $arbs
foreach pair $locations {lassign $pair c loc;reset_property BEL $c;place_cell [list $c $loc]}
set pinmap [dict create];foreach p [get_pins -hier] {dict set pinmap $p $p}
set locked 0
proc lock_route {p route} {
 if {[string first {gen_elem[15].u_elem/gen_style_p.u_mux/O} $p]>=0} {return}
 set_property FIXED_ROUTE $route [get_nets -of_objects [dict get $::pinmap $p]];incr ::locked
}
source $out/reference_routes.tcl
if {$locked!=6144} {error "Wrong preserved route count"}
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
puts "ARBITER_ROW_AFF_TRIAL_IMPLEMENTED"
