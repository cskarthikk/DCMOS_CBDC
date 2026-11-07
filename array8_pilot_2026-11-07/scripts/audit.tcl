set f [open $out/net_delays.csv w];puts $f {net,driver,sink,slow_max_ps,fast_min_ps}
set seen [dict create]
foreach n [get_nets -hier] {
 set d [get_pins -leaf -of_objects $n -filter {DIRECTION == OUT}]
 if {![string match {gen_core*} $d]} {continue}
 foreach arc [get_net_delays -of_objects $n] {
  set sink [get_property TO_PIN $arc];set key "$d->$sink"
  if {[dict exists $seen $key]} {continue};dict set seen $key 1
  puts $f "$n,$d,$sink,[get_property SLOW_MAX $arc],[get_property FAST_MIN $arc]"
 }
}
close $f
set f [open $out/structure.txt w]
proc check_driver {name pin expected} {
 set c [cell $name]
 set p [get_pins -of_objects $c -filter [format {REF_PIN_NAME == "%s"} $pin]]
 set d [get_pins -leaf -of_objects [get_nets -of_objects $p] -filter {DIRECTION == OUT}]
 if {"$d" ne $expected} {error "Wrong driver $name/$pin: $d; expected $expected"}
}
for {set i 0} {$i<8} {incr i} {
 set base [format {gen_core[%d].u_engine/u_core} $i]
 set ffs {}
 foreach ff [get_cells -hier -filter {REF_NAME =~ FD*}] {if {[string first "$base/" $ff]==0} {lappend ffs $ff}}
 if {[llength $ffs]!=4} {error "Wrong FF count in core $i"}
 puts $f "Core $i: [llength $ffs] FFs (2 arbiters and 2 edge locks)."
 foreach arb {u_arbiter_dff gen_dual_arbiter.u_arbiter_b_dff} {
  set c [cell $base/$arb]
  if {[get_property IS_C_INVERTED $c] ni {1 1'b1 TRUE true}} {error "Wrong arbiter edge"}
 }
 set upper [format {%s/u_chain_upper/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base]
 set lower [format {%s/u_chain_lower/gen_elem[15].u_elem/gen_style_p.u_mux/O} $base]
 check_driver $base/u_arbiter_dff D $upper
 check_driver $base/u_arbiter_dff C $lower
 check_driver $base/gen_dual_arbiter.u_arbiter_b_dff D $lower
 check_driver $base/gen_dual_arbiter.u_arbiter_b_dff C $upper
 check_driver $base/u_chain_upper/gen_auto_parity_gate.u_head_gate I1 $lower
 check_driver $base/u_chain_lower/gen_auto_parity_gate.u_head_gate I1 $upper
 foreach side {upper lower} {
  set head [cell $base/u_chain_$side/gen_auto_parity_gate.u_head_gate]
  if {![string equal -nocase [get_property INIT $head] "8'h87"]} {error "Wrong automatic parity gate"}
  for {set s 0} {$s<16} {incr s} {
   foreach kind {buf inv mux} init {4'hA 4'h5 8'hCA} {
    set c [cell [format {%s/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_%s} $base $side $s $kind]]
    if {![string equal -nocase [get_property INIT $c] $init]} {error "Wrong stage truth table"}
   }
  }
 }
}
close $f
