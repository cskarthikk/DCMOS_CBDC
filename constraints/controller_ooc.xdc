# System controller clock only. No fabricated clock on asynchronous Qu/Qb.
# OOC constraint; board pin/IOSTANDARD constraints belong to a later board wrapper.
create_clock -name sys_clk -period 10.000 [get_ports clk]
