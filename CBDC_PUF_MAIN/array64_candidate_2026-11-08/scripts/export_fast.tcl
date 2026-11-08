# Keep Vivado's typed collection: get_net_delays accepts multiple nets only as objects.
set cs [get_cells -hier -filter {IS_PRIMITIVE && REF_NAME != GND && REF_NAME != VCC && (NAME =~ *u_core/* || NAME =~ *puf_excite_o_reg || NAME =~ *puf_latch_o_reg || NAME =~ *puf_clr_o_reg)}]
set ps [get_pins -of_objects $cs -filter {DIRECTION == OUT}]
set ns [get_nets -of_objects $ps]
puts "Typed collection signal nets: [llength $ns]"
set arcs [get_net_delays -of_objects $ns]
puts "Typed collection returned [llength $arcs] delay arcs"
set sources [dict create]
foreach p $ps {foreach n [get_nets -of_objects $p] {dict set sources $n $p}}
set f [open $out/net_delays_batch.csv w];puts $f {net,driver,sink,slow_max_ps,fast_min_ps}
set seen [dict create]
foreach a $arcs {
 set n [get_property NET $a];set sink [get_property TO_PIN $a]
 if {![dict exists $sources $n]} {error "Unexpected net alias $n"}
 set source [dict get $sources $n];set k "$source->$sink"
 if {[dict exists $seen $k]} {continue};dict set seen $k 1
 puts $f "$n,$source,$sink,[get_property SLOW_MAX $a],[get_property FAST_MIN $a]"
}
close $f
puts "TYPED_DELAY_EXPORT_COMPLETE [dict size $seen]"
