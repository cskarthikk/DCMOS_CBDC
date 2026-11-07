open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
set dev [lindex [get_hw_devices] 0]
current_hw_device $dev
refresh_hw_device -update_hw_probes false $dev
set_property PROGRAM.FILE {build_m1/matched_single/cbdc_matched_single.bit} $dev
program_hw_devices $dev
close_hw_target
disconnect_hw_server
close_hw_manager
puts ">>> MATCHED BITSTREAM PROGRAMMED! <<<"
