proc driver {c pin} {
 set p [get_pins -of_objects $c -filter [format {REF_PIN_NAME == "%s"} $pin]]
 return [get_pins -leaf -of_objects [get_nets -of_objects $p] -filter {DIRECTION == OUT}]
}
set f [open $out/structure.txt w]
for {set i 0} {$i<64} {incr i} {
 lassign [lindex $layout $i] x z y ax type
 set base [format {gen_core[%d].u_engine/u_core} $i];set ffs {}
 foreach ff [get_cells -hier -filter {REF_NAME =~ FD*}] {if {[string first "$base/" $ff]==0} {lappend ffs $ff}}
 if {[llength $ffs]!=1} {error "Expected exactly ONE core FF"}
 set arb [cell $base/u_arbiter_dff]
 if {[get_property LOC $arb] ne "SLICE_X${ax}Y[expr {$y+17}]" || ![string match *BFF [get_property BEL $arb]]} {error "Wrong arbiter placement"}
 set ex [cell [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg} $i]]
 if {[get_property LOC $ex] ne "SLICE_X${ax}Y[expr {$y-1}]" || ![string match *AFF [get_property BEL $ex]]} {error "Wrong excitation placement"}
 if {[get_property IS_C_INVERTED $arb] ni {1 1'b1 TRUE true}} {error "Wrong arbiter edge"}
 foreach pin {D C CE CLR} expected [list [format {%s/u_chain_upper/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base] [format {%s/u_chain_lower/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base] [format {gen_core[%d].u_engine/u_ctrl/puf_latch_o_reg/Q} $i] [format {gen_core[%d].u_engine/u_ctrl/puf_clr_o_reg/Q} $i]] {
  if {"[driver $arb $pin]" ne $expected} {error "Wrong arbiter $pin"}
 }
 foreach side {upper lower} sx [list $x $z] {
  set head [cell $base/u_chain_$side/gen_fixed_parity_gate.u_head_gate]
  if {[get_property LOC $head] ne "SLICE_X${sx}Y${y}" || ![string match *A6LUT [get_property BEL $head]] || [lsort [get_property LOCK_PINS $head]] ne [lsort {I0:A1 I1:A2}]} {error "Wrong entrance placement/pins"}
  if {![string equal -nocase [get_property INIT $head] "4'h8"]} {error "Wrong head gate"}
  set other [expr {$side eq "upper" ? "lower" : "upper"}]
  if {"[driver $head I0]" ne [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg/Q} $i]} {error "Wrong entrance excitation"}
  if {"[driver $head I1]" ne [format {%s/u_chain_%s/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base $other]} {error "Wrong cross feedback"}
  for {set j 0} {$j<16} {incr j} {
   foreach kind {buf inv mux} init {4'hA 4'h5 8'hCA} bel {A6LUT B6LUT C6LUT} pins {{I0:A1 I1:A2} {I0:A1 I1:A2} {I0:A1 I1:A2 I2:A3}} {
    set c [cell [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_%s} $base $side $j $kind]]
    if {![string equal -nocase [get_property INIT $c] $init] || [get_property LOC $c] ne "SLICE_X${sx}Y[expr {$y+$j+1}]" || ![string match "*$bel" [get_property BEL $c]] || [lsort [get_property LOCK_PINS $c]] ne [lsort $pins]} {error "Wrong stage implementation $c"}
    set stage [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p} $base $side $j]
    if {$kind eq "mux"} {
     if {"[driver $c I0]" ne "$stage.u_buf/O" || "[driver $c I1]" ne "$stage.u_inv/O"} {error "Wrong buffer/inverter mux inputs"}
    } else {
     set prev [expr {$j==0 ? "$base/u_chain_$side/gen_fixed_parity_gate.u_head_gate/O" : [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_mux/O} $base $side [expr {$j-1}]]}]
     if {"[driver $c I0]" ne $prev} {error "Broken stage cascade"}
    }
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
source $root/scripts/export_delays.tcl
