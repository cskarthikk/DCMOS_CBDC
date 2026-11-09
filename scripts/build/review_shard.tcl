set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 1
set shard [lindex $argv 0]
if {[lindex $argv 1] eq "refined"} {
 set out $root/build/audit_refined
 file mkdir $out
 open_checkpoint $root/build/routed_refined.dcp
} else {open_checkpoint $out/routed.dcp}
source $root/scripts/export_shard.tcl
