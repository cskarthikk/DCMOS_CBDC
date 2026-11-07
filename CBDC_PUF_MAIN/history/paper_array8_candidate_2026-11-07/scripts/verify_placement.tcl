set root [file normalize [file join [file dirname [info script]] ..]]
set variant build
if {[llength $argv]} {set variant [lindex $argv 0]}
if {$variant ni {build build_matched}} {error "Unknown output directory"}
open_checkpoint $root/$variant/routed.dcp
set f [open $root/layout.tcl r];set layout [read $f];close $f
set count 0
proc verify {name site bel {pins ""}} {
 set c [get_cells -hier -filter [format {NAME == "%s"} $name]]
 if {[llength $c]!=1 || [get_property LOC $c] ne $site || ![string match "*$bel" [get_property BEL $c]]} {error "Wrong implemented placement: $name"}
 if {$pins ne "" && [lsort [get_property LOCK_PINS $c]] ne [lsort $pins]} {error "Wrong pin locking: $name"}
 incr ::count
}
for {set i 0} {$i<8} {incr i} {
 lassign [lindex $layout $i] x y
 set base [format {gen_core[%d].u_engine/u_core} $i]
 foreach side {upper lower} sx [list $x [expr {$x+4}]] {
  set chain $base/u_chain_$side
  verify $chain/gen_fixed_parity_gate.u_head_gate SLICE_X${sx}Y$y A6LUT {I0:A1 I1:A2}
  for {set stage 0} {$stage<16} {incr stage} {
   set b [format {%s/gen_elem[%d].u_elem/gen_style_p} $chain $stage]
   set site SLICE_X${sx}Y[expr {$y+1+$stage}]
   verify $b.u_buf $site A6LUT {I0:A1 I1:A2}
   verify $b.u_inv $site B6LUT {I0:A1 I1:A2}
   verify $b.u_mux $site C6LUT {I0:A1 I1:A2 I2:A3}
  }
 }
 verify $base/u_arbiter_dff SLICE_X[expr {$x+2}]Y[expr {$y+16}] BFF
 verify [format {gen_core[%d].u_engine/u_ctrl/puf_excite_o_reg} $i] SLICE_X[expr {$x+2}]Y$y AFF
}
if {$count!=800} {error "Incomplete placement audit"}
set f [open $root/$variant/placement_verified.txt w]
puts $f "PASS: all 800 constrained PUF primitives have the planned implemented sites/BELs and all 784 LUTs have the intended input pin locks."
close $f
