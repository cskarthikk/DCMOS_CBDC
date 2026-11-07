set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/evidence
open_checkpoint $root/../array8_pilot_2026-11-07/build_v2/routed.dcp
set f [open $out/write_sdf_help.txt w];puts $f [help write_sdf];close $f
set f [open $out/site_tiles.csv w];puts $f {site,site_type,tile,tile_type}
foreach s [get_sites -filter {SITE_TYPE =~ SLICE*}] {
 set tile [get_tiles -of_objects $s]
 puts $f "$s,[get_property SITE_TYPE $s],$tile,[get_property TYPE $tile]"
}
close $f
set f [open $out/configuration_drivers.csv w];puts $f {core,bit,driver}
for {set i 0} {$i<8} {incr i} {
 for {set b 0} {$b<16} {incr b} {
  set name [format {gen_core[%d].u_engine/u_ctrl/challenge_i[%d]} $i $b]
  set p [get_pins -hier -filter [format {NAME == "%s"} $name]]
  set n [get_nets -of_objects $p]
  set d [get_pins -leaf -of_objects $n -filter {DIRECTION == OUT}]
  set expected [format {challenge_reg[%d]/Q} [expr {16*$i+$b}]]
  if {"$d" ne $expected} {error "Wrong input configuration driver $name : $d"}
  puts $f "$i,$b,$d"
 }
}
close $f
write_sdf -process_corner slow $out/array_slow.sdf
write_sdf -process_corner fast $out/array_fast.sdf
