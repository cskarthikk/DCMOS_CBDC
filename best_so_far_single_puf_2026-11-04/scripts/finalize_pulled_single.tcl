# Resume the already routed isolated build; no RTL or physical changes.
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_m1/pulled_single
open_checkpoint $out/routed.dcp
set gate [get_cells -hier -filter {NAME == "u_puf/u_core/u_chain_upper/gen_auto_parity_gate.u_head_gate"}]
if {[llength $gate]!=1} {error "Expected one exact PUF head gate"}
set pin [get_pins -of_objects $gate -filter {REF_PIN_NAME == O}]
set net [get_nets -of_objects $pin]
if {[llength $net]!=1} {error "Expected one PUF feedback net"}
set_property ALLOW_COMBINATORIAL_LOOPS TRUE $net
write_checkpoint -force $out/routed.dcp
report_drc -file $out/drc.rpt
write_bitstream -force $out/cbdc_pulled_single.bit
puts "PULLED_SINGLE_READY: $out/cbdc_pulled_single.bit"
