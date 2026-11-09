# Source after placing, or from a separate resume script opening placed.dcp.
set f [open $root/internal_route_template.tcl r];set templates [read $f];close $f
if {[llength $templates]!=288} {error "Incomplete route template"}
set records {};foreach {side suffix route} $templates {lappend records [list $side $suffix $route]}
set fixed 0
set pins [dict create]
foreach p [get_pins -hier] {dict set pins $p $p}
for {set i 0} {$i<64} {incr i} {
 lassign [lindex $layout $i] x z y ax type
 foreach t $records {
  lassign $t side suffix route
  # Use the measured local stage-six correction, not the historical detour.
  if {$suffix eq {gen_elem[6].u_elem/gen_style_p.u_inv/O}} {set route { { CLBLL_L_B CLBLL_LOGIC_OUTS9 BYP_ALT4 BYP_BOUNCE4 IMUX_L20 CLBLL_L_C2 } }}
  if {[string match CLBLM_* $type]} {set route [string map {CLBLL CLBLM} $route]}
  if {[string match *_R $type]} {set route [string map {IMUX_L IMUX} $route]}
  set name [format {gen_core[%d].u_engine/u_core/u_chain_%s/%s} $i $side $suffix]
  if {![dict exists $pins $name]} {error "Missing route pin $name"}
  set p [dict get $pins $name]
  set_property FIXED_ROUTE $route [get_nets -of_objects $p]
  incr fixed
 }
 puts "Fixed internal route templates applied to core $i"
}
if {$fixed!=6144} {error "Incomplete fixed routing"}
write_checkpoint $out/fixed.dcp
route_design
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_utilization -hierarchical -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
source $root/scripts/audit.tcl
write_verilog $out/implemented.v
# Bitstream is created only by finalize.tcl after reviewing all implementation evidence.
puts "CANDIDATE64_IMPLEMENTATION_COMPLETE"
