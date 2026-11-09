set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_v3
if {[file exists $out]} {error "Preserve previous experiment"};file mkdir $out
set_param general.maxThreads 2
open_checkpoint $root/build_v2/routed.dcp
proc cell {name} {
 set c [get_cells -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1} {error "Expected one cell $name"};return $c
}
proc net_for {i side suffix} {
 set name [format {gen_core[%d].u_engine/u_core/u_chain_%s/%s} $i $side $suffix]
 set p [get_pins -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $p]!=1} {error "Missing $name"};return [get_nets -of_objects $p]
}
set f [open $root/route_targets.tcl r];set targets [read $f];close $f
set unroute {};set templates {}
foreach t $targets {
 lassign $t i suffix from
 set to [expr {$from eq "upper"?"lower":"upper"}]
 set a [net_for $i $from $suffix];set b [net_for $i $to $suffix]
 lappend templates [list $a $b [get_property ROUTE $a]];lappend unroute $b
}
route_design -unroute -nets $unroute
foreach t $templates {lassign $t a b route;set_property FIXED_ROUTE $route $a;set_property FIXED_ROUTE $route $b}
route_design -preserve
report_route_status -file $out/route_status.rpt
set f [open $out/route_status.rpt r];set status [read $f];close $f
if {![regexp {nets with routing errors\.+\s*:\s*0} $status]} {error "Refinement not legal; retain build_v2"}
write_checkpoint $out/routed.dcp
report_utilization -hierarchical -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
source $root/scripts/audit.tcl
write_bitstream $out/array8.bit
