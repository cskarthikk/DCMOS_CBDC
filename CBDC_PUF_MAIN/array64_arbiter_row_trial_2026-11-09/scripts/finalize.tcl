set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 2
if {![info exists already_open] || !$already_open} {open_checkpoint $out/routed.dcp}
report_route_status -file $out/route_status_final.rpt
report_utilization -file $out/utilization_final.rpt
report_drc -file $out/drc_final.rpt
set errs [get_drc_violations -quiet -filter {SEVERITY == Error}]
if {[llength $errs]} {error "DRC errors remain: $errs"}
foreach typ {max min} {
 set p [get_timing_paths -quiet -from [get_clocks sys_clk] -to [get_clocks sys_clk] -delay_type $typ -max_paths 1]
 if {[llength $p]!=1 || [get_property SLACK $p]<0} {error "Synchronous $typ timing has not closed"}
}
set f [open $out/structure.txt r];set t [read $f];close $f
if {[regexp -all {Core [0-9]+ PASS:} $t]!=64} {error "Structural audit incomplete"}
# Python review checks internal-route matching separately before this script is invoked.
write_bitstream $out/paper_array64.bit
puts "CANDIDATE64_BITSTREAM_READY"
