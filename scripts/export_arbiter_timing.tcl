# Read-only export from the measured timing-diagnostic routed design.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_sim/arbiter_timing
file mkdir $out
open_checkpoint $root/build_m1/timing_diagnostic/timing_routed.dcp
write_verilog -force -mode timesim -sdf_anno false $out/routed.v
foreach corner {slow fast} {write_sdf -force -process_corner $corner $out/$corner.sdf}
write_verilog -force -mode timesim -cell u_puf/u_core -sdf_anno false $out/core_routed.v
foreach corner {slow fast} {write_sdf -force -process_corner $corner -cell u_puf/u_core $out/core_$corner.sdf}
set f [open $out/arbiter_endpoint_delays.txt w]
foreach name {D C CE CLR} {
 set p [get_pins u_puf/u_core/u_arbiter_dff/$name]
 foreach d [get_net_delays -of_objects [get_nets -of_objects $p] -to $p] {
  puts $f "$name SLOW_MAX=[get_property SLOW_MAX $d] SLOW_MIN=[get_property SLOW_MIN $d] FAST_MAX=[get_property FAST_MAX $d] FAST_MIN=[get_property FAST_MIN $d] (ps)"
 }
}
close $f
puts "EXPORT_COMPLETE: $out ; checkpoint and board unchanged"
