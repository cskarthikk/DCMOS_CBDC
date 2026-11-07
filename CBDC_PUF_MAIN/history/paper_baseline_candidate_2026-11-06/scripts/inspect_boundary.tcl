set root [file normalize [file join [file dirname [info script]] ..]]
open_checkpoint $root/build_internal_matched_v2/routed.dcp
puts [help route_design]
foreach name {u_puf/excite u_puf/u_core/qu_w u_puf/u_core/qb_w} {
 set n [get_nets -hier -filter [format {NAME == "%s"} $name]]
 puts "BOUNDARY $name ROUTE=[get_property ROUTE $n]"
 puts "BOUNDARY $name NODES=[get_nodes -of_objects $n]"
}
puts "EXCITE_CELL [get_property LOC [get_cells u_puf/u_ctrl/puf_excite_o_reg]]"
