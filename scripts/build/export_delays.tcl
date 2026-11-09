set nets [dict create]
set driver_nets [dict create]
foreach c [get_cells -hier -filter {IS_PRIMITIVE}] {
 if {![string match {gen_core*} $c]} {continue}
 if {[get_property REF_NAME $c] in {GND VCC}} {continue}
 if {![string match {*u_core/*} $c] && ![string match {*puf_excite_o_reg} $c] && ![string match {*puf_latch_o_reg} $c] && ![string match {*puf_clr_o_reg} $c]} {continue}
 foreach p [get_pins -of_objects $c -filter {DIRECTION == OUT}] {
  foreach n [get_nets -of_objects $p] {dict set nets $n $p;dict set driver_nets $p $n}
 }
}
puts "Exporting modeled delays for [dict size $nets] signal-driver nets"
set f [open $out/net_delays.csv w];puts $f {net,driver,sink,slow_max_ps,fast_min_ps}
set seen [dict create]
set count 0
foreach n [dict keys $nets] {
 foreach arc [get_net_delays -of_objects $n] {
 set source [dict get $nets $n];set sink [get_property TO_PIN $arc]
 if {$source eq "" || $sink eq ""} {error "Missing delay arc endpoint"}
 set key "$source->$sink"
 if {[dict exists $seen $key]} {continue};dict set seen $key 1
 if {![dict exists $driver_nets $source]} {error "Unexpected signal-delay driver $source"}
 puts $f "[dict get $driver_nets $source],$source,$sink,[get_property SLOW_MAX $arc],[get_property FAST_MIN $arc]"
 }
 incr count
 if {$count%500==0} {puts "Exported $count signal-driver nets"}
}
close $f
puts "SIGNAL_DELAY_EXPORT_COMPLETE: [dict size $seen] arcs"
