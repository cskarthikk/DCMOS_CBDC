# Best so far — single PUF, 4 November 2026

Frozen copy of the tested pulled-version PUF. Main project files were not replaced.
All seven RTL files match the source hashes saved with the tested FPGA build.
One core, 16 stages per chain, AUTO_PARITY=1, CAPTURE_MODE=1, DUAL_ARBITER=1.
Only primary A is collected. No array, BCH or hash module is included.
Two arbiters are part of this ONE PUF. Paired placement does not mean matched routing.

## Recorded results

256 challenges x20 repeats: 5,120 accepted; 1,477 ones (28.85%); no missing
activity flags. 244 challenges consistent within the run (65 always one,
179 always zero); 12 mixed. This is the chosen checkpoint, not a certified
or unbiased PUF. Async timing warnings remain. Results CSVs are in results/.

## Run this saved version

1. Open Vivado Hardware Manager and Auto Connect to the powered Basys 3.
2. Program xc7a35t_0 with THIS folder's build_m1/pulled_single/cbdc_pulled_single.bit.
   Leave debug probes empty. Press/release BTNU, wait one second; LD4 ready.
3. Open PowerShell IN THIS SNAPSHOT FOLDER (not the main project folder).
4. Run:

```powershell
$csv = 'results/smoke_' + [Guid]::NewGuid().ToString('N') + '.csv'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\collect_pulled_single.ps1 -Port COM5 -Challenges 8 -Repeats 3 -Output $csv
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\analyze_crps.ps1 -InputCsv $csv
```

Expected 24 accepted; ideally zero missing edge flags. No predetermined response
ones count. For a broader collection use -Challenges 256 -Repeats 20 and a new
filename. Power loss requires programming again. COM5 may change on your computer.

## Rebuild / simulate

In a separate empty Vivado session, source THIS folder's
scripts/build_pulled_single.tcl. It uses only files inside this folder and writes
build_m1/pulled_single. Rebuilding may produce different routes/results; preserve
this original bitstream and its hash before rebuilding. For artificial-delay UART
simulation run scripts/run_pulled_single_sim.ps1 from this folder in PowerShell.

ORIGINAL_GUIDE.md contains the original instructions with historical main-project
paths; use this README's snapshot-local paths instead. SNAPSHOT.json records the
source commit. FILE_HASHES.json verifies the frozen files. The original source
manifest contains historical absolute paths; these do not affect rebuilding.
