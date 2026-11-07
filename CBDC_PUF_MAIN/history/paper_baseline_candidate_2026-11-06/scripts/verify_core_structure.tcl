# Run on an open implemented checkpoint; fail closed on architecture drift.
proc one_cell {name} {
 set c [get_cells -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c] != 1} {error "Expected exactly one cell $name"}
 return $c
}
proc drivers_for {cell pin} {
 set p [get_pins -of_objects $cell -filter [format {REF_PIN_NAME == "%s"} $pin]]
 return [get_pins -leaf -of_objects [get_nets -of_objects $p] -filter {DIRECTION == OUT}]
}
set ff [get_cells -hier -filter {NAME =~ u_puf/u_core/* && REF_NAME =~ FD*}]
if {[llength $ff] != 1 || "$ff" ne "u_puf/u_core/u_arbiter_dff"} {error "Core must have exactly one arbiter FF"}
set inversion [get_property IS_C_INVERTED $ff]
if {$inversion ni {1 1'b1 TRUE true}} {error "Arbiter must sample the falling clock edge; got $inversion"}
set f [open $out/structure_checks.txt w]
puts $f "PASS: one core FF; negative-edge capture."
foreach pin {D C CE CLR} expected {
 {u_puf/u_core/u_chain_upper/gen_elem[15].u_elem/gen_style_p.u_mux/O}
 {u_puf/u_core/u_chain_lower/gen_elem[15].u_elem/gen_style_p.u_mux/O}
 u_puf/u_ctrl/puf_latch_o_reg/Q
 u_puf/u_ctrl/puf_clr_o_reg/Q
} {
 set actual [drivers_for $ff $pin]
 if {"$actual" ne $expected} {error "Wrong arbiter $pin driver: $actual"}
 puts $f "PASS: $pin <- $actual"
}
foreach side {upper lower} other {lower upper} {
 set head [one_cell u_puf/u_core/u_chain_$side/gen_fixed_parity_gate.u_head_gate]
 if {[get_property INIT $head] ne "4'h8"} {error "Expected fixed AND entrance"}
 set expected [format {u_puf/u_core/u_chain_%s/gen_elem[15].u_elem/gen_style_p.u_mux/O} $other]
 if {"[drivers_for $head I1]" ne $expected} {error "Cross-feedback connection changed"}
 if {"[drivers_for $head I0]" ne "u_puf/u_ctrl/puf_excite_o_reg/Q"} {error "Wrong excitation driver"}
}
puts $f "PASS: two fixed AND gates; cross feedback; common excitation."
for {set i 0} {$i < 16} {incr i} {
 foreach kind {buf inv mux} expected {4'hA 4'h5 8'hCA} {
  set a [one_cell [format {u_puf/u_core/u_chain_upper/gen_elem[%d].u_elem/gen_style_p.u_%s} $i $kind]]
  set b [one_cell [format {u_puf/u_core/u_chain_lower/gen_elem[%d].u_elem/gen_style_p.u_%s} $i $kind]]
  foreach c [list $a $b] {
   if {![string equal -nocase [get_property INIT $c] $expected]} {error "Wrong LUT truth table: $c"}
  }
  foreach property {REF_NAME BEL LOCK_PINS} {
   if {[get_property $property $a] ne [get_property $property $b]} {error "Unpaired $property at stage $i $kind"}
  }
 }
}
puts $f "PASS: 16 paired stages; buffer/inverter/selector truth tables; paired primitives, BELs and LOCK_PINS."
puts $f "Limit: modeled net equality does not certify analog equality or exact unpublished paper mapping."
close $f
