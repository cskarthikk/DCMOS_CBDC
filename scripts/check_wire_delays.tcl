open_checkpoint build_m1/pulled_single/routed.dcp
set net_qu [get_nets -hier -filter {NAME =~ *qu_w}]
set net_qb [get_nets -hier -filter {NAME =~ *qb_w}]

puts "==================== QU NET DELAYS (Upper Chain) ===================="
foreach d [get_net_delays -of_objects $net_qu] {
    puts [format "%-45s : SLOW_MAX=%4d ps | FAST_MIN=%4d ps" [get_property TO_PIN $d] [get_property SLOW_MAX $d] [get_property FAST_MIN $d]]
}

puts "==================== QB NET DELAYS (Lower Chain) ===================="
foreach d [get_net_delays -of_objects $net_qb] {
    puts [format "%-45s : SLOW_MAX=%4d ps | FAST_MIN=%4d ps" [get_property TO_PIN $d] [get_property SLOW_MAX $d] [get_property FAST_MIN $d]]
}
