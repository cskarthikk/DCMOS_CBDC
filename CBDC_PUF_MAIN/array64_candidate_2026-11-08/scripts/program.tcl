set root [file normalize [file join [file dirname [info script]] ..]]
set bit $root/build/paper_array64.bit
if {![file exists $root/BUILD_RECORD.json] || ![file exists $bit]} {error "Candidate not finalized"}
open_hw_manager
connect_hw_server
open_hw_target
set devices [get_hw_devices -filter {PART =~ xc7a35t*}]
if {[llength $devices]!=1} {error "Expected exactly one xc7a35t device; do not choose another target automatically"}
set d [lindex $devices 0]
current_hw_device $d
set_property PROBES.FILE {} $d
set_property FULL_PROBES.FILE {} $d
set_property PROGRAM.FILE $bit $d
program_hw_devices $d
close_hw_target
disconnect_hw_server
close_hw_manager
