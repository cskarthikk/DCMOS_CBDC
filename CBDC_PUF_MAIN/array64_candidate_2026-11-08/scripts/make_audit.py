from pathlib import Path
r=Path(__file__).resolve().parents[1]
s=(r.parent/'scripts/audit.tcl').read_text().replace('$i<8','$i<64')
s=s.replace('lassign [lindex $layout $i] x y','lassign [lindex $layout $i] x z y ax type')
s=s.replace('[list $x [expr {$x+4}]]','[list $x $z]')
s=s.replace('set head [cell $base/u_chain_$side/gen_fixed_parity_gate.u_head_gate]', '''set head [cell $base/u_chain_$side/gen_fixed_parity_gate.u_head_gate]
  if {[get_property LOC $head] ne "SLICE_X${sx}Y${y}" || ![string match *A6LUT [get_property BEL $head]] || [lsort [get_property LOCK_PINS $head]] ne [lsort {I0:A1 I1:A2}]} {error "Wrong entrance placement/pins"}''')
s=s.replace('for {set j 0} {$j<16} {incr j} {', '''set other [expr {$side eq "upper" ? "lower" : "upper"}]
  if {"[driver $head I0]" ne [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg/Q} $i]} {error "Wrong entrance excitation"}
  if {"[driver $head I1]" ne [format {%s/u_chain_%s/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base $other]} {error "Wrong cross feedback"}
  for {set j 0} {$j<16} {incr j} {''')
s=s.replace('if {$kind eq "mux"} {', '''set stage [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p} $base $side $j]
    if {$kind eq "mux"} {
     if {"[driver $c I0]" ne "$stage.u_buf/O" || "[driver $c I1]" ne "$stage.u_inv/O"} {error "Wrong buffer/inverter mux inputs"}
    } else {
     set prev [expr {$j==0 ? "$base/u_chain_$side/gen_fixed_parity_gate.u_head_gate/O" : [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_mux/O} $base $side [expr {$j-1}]]}]
     if {"[driver $c I0]" ne $prev} {error "Broken stage cascade"}
    }
    if {$kind eq "mux"} {''')
# Existing audit already verifies exact LUT locations, pins, truth tables and connections.
# Also verify the two moved control/arbiter sites explicitly.
s=s.replace('set arb [cell $base/u_arbiter_dff]', '''set arb [cell $base/u_arbiter_dff]
 if {[get_property LOC $arb] ne "SLICE_X${ax}Y[expr {$y+17}]" || ![string match *BFF [get_property BEL $arb]]} {error "Wrong arbiter placement"}
 set ex [cell [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg} $i]]
 if {[get_property LOC $ex] ne "SLICE_X${ax}Y[expr {$y-1}]" || ![string match *AFF [get_property BEL $ex]]} {error "Wrong excitation placement"}''')
s=s[:s.index("# Only the core's unique driven nets")]+ 'source $root/scripts/export_delays.tcl\n'
(r/'scripts/audit.tcl').write_text(s)
