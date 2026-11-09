set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_matched
if {[file exists $out]} {error "Preserve previous matched build"};file mkdir $out
set_param general.maxThreads 2
open_checkpoint $root/build/routed.dcp
proc cell {name} {
 set c [get_cells -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1} {error "Expected one cell"};return $c
}
set f [open $root/layout.tcl r];set layout [read $f];close $f
set nets {}
for {set i 0} {$i<8} {incr i} {
 foreach side {upper lower} {
  set name [format {gen_core[%d].u_engine/u_core/u_chain_%s/gen_elem[6].u_elem/gen_style_p.u_inv/O} $i $side]
  set p [get_pins -hier -filter [format {NAME == "%s"} $name]]
  if {[llength $p]!=1} {error "Missing stage-six pin"}
  lappend nets [get_nets -of_objects $p]
 }
}
foreach n $nets {reset_property FIXED_ROUTE $n}
route_design -unroute -nets $nets
foreach n $nets {set_property FIXED_ROUTE { { CLBLL_L_B CLBLL_LOGIC_OUTS9 BYP_ALT4 BYP_BOUNCE4 IMUX_L20 CLBLL_L_C2 } } $n}
route_design -preserve
write_checkpoint $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_utilization -hierarchical -file $out/utilization.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
report_methodology -file $out/methodology.rpt
source $root/scripts/audit.tcl
write_verilog $out/implemented.v
write_bitstream $out/paper_array8.bit
