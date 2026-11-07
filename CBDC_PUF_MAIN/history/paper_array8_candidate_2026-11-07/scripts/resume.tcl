set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
if {[file exists $out/paper_array8.bit]} {error "Refusing to overwrite bitstream"}
set_param general.maxThreads 2
open_checkpoint $out/optimized.dcp
proc cell {name} {
 set c [get_cells -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1} {error "Expected one cell $name"};return $c
}
set f [open $root/layout.tcl r];set layout [read $f];close $f
source $root/scripts/protect.tcl
write_checkpoint $out/protected_optimized.dcp
place_design
set f [open $root/internal_route_template.tcl r];set templates [read $f];close $f
if {[llength $templates]==288} {
 set records {};foreach {side suffix route} $templates {lappend records [list $side $suffix $route]}
} elseif {[llength $templates]==96} {set records $templates} else {error "Incomplete route template"}
for {set i 0} {$i<8} {incr i} {
 foreach t $records {
  lassign $t side suffix route
  set name [format {gen_core[%d].u_engine/u_core/u_chain_%s/%s} $i $side $suffix]
  set p [get_pins -hier -filter [format {NAME == "%s"} $name]]
  if {[llength $p]!=1} {error "Missing route pin $name"}
  set_property FIXED_ROUTE $route [get_nets -of_objects $p]
 }
}
route_design
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_utilization -hierarchical -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
source $root/scripts/audit.tcl
write_verilog $out/implemented.v
write_bitstream $out/paper_array8.bit
puts "PAPER_ARRAY8_READY $out/paper_array8.bit"
