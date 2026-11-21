param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$root = Split-Path -Parent $PSScriptRoot
$binDir = Join-Path $root 'tools\bin\pandoc'
$exe = Join-Path $binDir 'pandoc.exe'

if ((Test-Path $exe) -and -not $Force) {
    & $exe --version | Select-Object -First 1
    Write-Host "Pandoc already installed at $binDir. Use -Force to reinstall."
    exit 0
}

$release = Invoke-RestMethod `
    -Uri 'https://api.github.com/repos/jgm/pandoc/releases/latest' `
    -Headers @{ 'User-Agent' = 'AlgorithmTextsEdit' }

$asset = $release.assets |
    Where-Object { $_.name -match 'windows-x86_64\.zip$' } |
    Select-Object -First 1

if (-not $asset) {
    throw "No Windows x86_64 zip asset found in release $($release.tag_name)."
}

$tempDir = Join-Path $root '.tmp\pandoc-install'
if (Test-Path $tempDir) {
    Remove-Item -Recurse -Force $tempDir
}
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$zipPath = Join-Path $tempDir $asset.name
Write-Host "Downloading $($asset.name) ($([math]::Round($asset.size / 1MB, 1)) MB) ..."

$curl = Get-Command curl.exe -ErrorAction SilentlyContinue
if ($curl) {
    & curl.exe -L --fail --silent --show-error --retry 5 --retry-delay 3 `
        --connect-timeout 30 -o $zipPath $asset.browser_download_url
    if ($LASTEXITCODE -ne 0) {
        throw "curl.exe failed with exit code $LASTEXITCODE"
    }
}
else {
    Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zipPath -UseBasicParsing
}

$hash = (Get-FileHash -Algorithm SHA256 -Path $zipPath).Hash
$expected = $asset.digest -replace '^sha256:', ''
if ($expected -and ($hash -ne $expected)) {
    throw "SHA256 mismatch: expected $expected, got $hash. The download may be incomplete or altered."
}
Expand-Archive -Path $zipPath -DestinationPath (Join-Path $tempDir 'extract') -Force

$found = Get-ChildItem -Path (Join-Path $tempDir 'extract') -Recurse -Filter 'pandoc.exe' |
    Select-Object -First 1
if (-not $found) {
    throw 'pandoc.exe not found in the downloaded archive.'
}

if (Test-Path $binDir) {
    Remove-Item -Recurse -Force $binDir
}
New-Item -ItemType Directory -Path $binDir -Force | Out-Null
Copy-Item -Path (Join-Path $found.Directory.FullName '*') -Destination $binDir -Recurse -Force

$version = (& $exe --version | Select-Object -First 1)
@"
Pandoc portable for AlgorithmTextsEdit
Version: $version
Source: $($asset.browser_download_url)
SHA256: $hash
Installed: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
"@ | Set-Content -Path (Join-Path $binDir 'VERSION.txt') -Encoding UTF8

Remove-Item -Recurse -Force $tempDir

Write-Host "Installed: $version"
Write-Host "Path: $binDir"
Write-Host "This installation is project-local and is not added to the system PATH."
