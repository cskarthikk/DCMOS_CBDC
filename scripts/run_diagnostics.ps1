param([Parameter(Mandatory=$true)][string]$Port,[switch]$BitstreamLoaded,
 [ValidateRange(4,256)][int]$Patterns=32,[ValidateRange(3,20)][int]$Repeats=10)
$ErrorActionPreference='Stop'
if(!$BitstreamLoaded){throw 'Program the corrected paper_array8 bitstream first; -BitstreamLoaded confirms that action.'}
foreach($case in @(@('Parallel',8),@('Sequential',8),@('Parallel',1))){
 Write-Output ('Diagnostic condition: '+$case[0]+'; excite wait='+$case[1]+' cycles')
 & (Join-Path $PSScriptRoot 'collect.ps1') -Port $Port -BitstreamLoaded -Patterns $Patterns -Repeats $Repeats -Mode $case[0] -ExciteCycles $case[1]
}
Write-Output 'Three diagnostic conditions completed; retain all three CSVs for per-core comparison.'
