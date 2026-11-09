# Acknowledge intentional PUF ring oscillator feedback loops across all macro cores
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -hier -filter {NAME =~ "*qu_w*" || NAME =~ "*qb_w*" || NAME =~ "*u_head_gate/O*"}]
