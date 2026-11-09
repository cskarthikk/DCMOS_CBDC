set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
if {[file exists $out/candidate.bit]} {error "Refusing to overwrite bitstream"}
open_checkpoint $out/routed.dcp
source $root/scripts/audit_routes.tcl
write_bitstream $out/candidate.bit
puts "CANDIDATE_READY: $out/candidate.bit"
