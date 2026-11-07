set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_internal_matched_v2
if {[file exists $out/candidate.bit]} {error "Refusing to overwrite candidate"}
open_checkpoint $out/routed.dcp
set f [open $out/structure_checks.txt w]
set cells [get_cells -hier -filter {NAME =~ u_puf/u_core/* && IS_PRIMITIVE}]
set ffs [filter $cells {REF_NAME =~ FD*}]
if {[llength $ffs] != 1} {error "Expected one core FF"}
puts $f "Core FF count: [llength $ffs]"
puts $f "Core FF: $ffs"
foreach pin {D C CE CLR} {
 set p [get_pins -of_objects $ffs -filter [format {REF_PIN_NAME == "%s"} $pin]]
 set n [get_nets -of_objects $p]
 puts $f "$pin: [get_pins -leaf -of_objects $n -filter {DIRECTION == OUT}]"
}
puts $f "Clock inversion: [get_property IS_C_INVERTED $ffs]"
close $f
report_utilization -hierarchical -file $out/utilization.rpt
report_methodology -file $out/methodology.rpt
write_bitstream $out/candidate.bit
puts "MATCHED_CANDIDATE_READY: $out/candidate.bit"
