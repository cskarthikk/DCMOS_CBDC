# Keep ordinary controller/UART logic off the slices used by the routed core.
for {set i 0} {$i<8} {incr i} {
 lassign [lindex $layout $i] x y
 set b [format {gen_core[%d].u_engine/u_core} $i]
 set e [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg} $i]
 set pb [create_pblock puf_region_$i]
 resize_pblock $pb -add "SLICE_X${x}Y${y}:SLICE_X[expr {$x+4}]Y[expr {$y+16}]"
 add_cells_to_pblock $pb [list [cell $b] [cell $e]]
 set_property EXCLUDE_PLACEMENT TRUE $pb
}
