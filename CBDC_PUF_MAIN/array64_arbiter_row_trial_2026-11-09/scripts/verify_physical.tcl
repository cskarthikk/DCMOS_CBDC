set f [open $out/reference_cells.tcl r];set reference [split [read $f] \n];close $f
set checked 0
foreach line $reference {
 if {[string trim $line] eq ""} {continue}
 lassign $line command name site bel pins
 set c [cell $name]
 if {[string match */u_arbiter_dff $name]} {
  regexp {SLICE_X([0-9]+)Y([0-9]+)} $site -> xx yy
  set site SLICE_X${xx}Y[expr {$yy-1}]
  set bel [string map {.BFF .AFF} $bel]
 }
 if {[dict exists $::skipped_controls $name]} {continue}
 if {[get_property LOC $c] ne $site || [get_property BEL $c] ne $bel} {error "Placement changed: $name"}
 if {$pins ne "" && [lsort [get_property LOCK_PINS $c]] ne [lsort $pins]} {error "Pin mapping changed: $name"}
 incr checked
}
if {$checked!=6656-[dict size $::skipped_controls]} {error "Incomplete placement preservation: $checked"}
set pm [dict create];foreach p [get_pins -hier] {dict set pm $p $p}
set f [open $out/reference_fingerprint.csv r];gets $f header
set nchecked 0;set different {};set empty_pips 0
while {[gets $f line]>=0} {
 lassign [split $line ,] p oldnet oldends oldroute oldpips
 if {[string first {gen_elem[15].u_elem/gen_style_p.u_mux/O} $p]>=0} {continue}
 set pin [dict get $pm $p];set n [get_nets -of_objects $pin]
 set ends [lsort [get_pins -leaf -of_objects [get_nets -segments -of_objects $pin]]]
 set pips [lsort [get_pips -of_objects $n]]
 if {$ends ne $oldends || $pips ne $oldpips} {lappend different $p}
 if {$pips eq ""} {incr empty_pips;if {[get_property ROUTE $n] ne $oldroute} {lappend different $p}}
 incr nchecked
}
close $f
set f [open $out/physical_identity.txt w]
puts $f "Checked constrained primitives: $checked"
puts $f "Checked PUF signal routes: $nchecked"
puts $f "Changed endpoint/PIP fingerprints: [llength $different]"
puts $f "Routes without external PIPs checked by route text: $empty_pips"
foreach p $different {puts $f "CHANGED $p"};close $f
if {$nchecked!=6144 || [llength $different]} {error "PUF physical identity not preserved; inspect physical_identity.txt"}
puts "PHYSICAL_IDENTITY_PASS: $checked reference cells (64 arbiters intentionally moved); $nchecked unchanged internal signal trees."
# Observe changes in ordinary Excite/Latch/clear routing separately.
set f [open $out/boundary_delays.csv w];puts $f {net,driver,sink,slow_max_ps,fast_min_ps}
set count 0
for {set i 0} {$i<64} {incr i} {
 foreach {suffix output} {
  u_ctrl/puf_excite_o_reg Q u_ctrl/puf_latch_o_reg Q u_ctrl/puf_clr_o_reg Q
  {u_core/u_chain_upper/gen_elem[15].u_elem/gen_style_p.u_mux} O
  {u_core/u_chain_lower/gen_elem[15].u_elem/gen_style_p.u_mux} O
 } {
  set c [cell [format {gen_core[%d].u_engine/%s} $i $suffix]]
  set p [get_pins -of_objects $c -filter [format {REF_PIN_NAME == %s} $output]]
  set n [get_nets -of_objects $p]
  foreach a [get_net_delays -of_objects $n] {
   set sink [get_property TO_PIN $a]
   if {![string match {*u_core/*} $sink]} {continue}
   puts $f "$n,$p,$sink,[get_property SLOW_MAX $a],[get_property FAST_MIN $a]"
   incr count
  }
 }
 if {$i%16==15} {puts "Boundary audit through core $i"}
}
close $f
if {$count!=512} {error "Incomplete boundary export: $count"}
puts "BOUNDARY_AUDIT_COMPLETE: $count arcs"
