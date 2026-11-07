set root [file normalize [file join [file dirname [info script]] ..]]
open_checkpoint $root/../paper_baseline_candidate_2026-11-06/build_internal_matched_v2/routed.dcp
set f [open $root/sites.csv w];puts $f {name,type}
foreach s [get_sites -filter {SITE_TYPE =~ SLICE*}] {puts $f "$s,[get_property SITE_TYPE $s]"}
close $f
