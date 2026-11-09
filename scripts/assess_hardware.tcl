# Read-only analysis of the selected routed image; no bitstream programming.
if {[llength $argv]!=1} {error "Usage: assess_hardware.tcl <output-directory>"}
set root [file normalize [file join [file dirname [info script]] ..]]
set out [file normalize [lindex $argv 0]]
file mkdir $out
set_param general.maxThreads 2
open_checkpoint $root/build/routed.dcp
report_utilization -file $out/utilization.rpt
report_timing_summary -file $out/timing.rpt
report_power -file $out/power_vectorless.rpt
set f [open $out/POWER_SCOPE.txt w]
puts $f "Vectorless Vivado estimate of the saved routed FPGA design. No SAIF or measured asynchronous PUF switching activity was supplied. Default activity/operating conditions are those printed in power_vectorless.rpt. This is not measured board power or a validated active/idle PUF power characterization."
close $f
puts "SELECTED_IMAGE_ASSESSMENT_COMPLETE"
