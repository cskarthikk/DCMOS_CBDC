# Non-project build. Preserve core placement and complete critical routes from
# the preferred matched checkpoint; abort if any cannot be reproduced.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_m1/timing_diagnostic
file mkdir $out
if {[current_design -quiet] ne ""} {error "Use a separate empty Vivado session"}
proc one {xs label} {if {[llength $xs]!=1} {error "Expected one $label, got $xs"};return [lindex $xs 0]}
proc cell {name} {return [one [get_cells -quiet -hier -filter [format {NAME == "%s"} $name]] $name]}
proc normroute {s} {return [regsub -all {\s+} [string trim $s] { }]}
open_checkpoint $root/build_m1/matched_routing_center_launch/experimental_routed.dcp
set core_cells [get_cells -hier -filter {NAME =~ u_puf/u_core/* && (REF_NAME == LUT2 || REF_NAME == LUT3 || REF_NAME =~ FDCE*)}]
if {[llength $core_cells]!=101} {error "Expected 98 LUTs and 3 FFs"}
set placements {}
foreach c $core_cells {
 set pins ""
 if {[get_property REF_NAME $c] in {LUT2 LUT3}} {set pins [get_property LOCK_PINS $c]}
 lappend placements [list [get_property NAME $c] [get_property LOC $c] [get_property BEL $c] $pins]
}
set routes {}
foreach c $core_cells {
 if {[get_property REF_NAME $c] ni {LUT2 LUT3}} {continue}
 set pin [one [get_pins -of_objects $c -filter {REF_PIN_NAME == O}] output]
 lappend routes [list [get_property NAME $pin] [get_property ROUTE [get_nets -of_objects $pin]]]
}
# Preserve all launch/control/challenge driver registers and their critical nets.
set drivers {}
foreach suffix {I0 I1} {
 # I1 is feedback, already captured in the LUT routes above.
 if {$suffix eq "I1"} {continue}
 set p [get_pins u_puf/u_core/u_chain_upper/u_head_gate/$suffix]
 lappend drivers [one [get_pins -leaf -of_objects [get_nets -segments -of_objects $p] -filter {DIRECTION == OUT}] driver]
}
foreach target {u_puf/u_core/u_arbiter_dff/CE u_puf/u_core/u_arbiter_dff/CLR} {
 lappend drivers [one [get_pins -leaf -of_objects [get_nets -segments -of_objects [get_pins $target]] -filter {DIRECTION == OUT}] driver]
}
for {set i 0} {$i<16} {incr i} {
 set p [get_pins [format {u_puf/u_core/u_chain_upper/gen_elem[%d].u_elem/gen_style_p.u_mux/I2} $i]]
 lappend drivers [one [get_pins -leaf -of_objects [get_nets -segments -of_objects $p] -filter {DIRECTION == OUT}] driver]
}
foreach p [lsort -unique $drivers] {
 set c [one [get_cells -of_objects $p] driver_cell]
 lappend placements [list [get_property NAME $c] [get_property LOC $c] [get_property BEL $c] ""]
 # Controller output nets include changed controller feedback/load branches.
 # Preserve their source placements; route those 3 wires afresh in this build.
 # They remain unchanged for every runtime setting of the single bitstream.
 if {![regexp {/puf_(clr|excite|latch)_o_reg/Q$} [get_property NAME $p]]} {
  lappend routes [list [get_property NAME $p] [get_property ROUTE [get_nets -of_objects $p]]]
 }
}
set manifest [open $out/physical_manifest.tcl w]
puts $manifest [list set placements $placements]
puts $manifest [list set routes $routes]
close $manifest
close_design
set manifestRead [open $out/physical_manifest.tcl r]
set savedManifest [read $manifestRead]
close $manifestRead
eval $savedManifest
create_project -in_memory -part xc7a35tcpg236-1
read_verilog [glob $root/rtl/*.v]
read_xdc $root/constraints/basys3_serial.xdc
synth_design -top cbdc_puf_serial_timing -part xc7a35tcpg236-1 -flatten_hierarchy none
opt_design
write_checkpoint -force $out/timing_optimized.dcp
foreach record $placements {
 lassign $record name loc bel pins
 set c [cell $name]
 set_property BEL $bel $c
 set_property LOC $loc $c
 if {$pins ne ""} {set_property LOCK_PINS $pins $c}
}
read_xdc $root/constraints/puf_feedback_acknowledge.xdc
place_design
foreach record $routes {
 lassign $record name route
 if {[string trim $route] eq ""} {error "Empty saved route $name"}
 set p [one [get_pins -quiet -hier -filter [format {NAME == "%s"} $name]] $name]
 set_property FIXED_ROUTE $route [get_nets -of_objects $p]
}
route_design
set f [open $out/route_preservation.txt w]
foreach record $routes {
 lassign $record name route
 set p [one [get_pins -quiet -hier -filter [format {NAME == "%s"} $name]] $name]
 set n [one [get_nets -of_objects $p] net]
 set match [expr {[normroute $route] eq [normroute [get_property ROUTE $n]]}]
 puts $f "$name same=$match status=[get_property ROUTE_STATUS $n]"
 if {!$match || [get_property ROUTE_STATUS $n] ne "ROUTED"} {error "Critical route changed $name"}
}
foreach record $placements {
 lassign $record name loc bel pins
 set c [cell $name]
 if {[get_property LOC $c] ne $loc || [get_property BEL $c] ne $bel} {error "Placement changed $name"}
}
puts $f "PRESERVED [llength $routes] critical nets; [llength $placements] cell placements"
close $f
report_route_status -file $out/route_status.rpt
report_drc -file $out/drc.rpt
if {[llength [get_drc_violations -quiet -filter {SEVERITY == Error}]]} {error "DRC errors"}
report_timing_summary -delay_type min_max -report_unconstrained -file $out/timing_summary.rpt
foreach delay_type {max min} {
 set paths [get_timing_paths -quiet -delay_type $delay_type -max_paths 1]
 if {![llength $paths]} {error "Missing conventional $delay_type timing path"}
 if {[get_property SLACK [lindex $paths 0]] < 0} {error "Conventional $delay_type timing failed"}
}
report_methodology -file $out/methodology.rpt
write_checkpoint -force $out/timing_routed.dcp
write_bitstream -force $out/cbdc_timing_diagnostic.bit
puts "TIMING_BUILD_COMPLETE: $out; FPGA has not been programmed"
