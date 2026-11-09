set root [file normalize [file join [file dirname [info script]] ..]]
if {[llength $argv] != 1 || ![regexp {^build_boundary_v[0-9]+$} [lindex $argv 0]]} {error "Supply one boundary build directory name"}
set out [file join $root [lindex $argv 0]]
if {[file exists $out/candidate.bit]} {error "Refusing to overwrite a bitstream"}
open_checkpoint $out/routed.dcp
source $root/scripts/verify_core_structure.tcl
source $root/scripts/audit_routes.tcl
# Freeze the three accepted boundary nets as well as the 96 matched nets.
set f [open $out/fixed_boundary_routes.tcl w]
foreach name {u_puf/excite u_puf/u_core/qu_w u_puf/u_core/qb_w} {
 set n [get_nets -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $n] != 1} {error "Missing boundary net $name"}
 set route [get_property ROUTE $n]
 set_property FIXED_ROUTE $route $n
 puts $f [list set_property FIXED_ROUTE $route $name]
}
close $f
report_route_status -file $out/final_route_status.rpt
report_drc -file $out/final_drc.rpt
report_methodology -file $out/methodology.rpt
report_utilization -hierarchical -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/final_timing.rpt
write_verilog $out/implemented.v
write_checkpoint $out/frozen.dcp
write_bitstream $out/candidate.bit
puts "BOUNDARY_CANDIDATE_READY $out/candidate.bit"
