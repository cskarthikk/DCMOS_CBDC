set root [file normalize [file join [file dirname [info script]] ..]]
set main [file normalize [file join $root ../..]]
set_param general.maxThreads 2
create_project -in_memory -part xc7a35tcpg236-1
foreach name {cbdc_uart cbdc_button cbdc_puf_element cbdc_puf_chain cbdc_puf_core cbdc_puf_ctrl cbdc_serial_engine} {read_verilog $main/rtl/$name.v}
read_verilog $root/rtl/cbdc_array_resource.v
read_xdc $main/constraints/basys3_serial.xdc
synth_design -top cbdc_array_resource -part xc7a35tcpg236-1 -flatten_hierarchy none
write_checkpoint $root/resource_128.dcp
report_utilization -file $root/utilization_128.rpt
report_utilization -hierarchical -file $root/hierarchy_128.rpt
puts "SYNTHESIS_ONLY_RESOURCE_ESTIMATE_COMPLETE"
