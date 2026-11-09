set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 2
open_checkpoint $out/routed.dcp
set cells [dict create];foreach c [get_cells -hier] {dict set cells $c $c}
proc cell {n} {return [dict get $::cells $n]}
source $root/scripts/verify_physical.tcl
puts "PHYSICAL_REVIEW_COMPLETE"
