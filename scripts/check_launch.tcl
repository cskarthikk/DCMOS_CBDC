open_checkpoint build_m1/pulled_single/routed.dcp

set up_gate [get_pins u_puf/u_core/u_chain_upper/gen_auto_parity_gate.u_head_gate/I0]
set lo_gate [get_pins u_puf/u_core/u_chain_lower/gen_auto_parity_gate.u_head_gate/I0]

set excite_net [get_nets -of_objects $up_gate]
set driver_pin [get_pins -leaf -of_objects $excite_net -filter {DIRECTION == OUT}]
set driver_cell [get_cells -of_objects $driver_pin]

puts "==================== LAUNCH DRIVER & DELAYS ===================="
puts "Excite Driver Cell : $driver_cell"
puts "Driver Placement   : [get_property LOC $driver_cell] / [get_property BEL $driver_cell]"

foreach d [get_net_delays -of_objects $excite_net] {
    set to_pin [get_property TO_PIN $d]
    if {$to_pin eq $up_gate || $to_pin eq $lo_gate} {
        puts [format "%-65s : SLOW_MAX=%4d ps | FAST_MIN=%4d ps" $to_pin [get_property SLOW_MAX $d] [get_property FAST_MIN $d]]
    }
}
