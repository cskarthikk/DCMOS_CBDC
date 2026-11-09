set root [file normalize [file join [file dirname [info script]] ..]]
set main [file normalize [file join $root ../..]]
open_checkpoint $main/build_matched/routed.dcp
report_property -all [get_sites SLICE_X1Y0]
puts "SITE_PROPERTIES [list_property [get_sites SLICE_X1Y0]]"
report_utilization -file $root/device_capacity.rpt
set f [open $root/site_availability.csv w]
puts $f {site,prohibit,is_used}
foreach s [get_sites -filter {SITE_TYPE =~ SLICE*}] {puts $f "$s,[get_property PROHIBIT $s],[get_property IS_USED $s]"}
close $f
