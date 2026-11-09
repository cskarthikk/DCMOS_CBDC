# Source: https://github.com/Digilent/digilent-xdc/blob/master/Basys-3-Master.xdc
# Use ONLY with cbdc_puf_serial. Disable controller_ooc.xdc to avoid duplicate clocks.
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -name sys_clk -period 10.000 [get_ports clk]
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]
set_property PACKAGE_PIN P3 [get_ports {led[12]}]
set_property PACKAGE_PIN N3 [get_ports {led[13]}]
set_property PACKAGE_PIN P1 [get_ports {led[14]}]
set_property PACKAGE_PIN L1 [get_ports {led[15]}]
# All LED banks are powered at 3.3 V on Basys 3. Never leave these at DEFAULT.
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports btnU]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
# Asynchronous board inputs: cut only to FIRST synchronizer stages.
# All second-stage and subsequent paths remain timed by sys_clk.
set_false_path -from [get_ports btnU] -to [get_pins -hier -filter {NAME =~ *u_reset/meta_reg/D}]
# LED outputs have no external sampling clock; no invented output delay is used.
# Intentional feedback is NOT waived by this file. No physical symmetry is implied.

set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports uart_tx]
set_false_path -from [get_ports uart_rx] -to [get_pins -hier -filter {NAME =~ *uart/meta_reg/D}]

