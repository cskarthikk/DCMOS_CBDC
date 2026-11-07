open_checkpoint build_m1/pulled_single/routed.dcp

puts "==================== SLICE TYPES ===================="
puts [format "Upper Chain (X21): %s" [get_property SITE_TYPE [get_sites SLICE_X21Y101]]]
puts [format "Lower Chain (X25): %s" [get_property SITE_TYPE [get_sites SLICE_X25Y101]]]
puts [format "Arbiter     (X23): %s" [get_property SITE_TYPE [get_sites SLICE_X23Y116]]]

puts "==================== STAGE ROUTING ACCUMULATION ===================="
set up_total 0; set lo_total 0

for {set i 0} {$i < 15} {incr i} {
    set u_pin [get_pins u_puf/u_core/u_chain_upper/gen_elem[$i].u_elem/gen_style_p.u_mux/O]
    set l_pin [get_pins u_puf/u_core/u_chain_lower/gen_elem[$i].u_elem/gen_style_p.u_mux/O]
    set unet [get_nets -of_objects $u_pin]
    set lnet [get_nets -of_objects $l_pin]
    
    set u_del [lindex [get_net_delays -of_objects $unet] 0]
    set l_del [lindex [get_net_delays -of_objects $lnet] 0]
    
    set u_ps [get_property SLOW_MAX $u_del]
    set l_ps [get_property SLOW_MAX $l_del]
    
    set up_total [expr {$up_total + $u_ps}]
    set lo_total [expr {$lo_total + $l_ps}]
    
    puts [format "Stage %2d: Upper = %4d ps | Lower = %4d ps | Diff = %+4d ps" $i $u_ps $l_ps [expr {$u_ps - $l_ps}]]
}

puts "---------------------------------------------------------------------"
puts [format "TOTAL INTER-STAGE WIRE DELAY (0-14): Upper = %5d ps | Lower = %5d ps | Total Skew = %+5d ps" $up_total $lo_total [expr {$up_total - $lo_total}]]
