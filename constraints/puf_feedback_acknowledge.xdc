# Acknowledge only the reviewed core feedback. No timing or routing guarantees.
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -of_objects [get_pins -hier -filter {NAME == "u_puf/u_core/u_chain_upper/u_head_gate/O"}]]
