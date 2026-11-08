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
report_utilization -hierarchical -file $out/hierarchy_synth.rpt
set f [open $root/sites.csv w];puts $f {site,x,y,type,tile,tile_type,clock_region,prohibit}
foreach s [get_sites -filter {SITE_TYPE =~ SLICE*}] {
 regexp {SLICE_X([0-9]+)Y([0-9]+)} $s -> x y
 set t [get_tiles -of_objects $s]
 puts $f "$s,$x,$y,[get_property SITE_TYPE $s],$t,[get_property TYPE $t],[get_clock_regions -of_objects $s],[get_property PROHIBIT $s]"
}
close $f
puts "CANDIDATE64_SYNTHESIS_COMPLETE"
