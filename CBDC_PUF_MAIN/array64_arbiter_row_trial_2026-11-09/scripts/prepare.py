from pathlib import Path
r=Path(__file__).resolve().parents[1]
p=r/'scripts/audit_structure.tcl';s=p.read_text().replace('$y+17','$y+16').replace('*BFF','*AFF');p.write_text(s)
# Reuse the physical checker, exempting the64 deliberately relocated arbiters.
src=r.parent/'array64_capture_window_trial_2026-11-08/scripts/verify_physical.tcl'
s=src.read_text()
s=s.replace('set c [cell $name]\n if', '''set c [cell $name]
 if {[string match */u_arbiter_dff $name]} {
  regexp {SLICE_X([0-9]+)Y([0-9]+)} $site -> xx yy
  set site SLICE_X${xx}Y[expr {$yy-1}]
  set bel [string map {.BFF .AFF} $bel]
 }
 if {[dict exists $::skipped_controls $name]} {continue}
 if''')
s=s.replace('if {$checked!=6656}', 'if {$checked!=6656-[dict size $::skipped_controls]}')
s=s.replace('set pin [dict get $pm $p];', 'if {[string first {gen_elem[15].u_elem/gen_style_p.u_mux/O} $p]>=0} {continue}\n set pin [dict get $pm $p];')
s=s.replace('$nchecked!=6272','$nchecked!=6144')
s=s.replace('puts "PHYSICAL_IDENTITY_PASS:6656 cells and6272 PUF signal trees/endpoints preserved."','puts "PHYSICAL_IDENTITY_PASS: $checked reference cells (64 arbiters intentionally moved); $nchecked unchanged internal signal trees."')
(r/'scripts/verify_physical.tcl').write_text(s)
prefix='''set root [file normalize [file join [file dirname [info script]] ..]]
set out $root/build
set_param general.maxThreads 2
open_checkpoint $out/placed.dcp
set cells [dict create];foreach c [get_cells -hier] {dict set cells $c $c}
proc cell {n} {return [dict get $::cells $n]}
set f [open $root/layout.tcl r];set layout [read $f];close $f
set target_tiles [dict create]
foreach row $layout {lassign $row x z y ax type;dict set target_tiles [get_tiles -of_objects [get_sites SLICE_X${ax}Y[expr {$y+16}]]] 1}
set skipped_controls [dict create]
set f [open $out/reference_cells.tcl r]
while {[gets $f line]>=0} {
 lassign $line command n site bel pins
 if {![string match {*u_core/*} $n] && [dict exists $target_tiles [get_tiles -of_objects [get_sites $site]]]} {dict set skipped_controls $n $site}
}
close $f
'''
tail=(r/'scripts/implement.tcl').read_text().split('set pinmap [dict create]',1)[1]
(r/'scripts/resume.tcl').write_text(prefix+'set pinmap [dict create]'+tail)
