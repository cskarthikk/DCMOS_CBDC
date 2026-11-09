# CBDC-PUF main working folder

Start with [START_HERE.md](START_HERE.md).

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Status
```

The current eight-core hardware, all supporting implementation/measurement files, frozen enrollment and independent validation workflow are consolidated here. The next step is one separate confirmation capture with the saved bitstream; `CollectValidation` creates its report automatically. The original hardware and all earlier experiments remain preserved under `history/`.

This package covers the current eight-core development stage. The 128-core framework, BCH and SHA3 integration remain later work.
