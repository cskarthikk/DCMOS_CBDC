set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_m1/core_experiment
foreach test {fast_min fast_max slow_min slow_max} {
 set f [open $root/build_sim/experiment_postroute/$test/run.log r]
 # Windows PowerShell redirects native logs as UTF-16; decode before checking.
 fconfigure $f -translation binary
 set bom [binary encode hex [read $f 2]];seek $f 0
 if {$bom eq "fffe"} {fconfigure $f -encoding unicode -translation auto} else {fconfigure $f -encoding utf-8 -translation auto}
 set log [read $f];close $f
 set pass_index [string first {PASS: postroute} $log]
 set has_bad [regexp -nocase {Timing violation|Fatal:|ERROR:} $log]
 puts "QUALIFICATION $test pass_index=$pass_index invalid_message=$has_bad"
 if {$pass_index < 0 || $has_bad} {error "Postroute qualification failed for $test"}
}
open_checkpoint $out/timing_routed.dcp
report_drc -file $out/final_drc.rpt
if {[llength [get_drc_violations -quiet -filter {SEVERITY == Error}]]} {error "DRC errors"}
write_bitstream -force $out/cbdc_core_experiment.bit
puts "EXPERIMENT_BITSTREAM_READY: $out/cbdc_core_experiment.bit ; board unchanged"
