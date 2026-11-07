# Programming runs only through an explicit Program action, never during Verify.
if {[llength $argv]!=2 || [lindex $argv 1] ne "PROGRAM_SELECTED_BITSTREAM"} {error "Explicit selected-bitstream programming invocation required"}
set bit [file normalize [lindex $argv 0]]
if {![file exists $bit]} {error "Bitstream missing"}
open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
set matching {}
foreach d [get_hw_devices] {
 if {[string match -nocase "xc7a35t*" [get_property PART $d]]} {lappend matching $d}
}
if {[llength $matching]!=1} {error "Expected exactly one XC7A35T target; select the board manually instead"}
set dev [lindex $matching 0]
current_hw_device $dev
refresh_hw_device -update_hw_probes false $dev
set_property PROBES.FILE {} $dev
set_property FULL_PROBES.FILE {} $dev
set_property PROGRAM.FILE $bit $dev
program_hw_devices $dev
close_hw_target
disconnect_hw_server
close_hw_manager
puts "PROGRAMMED_SELECTED_BITSTREAM $bit"
