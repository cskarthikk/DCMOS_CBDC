set out [file normalize [file dirname [info script]]]
set root [file normalize $out/../..]
set_param general.maxThreads 2
open_checkpoint $root/build/routed.dcp
set f [open $root/layout.tcl r];set layout [read $f];close $f
set cells [dict create];foreach c [get_cells -hier] {dict set cells $c $c}
set ff_counts [dict create]
foreach c [get_cells -hier -filter {REF_NAME =~ FD*}] {
 if {[regexp {^gen_core\[([0-9]+)\].u_engine/u_core/} $c -> core]} {dict incr ff_counts $core}
}
set f [open $out/arbiter_target_feasibility.csv w]
puts $f {core,current_site,current_bel,proposed_site,proposed_bff_occupant,other_ffs_at_proposed_site,core_ff_count,falling_edge}
for {set i 0} {$i<64} {incr i} {
 lassign [lindex $layout $i] x z y ax type
 set c [dict get $cells [format {gen_core[%d].u_engine/u_core/u_arbiter_dff} $i]]
 set site SLICE_X${ax}Y[expr {$y+16}]
 set occupant [get_cells -quiet -of_objects [get_bels $site/BFF]]
 set other [get_cells -quiet -of_objects [get_bels -of_objects [get_sites $site]] -filter {REF_NAME =~ FD*}]
 if {[dict get $ff_counts $i]!=1} {error "Wrong arbiter count for $i"}
 set inv [get_property IS_C_INVERTED $c]
 if {$inv ni {1 1'b1 TRUE true}} {error "Wrong arbiter edge"}
 puts $f "$i,[get_property LOC $c],[get_property BEL $c],$site,[join $occupant |],[join $other |],[dict get $ff_counts $i],$inv"
}
close $f
puts "PASS: all 64 core FF counts and falling-edge properties rechecked; proposed arbiter BEL occupancy recorded. No placement modified."
