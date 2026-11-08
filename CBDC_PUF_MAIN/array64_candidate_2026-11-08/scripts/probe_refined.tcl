set pin_map [dict create];foreach p [get_pins -hier] {dict set pin_map $p $p}
set f [open $out/refined_probe.csv w];puts $f {core,kind,stage,upper_slow,lower_slow,upper_fast,lower_fast}
foreach i {1 2 11 61} {
 foreach kind {mux inv} stages {{0 1} {5 7 8}} {
  foreach j $stages {
   set values {}
   foreach side {upper lower} {
    set p [dict get $pin_map [format {gen_core[%d].u_engine/u_core/u_chain_%s/gen_elem[%d].u_elem/gen_style_p.u_%s/O} $i $side $j $kind]]
    set a [lindex [get_net_delays -of_objects [get_nets -of_objects $p]] 0]
    lappend values [list [get_property SLOW_MAX $a] [get_property FAST_MIN $a]]
   }
   lassign [lindex $values 0] us uf;lassign [lindex $values 1] ls lf
   puts $f "$i,$kind,$j,$us,$ls,$uf,$lf"
   puts "PROBE core=$i kind=$kind stage=$j slow_skew=[expr {$us-$ls}] fast_skew=[expr {$uf-$lf}]"
  }
 }
}
close $f
