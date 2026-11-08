# Current raw 64-core profile

Use [array64_clock_profile_2026-11-09/run.ps1](array64_clock_profile_2026-11-09/run.ps1). It keeps all 64 raw response bits and fixes Excite=22, Latch=8 cycles, Parallel mode. The selected bitstream is the original `array64_candidate_2026-11-08/build/paper_array64.bit`.

Independent validation: 48.6435% and 48.6441% aggregate ones. This is a calibrated operating point, not a complete physical fix or proof of security. [Investigation and complete results](array64_clock_profile_2026-11-09/REPORT.md).

The original root `run.ps1` remains the frozen 8-core package entry point. No SHA/BCH changes were made in this investigation.
