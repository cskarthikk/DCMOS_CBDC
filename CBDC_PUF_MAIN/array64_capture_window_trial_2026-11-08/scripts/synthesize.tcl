set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 2
create_project -in_memory -part xc7a35tcpg236-1
foreach n {cbdc_uart cbdc_button cbdc_puf_element cbdc_puf_chain cbdc_puf_core cbdc_puf_ctrl cbdc_serial_engine cbdc_array64_serial} {read_verilog $root/rtl/$n.v}
read_xdc $root/basys3_serial.xdc
synth_design -top cbdc_array64_serial -part xc7a35tcpg236-1 -flatten_hierarchy none
opt_design
write_checkpoint $out/synthesized.dcp
report_utilization -file $out/utilization_synth.rpt
puts "CAPTURE64_SYNTHESIS_COMPLETE"
