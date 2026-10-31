# Future synthesis audit only: no implementation, loop waiver, or bitstream.
# vivado -mode batch -source scripts/run_m1_vivado.tcl
# Optional experimental comparison: append -tclargs --compare-2lut
set root [file normalize [file join [file dirname [info script]] ..]]
set out [file join $root build_m1]
file mkdir $out
set styles {0}
foreach arg $argv {
    if {$arg ne "--compare-2lut"} {error "Unknown argument: $arg"}
    set styles {0 1}
}
set sources {}
foreach f {cbdc_puf_element.v cbdc_puf_chain.v cbdc_puf_core.v cbdc_puf_ctrl.v cbdc_puf_top.v} {
    lappend sources [file join $root rtl $f]
}
proc one {objects label} {
    if {[llength $objects] != 1} {error "$label: expected one object, got $objects"}
    return [lindex $objects 0]
}
proc pin {path} {
    return [one [get_pins -quiet -hier -filter [format {NAME == "%s"} $path]] $path]
}
proc connected {a b} {
    set na [get_nets -quiet -segments -of_objects $a]
    set nb [get_nets -quiet -segments -of_objects $b]
    foreach n $na {if {[lsearch -exact $nb $n] >= 0} {return}}
    error "Required connection absent: $a <-> $b"
}
proc lut {path ref init} {
    set c [one [get_cells -quiet -hier -filter [format {NAME == "%s"} $path]] $path]
    if {[get_property REF_NAME $c] ne $ref} {error "Unexpected primitive at $path"}
    set actual [get_property INIT $c]
    if {![regexp -nocase {^[0-9]+'h([0-9a-f]+)$} $actual -> digits]} {
        error "Unexpected INIT representation at $path: $actual"
    }
    scan $digits %x value
    if {$value != $init} {error "Wrong INIT at $path: $actual"}
}
proc audit_core {style} {
    set n2 [llength [get_cells -hier -filter {REF_NAME == LUT2}]]
    set n3 [llength [get_cells -hier -filter {REF_NAME == LUT3}]]
    set ff [get_cells -hier -filter {REF_NAME == FDCE}]
    if {$n2 != 66 || $n3 != ($style == 0 ? 32 : 0) || [llength $ff] != 1} {
        error "Unexpected counts: LUT2=$n2 LUT3=$n3 FDCE=[llength $ff]"
    }
    foreach side {upper lower} {
        set chain u_chain_$side
        lut $chain/u_head_gate LUT2 8
        connected [pin $chain/u_head_gate/I0] [get_ports excite]
        set previous [pin $chain/u_head_gate/O]
        for {set i 0} {$i < 16} {incr i} {
            set base [format {%s/gen_elem[%d].u_elem} $chain $i]
            set challenge [get_ports [format {c[%d]} $i]]
            if {$style == 0} {
                set b $base/gen_style_p.u_buf
                set v $base/gen_style_p.u_inv
                set m $base/gen_style_p.u_mux
                lut $b LUT2 10
                lut $v LUT2 5
                lut $m LUT3 202
                connected [pin $b/I0] $previous
                connected [pin $v/I0] $previous
                connected [pin $m/I0] [pin $b/O]
                connected [pin $m/I1] [pin $v/O]
                connected [pin $m/I2] $challenge
                set previous [pin $m/O]
            } else {
                set a $base/gen_style_2lut.u_lut_a
                set b $base/gen_style_2lut.u_lut_b
                lut $a LUT2 10
                lut $b LUT2 6
                connected [pin $a/I0] $previous
                connected [pin $b/I0] [pin $a/O]
                connected [pin $b/I1] $challenge
                set previous [pin $b/O]
            }
        }
        set terminal($side) $previous
    }
    connected $terminal(upper) [pin u_chain_lower/u_head_gate/I1]
    connected $terminal(lower) [pin u_chain_upper/u_head_gate/I1]
    set arb [one $ff arbiter]
    foreach property {INIT IS_CLR_INVERTED IS_D_INVERTED} {
        set value [get_property $property $arb]
        if {$value ni {0 1'b0 1'h0 FALSE false}} {error "Unexpected $property=$value on $arb"}
    }
    connected [pin $arb/D] $terminal(upper)
    connected [pin $arb/CE] [get_ports latch]
    connected [pin $arb/CLR] [get_ports clr]
    connected [pin $arb/Q] [get_ports q]
    # FDCE_1 retargeting may preserve an inverter until opt_design. Verify either form.
    set inv [get_property IS_C_INVERTED $arb]
    set clock_pin [pin $arb/C]
    if {$inv in {1 1'b1 TRUE true}} {
        set expected_inverters 0
        connected $clock_pin $terminal(lower)
    } else {
        if {$inv ni {0 1'b0 FALSE false}} {error "Unknown clock inversion: $inv"}
        set expected_inverters 1
        set nets [get_nets -segments -of_objects $clock_pin]
        set drivers [get_pins -quiet -leaf -of_objects $nets -filter {DIRECTION == OUT}]
        set driver [one $drivers clock_inverter_output]
        set cell [one [get_cells -of_objects $driver] clock_inverter]
        set ref [get_property REF_NAME $cell]
        if {$ref eq "INV"} {
            connected [pin $cell/I] $terminal(lower)
        } elseif {$ref eq "LUT1"} {
            lut $cell LUT1 1
            connected [pin $cell/I0] $terminal(lower)
        } else {error "Unverified negative-edge mapping: $ref at $cell"}
    }
    set unexpected [get_cells -hier -filter {IS_PRIMITIVE == 1 && REF_NAME != LUT2 && REF_NAME != LUT3 && REF_NAME != FDCE && REF_NAME != GND && REF_NAME != VCC && REF_NAME != INV && REF_NAME != LUT1}]
    if {[llength $unexpected]} {error "Unexpected primitives: $unexpected"}
    if {[llength [get_cells -hier -filter {REF_NAME == INV || REF_NAME == LUT1}]] != $expected_inverters} {
        error "Unexpected additional inversion logic"
    }
    puts "PASS: core counts, INITs, stage/challenge wiring, cross-coupling and arbiter polarity"
}
foreach style $styles {
    create_project -in_memory -part xc7a35tcpg236-1
    read_verilog $sources
    synth_design -top cbdc_puf_core -part xc7a35tcpg236-1 -mode out_of_context \
        -flatten_hierarchy none -generic ELEMENT_STYLE=$style
    audit_core $style
    set prefix [file join $out core_style_$style]
    report_utilization -file ${prefix}_util.rpt
    set loop_report core_loops_$style
    report_drc -name $loop_report -checks [get_drc_checks LUTLP-1] -file ${prefix}_loop_drc.rpt
    set violations [get_drc_violations -quiet -name $loop_report]
    if {![llength $violations]} {
        puts "REVIEW REQUIRED: no LUTLP-1 object at this stage; structural feedback was checked separately."
    }
    foreach violation $violations {
        set cells [get_cells -quiet -of_objects $violation]
        if {![llength $cells]} {error "Cannot establish loop membership for $violation"}
        foreach cell $cells {
            if {![regexp {^u_chain_(upper|lower)/} [get_property NAME $cell]]} {
                error "Loop DRC includes a cell outside the two PUF chains: $cell"
            }
        }
    }
    write_verilog -force ${prefix}_netlist.v
    write_checkpoint -force ${prefix}_synth.dcp
    puts "REVIEW REQUIRED: ${prefix}_loop_drc.rpt; no feedback loop is waived."
    close_project
}
# Separate integration run: controller logic is intentionally excluded from core counts.
create_project -in_memory -part xc7a35tcpg236-1
read_verilog $sources
read_xdc [file join $root constraints controller_ooc.xdc]
synth_design -top cbdc_puf_top -part xc7a35tcpg236-1 -mode out_of_context -flatten_hierarchy none
report_utilization -file [file join $out integrated_util.rpt]
report_drc -file [file join $out integrated_drc.rpt]
report_cdc -file [file join $out integrated_cdc.rpt]
write_checkpoint -force [file join $out integrated_synth.dcp]
close_project
puts "Synthesis audit finished. Inspect reports; physical symmetry, timing and board integration remain unverified."
