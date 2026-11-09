set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 2
open_checkpoint $out/routed.dcp
source $root/scripts/export_delays.tcl
write_verilog -force $out/implemented.v
puts "CANDIDATE64_REVIEW_EXPORT_COMPLETE"
