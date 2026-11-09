# Run on the current routed checkpoint. Change only identified internal route classes.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set f [open $root/layout.tcl r];set layout [read $f];close $f
set cells [dict create];foreach c [get_cells -hier] {dict set cells $c $c}
proc cell {n} {return [dict get $::cells $n]}
set pins [dict create];foreach p [get_pins -hier] {dict set pins $p $p}
set replacements [dict create]
for {set i 0} {$i<64} {incr i} {
 lassign [lindex $layout $i] x z y ax type
 if {![string match *_R $type]} {continue}
 set family [expr {[string match CLBLM_* $type] ? "CLBLM" : "CLBLL"}]
 foreach side {upper lower} {
  for {set j 0} {$j<15} {incr j} {
   set p [dict get $pins [format {gen_core[%d].u_engine/u_core/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_mux/O} $i $side $j]]
   set route [string map [list FAM $family] { { FAM_L_C FAM_LOGIC_OUTS10 NN2BEG2 SR1BEG2 { IMUX6 FAM_L_A1 } IMUX14 FAM_L_B1 } }]
   dict set replacements [get_nets -of_objects $p] $route
  }
  if {$family eq "CLBLM"} {
   foreach j {5 7 8} {
    set p [dict get $pins [format {gen_core[%d].u_engine/u_core/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_inv/O} $i $side $j]]
    dict set replacements [get_nets -of_objects $p] { { CLBLM_L_B CLBLM_LOGIC_OUTS9 BYP_ALT4 BYP_BOUNCE4 IMUX20 CLBLM_L_C2 } }
   }
  }
 }
}
puts "Refining [dict size $replacements] internal nets; preserving the other fixed routes"
set ns [dict keys $replacements]
foreach n $ns {reset_property FIXED_ROUTE $n}
route_design -unroute -nets $ns
dict for {n route} $replacements {set_property FIXED_ROUTE $route $n}
route_design
write_checkpoint $out/routed_refined.dcp
report_route_status -file $out/route_status_refined.rpt
report_timing_summary -report_unconstrained -file $out/timing_refined.rpt
report_drc -file $out/drc_refined.rpt
report_methodology -file $out/methodology_refined.rpt
source $root/scripts/audit_structure.tcl
write_verilog -force $out/implemented_refined.v
puts "REFINED_ROUTING_COMPLETE"
