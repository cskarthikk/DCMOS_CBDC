set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
if {[file exists $out]} {error "Preserve existing build"};file mkdir $out
set_param general.maxThreads 2
create_project -in_memory -part xc7a35tcpg236-1
foreach name {cbdc_uart cbdc_button cbdc_puf_element cbdc_puf_chain cbdc_puf_core cbdc_puf_ctrl cbdc_serial_engine cbdc_array8_serial} {read_verilog $root/rtl/$name.v}
read_xdc $root/constraints/basys3_serial.xdc
synth_design -top cbdc_array8_serial -part xc7a35tcpg236-1 -flatten_hierarchy none
opt_design
write_checkpoint $out/synthesized.dcp
proc cell {name} {
 set c [get_cells -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1} {error "Expected one cell $name"};return $c
}
proc locate {name site bel {pins ""}} {
 set c [cell $name];set_property BEL $bel $c;set_property LOC $site $c
 if {$pins ne ""} {set_property LOCK_PINS $pins $c}
}
set f [open $root/layout.tcl r];set layout [read $f];close $f
set f [open $out/placement.csv w];puts $f {core,upper_x,lower_x,head_y,arbiter_x}
for {set i 0} {$i<8} {incr i} {
 lassign [lindex $layout $i] x y
 set b [format {gen_core[%d].u_engine/u_core} $i]
 puts $f "$i,$x,[expr {$x+4}],$y,[expr {$x+2}]"
 foreach side {upper lower} sx [list $x [expr {$x+4}]] {
  set ch $b/u_chain_$side
  locate $ch/gen_fixed_parity_gate.u_head_gate SLICE_X${sx}Y$y A6LUT {I0:A1 I1:A2}
  for {set j 0} {$j<16} {incr j} {
   set stage [format {%s/gen_elem[%d].u_elem/gen_style_p} $ch $j]
   set site SLICE_X${sx}Y[expr {$y+$j+1}]
   locate $stage.u_buf $site A6LUT {I0:A1 I1:A2}
   locate $stage.u_inv $site B6LUT {I0:A1 I1:A2}
   locate $stage.u_mux $site C6LUT {I0:A1 I1:A2 I2:A3}
  }
 }
 locate $b/u_arbiter_dff SLICE_X[expr {$x+2}]Y[expr {$y+16}] BFF
 # Center the ordinary excitation driver; it must not share the PUF arbiter slice/clock.
 set engine [format {gen_core[%d].u_engine} $i]
 locate $engine/u_ctrl/puf_excite_o_reg SLICE_X[expr {$x+2}]Y$y AFF
 set p [get_pins -of_objects [cell $b/u_chain_upper/gen_fixed_parity_gate.u_head_gate] -filter {REF_PIN_NAME == O}]
 set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -of_objects $p]
}
close $f
source $root/scripts/protect.tcl
write_checkpoint $out/optimized.dcp
place_design
# Reserve the verified internal route topology before routing ordinary logic.
# Matching tile types and within-tile slice orientation are required by the layout.
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
