open_checkpoint build_m1/pulled_single/routed.dcp

set qu [get_nets -hier -filter {NAME =~ *qu_w}]
set qb [get_nets -hier -filter {NAME =~ *qb_w}]

puts "==================== QU ROUTE STRING ===================="
puts [get_property ROUTE $qu]

puts "==================== QB ROUTE STRING ===================="
puts [get_property ROUTE $qb]
