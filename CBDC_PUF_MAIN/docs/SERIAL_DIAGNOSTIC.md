# USB-UART automated diagnostic build

For the separate runtime capture-timing experiment, use
`TIMING_DIAGNOSTIC.md`. It has a different top, programming file, packet format
and collector. The instructions below continue to describe the original fixed
8/8-cycle serial build.

This is a separate build. Original button/manual bitstream and checkpoint are
preserved under build_m1/manual_reference; original core behavior defaults to
DIAGNOSTIC=0. No loaded FPGA or user Vivado project was changed by preparation.

## Purpose and limitations

The PC submits 16-bit challenges, the FPGA returns response/status bytes, and
scripts/collect_crps.ps1 writes CSV with challenge echo/checksum validation and
timeouts. No third-party Python packages or terminal software are needed.
Use one request at a time; do not send another before receiving a complete reply.
The script uses the first manually tested challenges then seeded random odd-parity
challenges. Repeats are grouped by challenge, not randomized across time.

Two extra falling-edge FDCE_1 flags are attached to Qu and Qb only when the serial
engine instantiates DIAGNOSTIC=1. Both have D=1, CE=latch, CLR=clr, INIT=0.
The flags pass through two system-clock synchronizer stages before reporting.
They indicate at least one falling edge during the latch window, not frequency,
delay, number of edges, or freedom from metastability. Additional clock loading
and rerouting can change PUF responses. Never pool this CSV with the manual-build
results. The core-only FF count is THREE in the instrumented build, not one.
Chain LUT counts remain 66 LUT2 and 32 LUT3. No new chain logic is inserted.

Pin source: Digilent Basys-3-Master.xdc; UART RX B18, TX A18, LVCMOS33.
UART is 115200 baud, 8 data bits, no parity, 1 stop bit, no flow control, via the
same PROG micro-USB cable. Close any serial terminal before running collection.
Do not send serial traffic before programming the UART diagnostic bitstream.

## Files / validation

New RTL: cbdc_uart.v, cbdc_puf_serial.v. Optional flag ports added to cbdc_puf_core.v.
Existing button build leaves those outputs disconnected and DIAGNOSTIC=0.
New board XDC: constraints/basys3_serial.xdc (do NOT combine with basys3.xdc).
Reuse swapped placement and feedback acknowledgement as implementation-only.

Run scripts/run_serial_sim.ps1. Testbench checks serial frames, checksum/echo,
accepted/rejected challenges, payload containing header bytes, truncated/bad-CRC
recovery, and monitor flag set/clear/no-excitation behavior. Scripts are parsed
locally; the host serial-port exchange still needs validation with real hardware.
No serial FPGA synthesis/implementation/programming was performed during preparation.

## Vivado GUI setup

Create a NEW RTL project named cbdc_serial_diagnostic, targeting xc7a35tcpg236-1.
Add all rtl/*.v as design sources with copying disabled; no sim/*.v design sources.
Set cbdc_puf_serial as top. Add ONLY these three XDCs:
  constraints/basys3_serial.xdc
  constraints/puf_swapped_placement.xdc
  constraints/puf_feedback_acknowledge.xdc
Set USED_IN_SYNTHESIS=false on both puf_* XDCs. Keep all three used in implementation.
Set flatten_hierarchy=none. Synthesize and implement; review DRC, routing status,
clocking and constrained timing before generating/programming a bitstream.
Existing loop/arbiter warnings may now mention three asynchronously clocked FFs.
No new blanket timing exceptions or DRC severity overrides are supplied.

## First hardware exchange

After programming, release BTNU and wait one second. LD4 indicates firmware ready,
not switch readiness; switches and BTNC are unused in this top. BTNU resets it.
In Windows PowerShell at the project root:
  [System.IO.Ports.SerialPort]::GetPortNames()
Use Device Manager -> Ports to identify the Basys USB Serial Port (COM number).
Run the small smoke acquisition first (replace COM5 with your actual port):
  .\scripts\collect_crps.ps1 -Port COM5 -Challenges 12 -Repeats 3 -Output build_m1/measurements/smoke.csv
  .\scripts\analyze_crps.ps1 -InputCsv build_m1/measurements/smoke.csv
Expected host result: 36 accepted queries plus one all-zero rejection control.
Values of response bits are deliberately NOT predetermined.
If a timeout/checksum/echo error occurs, stop; do not treat it as a PUF response.
Reset board, confirm port/bitstream and retry using a new output filename.
Only after reviewing the smoke run:
  .\scripts\collect_crps.ps1 -Port COM5 -Challenges 256 -Repeats 20 -Output build_m1/measurements/run01.csv
  .\scripts\analyze_crps.ps1 -InputCsv build_m1/measurements/run01.csv
The collector refuses to overwrite existing results and flushes after each challenge.
The board is not auto-programmed/reset and COM ports are never guessed automatically.

## Binary protocol

Request bytes: A5, challenge low, challenge high, XOR of first three bytes.
Reply bytes: 5A, challenge low, challenge high, flags, response byte, XOR of first five.
Flags bit0 accepted, bit1 Qb edge seen, bit2 Qu edge seen, bit4 diagnostic marker,
bit7 internal query timeout. On rejected challenges, flags=10 hex and response=0;
zero is a placeholder, not a valid PUF response. All-zero is rejected by AND parity.
Requests with bad XOR/framing are dropped; incomplete frames time out and reset
the parser. This is error detection, not a cryptographically authenticated protocol.
