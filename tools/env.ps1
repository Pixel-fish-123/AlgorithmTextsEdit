# Source this file in a PowerShell session to use the project-local toolchain:
#   . .\tools\env.ps1
#
# It only changes PATH for the current PowerShell session. Nothing is written
# to the system or user environment.

$root = Split-Path -Parent $PSScriptRoot
$paths = @(
    (Join-Path $root 'tools\bin\pandoc'),
    (Join-Path $root '.venv\Scripts')
) | Where-Object { Test-Path $_ }

foreach ($p in $paths) {
    if ((($env:PATH -split ';') -notcontains $p)) {
        $env:PATH = "$p;$env:PATH"
    }
}

Write-Host 'Project environment ready.'
if (Get-Command pandoc -ErrorAction SilentlyContinue) {
    pandoc --version | Select-Object -First 1
}
if (Get-Command python -ErrorAction SilentlyContinue) {
    python --version
}
