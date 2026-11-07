# Optional fresh repeat of the preserved original

The existing `run2_verify.csv` has already been compared. A fresh run is useful if you want a measurement with directly recorded programming provenance. It does not require changing RTL or rebuilding. Do not use the current main-project bitstream: its hash differs from the original.

1. Open PowerShell and enter:

   ```powershell
   Set-Location -LiteralPath 'C:\BTech\Semester_5\DCMOS\Project'
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\continuation_single_puf_2026-11-06\run_saved_repeat.ps1 -VerifyOnly
   ```

   Expected: `PASS: all 34 reference file hashes; same 256 challenges in the same order.` It also displays the full bitstream path and expected SHA256. This step does not open COM5 or collect data. Stop if a hash or challenge-order check fails.

2. Connect and power the Basys 3. In Vivado, select **Open Hardware Manager -> Open Target -> Auto Connect**. Right-click `xc7a35t_0` and select **Program Device**. Set the bitstream to:

   ```text
   C:\BTech\Semester_5\DCMOS\Project\continuation_single_puf_2026-11-06\reference\best_so_far_single_puf_2026-11-04\build_m1\pulled_single\cbdc_pulled_single.bit
   ```

   Leave debug probes empty and click **Program**. Expected: Vivado completes programming successfully and the board's DONE LED lights. Wait one second. This RTL has a startup reset; pressing/releasing BTNU is also available if a reset is needed. Programming the explicit file is the operator evidence: a local SHA256 alone does not identify the active configuration. Record whether you power-cycled the board. If the board is subsequently powered off, program it again.

3. Close any serial monitor using COM5, then enter:

   ```powershell
   [System.IO.Ports.SerialPort]::GetPortNames()
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\continuation_single_puf_2026-11-06\run_saved_repeat.ps1 -Port COM5 -BitstreamLoaded -Conditions 'Original saved bitstream explicitly programmed; power-cycle history and ambient conditions not recorded.'
   ```

   Use `-BitstreamLoaded` only after you have completed step 2. Replace the conditions text with what actually happened, for example whether you powered the board off and on. If COM5 is absent, check Windows Device Manager for the USB serial port and substitute its COM number. Do not select COM3/4 merely because they are present; those currently map to Bluetooth modem ports.

   The wrapper validates all reference hashes and challenge order, then calls the unchanged preserved A5/5A collector. Each run gets a GUID filename under `continuation_single_puf_2026-11-06/measurements/`; nothing is written inside the reference snapshot. The CSV, collector metadata, and operator-confirmation sidecar are saved separately.

   Expected after collection: `Saved 5120 accepted queries ...`, followed by the measured ones count, missing-activity count, and automatic comparison with the preserved original. The saved runs took about 82 seconds; actual duration may vary. No particular ones count is required. Zero missing activity flags is the desired diagnostic result. Ties and majority changes are printed explicitly.

4. Keep all new output files, including a partial run if collection fails. For a timeout or frame/echo/checksum error, close the serial monitor, reset or explicitly reprogram the board, then repeat step 3; it generates another unique filename. A header-only CSV is not a successful collection. For a complete run, examine mixed challenges, ties and changes before drawing conclusions from the overall ones percentage. Hardware results cannot be predicted from the simulated delays.

This experiment compares a new run with the original on the same challenge set and nominal configuration. It cannot by itself establish uniqueness, entropy, security, environmental robustness, or the source of bias.
