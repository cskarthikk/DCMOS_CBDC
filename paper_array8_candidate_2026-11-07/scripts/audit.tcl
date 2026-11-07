proc driver {c pin} {
 set p [get_pins -of_objects $c -filter [format {REF_PIN_NAME == "%s"} $pin]]
 return [get_pins -leaf -of_objects [get_nets -of_objects $p] -filter {DIRECTION == OUT}]
}
set f [open $out/structure.txt w]
for {set i 0} {$i<8} {incr i} {
 lassign [lindex $layout $i] x y
 set base [format {gen_core[%d].u_engine/u_core} $i];set ffs {}
 foreach ff [get_cells -hier -filter {REF_NAME =~ FD*}] {if {[string first "$base/" $ff]==0} {lappend ffs $ff}}
 if {[llength $ffs]!=1} {error "Expected exactly ONE core FF"}
 set arb [cell $base/u_arbiter_dff]
 if {[get_property IS_C_INVERTED $arb] ni {1 1'b1 TRUE true}} {error "Wrong arbiter edge"}
 foreach pin {D C CE CLR} expected [list [format {%s/u_chain_upper/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base] [format {%s/u_chain_lower/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base] [format {gen_core[%d].u_engine/u_ctrl/puf_latch_o_reg/Q} $i] [format {gen_core[%d].u_engine/u_ctrl/puf_clr_o_reg/Q} $i]] {
  if {"[driver $arb $pin]" ne $expected} {error "Wrong arbiter $pin"}
 }
 foreach side {upper lower} sx [list $x [expr {$x+4}]] {
  set head [cell $base/u_chain_$side/gen_fixed_parity_gate.u_head_gate]
  if {![string equal -nocase [get_property INIT $head] "4'h8"]} {error "Wrong head gate"}
  for {set j 0} {$j<16} {incr j} {
   foreach kind {buf inv mux} init {4'hA 4'h5 8'hCA} bel {A6LUT B6LUT C6LUT} pins {{I0:A1 I1:A2} {I0:A1 I1:A2} {I0:A1 I1:A2 I2:A3}} {
    set c [cell [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_%s} $base $side $j $kind]]
    if {![string equal -nocase [get_property INIT $c] $init] || [get_property LOC $c] ne "SLICE_X${sx}Y[expr {$y+$j+1}]" || ![string match "*$bel" [get_property BEL $c]] || [lsort [get_property LOCK_PINS $c]] ne [lsort $pins]} {error "Wrong stage implementation $c"}
    if {$kind eq "mux"} {
     set expected [format {gen_core[%d].u_engine/u_ctrl/puf_c_o_reg[%d]/Q} $i $j]
     if {"[driver $c I2]" ne $expected} {error "Wrong configuration select"}
    }
   }
  }
 }
 puts $f "Core $i PASS: one falling-edge FF; D/clock/Latch/clear wiring; fixed AND; stage truth tables, sites/BELs/pins; all configuration selects."
}
close $f
# Only the core's unique driven nets are exported, not every hierarchical alias.
set f [open $out/net_delays.csv w];puts $f {net,driver,sink,slow_max_ps,fast_min_ps}
set seen [dict create]
foreach c [get_cells -hier -filter {IS_PRIMITIVE}] {
 if {![string match {gen_core*} $c]} {continue}
 if {![string match {*u_core/*} $c] && ![string match {*puf_excite_o_reg} $c] && ![string match {*puf_latch_o_reg} $c] && ![string match {*puf_clr_o_reg} $c]} {continue}
 foreach p [get_pins -of_objects $c -filter {DIRECTION == OUT}] {
  set n [get_nets -of_objects $p]
  foreach arc [get_net_delays -of_objects $n] {
   set sink [get_property TO_PIN $arc];set key "$p->$sink"
   if {[dict exists $seen $key]} {continue};dict set seen $key 1
   puts $f "$n,$p,$sink,[get_property SLOW_MAX $arc],[get_property FAST_MIN $arc]"
  }
 }
}
close $f
