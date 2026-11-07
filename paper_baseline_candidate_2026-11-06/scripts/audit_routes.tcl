# Read-only physical evidence. Equal placement does not establish equal routing.
set f [open $out/net_delays.csv w]
puts $f {net,from_pin,to_pin,slow_max_ps,fast_min_ps}
foreach n [get_nets -hier -filter {NAME =~ u_puf/*}] {
 set driver [get_pins -leaf -of_objects $n -filter {DIRECTION == OUT}]
 foreach d [get_net_delays -of_objects $n] {
  puts $f "$n,$driver,[get_property TO_PIN $d],[get_property SLOW_MAX $d],[get_property FAST_MIN $d]"
 }
}
close $f
set f [open $out/physical_cells.csv w]
puts $f {cell,primitive,site,bel,locked_pins}
foreach c [get_cells -hier -filter {NAME =~ u_puf/u_core/* && IS_PRIMITIVE}] {
 set pins ""
 if {[string match LUT* [get_property REF_NAME $c]]} {set pins [get_property LOCK_PINS $c]}
 puts $f "$c,[get_property REF_NAME $c],[get_property LOC $c],[get_property BEL $c],$pins"
}
close $f
