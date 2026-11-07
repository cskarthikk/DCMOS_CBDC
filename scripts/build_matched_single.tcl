# Build script for Single CBDC-PUF with MATCHED INTERNAL ROUTING
set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build_m1/matched_single
file mkdir $out

create_project -in_memory -part xc7a35tcpg236-1
set_param general.maxThreads 2

foreach source {cbdc_uart cbdc_button cbdc_puf_element cbdc_puf_chain cbdc_puf_core cbdc_puf_ctrl cbdc_puf_serial} {
    read_verilog $root/rtl/$source.v
}
read_xdc $root/constraints/basys3_serial.xdc

synth_design -top cbdc_puf_serial -part xc7a35tcpg236-1 -flatten_hierarchy none
opt_design

proc exactcell {name} {
    set c [get_cells -quiet -hier -filter [format {NAME == "%s"} $name]]
    if {[llength $c] != 1} {error "Expected exactly one cell: $name; got $c"}
    return $c
}

proc loccell {name loc bel {pins ""}} {
    set c [exactcell $name]
    set_property BEL $bel $c
    set_property LOC $loc $c
    if {$pins ne ""} {set_property LOCK_PINS $pins $c}
}

# 1. Symmetric Paired Placement
foreach chain {upper lower} x {21 25} {
    set base u_puf/u_core/u_chain_$chain
    loccell $base/gen_auto_parity_gate.u_head_gate SLICE_X${x}Y100 A6LUT {I0:A1 I1:A2 I2:A3}
    for {set i 0} {$i < 16} {incr i} {
        set stage [format {%s/gen_elem[%d].u_elem/gen_style_p} $base $i]
        set site SLICE_X${x}Y[expr {101 + $i}]
        loccell $stage.u_buf $site A6LUT {I0:A1 I1:A2}
        loccell $stage.u_inv $site B6LUT {I0:A1 I1:A2}
        loccell $stage.u_mux $site C6LUT {I0:A1 I1:A2 I2:A3}
    }
}

# 2. Centered Launch Driver at X23Y100
loccell u_puf/u_ctrl/puf_excite_o_reg SLICE_X23Y100 AFF

# 3. Arbiters & Edge Locks
loccell u_puf/u_core/u_arbiter_dff SLICE_X23Y116 BFF
loccell u_puf/u_core/gen_dual_arbiter.u_arbiter_b_dff SLICE_X23Y118 BFF
loccell u_puf/u_core/gen_first_edge_lock.u_qb_edge_lock SLICE_X25Y117 AFF
loccell u_puf/u_core/gen_first_edge_lock.u_qu_edge_lock SLICE_X21Y117 AFF

# Combinatorial Loop Acknowledgment
read_xdc $root/constraints/puf_feedback_acknowledge.xdc
set loop_output [get_pins -of_objects [exactcell u_puf/u_core/u_chain_upper/gen_auto_parity_gate.u_head_gate] -filter {REF_PIN_NAME == O}]
set loop_net [get_nets -of_objects $loop_output]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE $loop_net

place_design

# 4. Initial Routing Pass to Discover Valid Route Shapes
route_design

# 5. Extract & Lock Matched Internal Routes (48 pairs)
proc mr_one {xs label} {
    if {[llength $xs] != 1} {error "Expected one $label, got $xs"}
    return [lindex $xs 0]
}
proc mr_net {side suffix} {
    return [mr_one [get_nets -of_objects [get_pins u_puf/u_core/u_chain_${side}/$suffix]] $suffix]
}
proc mr_canonical {route} {return [regsub -all {\s+} [string trim $route] { }]}

set mr_suffixes {gen_auto_parity_gate.u_head_gate/O}
for {set i 0} {$i < 16} {incr i} {
    foreach kind {buf inv} {
        lappend mr_suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_%s/O} $i $kind]
    }
    if {$i < 15} {
        lappend mr_suffixes [format {gen_elem[%d].u_elem/gen_style_p.u_mux/O} $i]
    }
}

puts "=== SELECTING CLEANEST ROUTE TEMPLATES FOR 48 INTERNAL NETS ==="
foreach suffix $mr_suffixes {
    set net_u [mr_net upper $suffix]
    set net_l [mr_net lower $suffix]
    
    set del_u [lindex [get_net_delays -of_objects $net_u] 0]
    set del_l [lindex [get_net_delays -of_objects $net_l] 0]
    set ps_u [get_property SLOW_MAX $del_u]
    set ps_l [get_property SLOW_MAX $del_l]
    
    # Pick the cleaner / lower delay route between upper and lower
    if {$ps_u <= $ps_l} {
        set mr_templates($suffix) [get_property ROUTE $net_u]
    } else {
        set mr_templates($suffix) [get_property ROUTE $net_l]
    }
}

# Unroute and apply FIXED_ROUTE
route_design -unroute

foreach side {upper lower} {
    foreach suffix $mr_suffixes {
        set n [mr_net $side $suffix]
        set_property FIXED_ROUTE $mr_templates($suffix) $n
    }
}

# Re-route remaining nets around the locked internal PUF routes
route_design

# Verify all 48 internal route pairs match 100%
set mr_equal 0
foreach suffix $mr_suffixes {
    set a [mr_net upper $suffix]
    set b [mr_net lower $suffix]
    set same [expr {[mr_canonical [get_property ROUTE $a]] eq [mr_canonical [get_property ROUTE $b]]}]
    if {$same} { incr mr_equal }
}
puts "======================================================="
puts "MATCHED_INTERNAL_PAIRS: $mr_equal / [llength $mr_suffixes]"
puts "======================================================="

write_checkpoint -force $out/routed.dcp
report_route_status -file $out/route_status.rpt
report_timing_summary -report_unconstrained -file $out/timing.rpt
report_drc -file $out/drc.rpt
write_bitstream -force $out/cbdc_matched_single.bit
puts "MATCHED_SINGLE_READY: $out/cbdc_matched_single.bit"
