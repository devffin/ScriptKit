@echo off
title Firefox Installer

where curl > nul
if errorlevel 1 goto Error.CurlNotFound

cd %temp%

curl -o fi.exe https://download-installer.cdn.mozilla.net/pub/firefox/releases/160.0/win32/fr/Firefox%20Installer.exe
if errorlevel 1 goto Error.DownloadFailed

fi.exe
if errorlevel 1 goto Error.InstallFailed

echo DON'T CLOSE THIS WINDOW BEFORE THE INSTALLATION FINISHES!
echo.
echo If the installation has finished, press any key to clean your PC from the installer.
pause
del fi.exe
exit

:Error.CurlNotFound
echo === ERROR 1 : Component not found ===
echo The component "curl" was not found. The installation will not continue.
echo.
pause
exit

:Error.DownloadFailed
echo == ERROR 2 : Download failed ===
echo The download failed. That's all we know!
echo.
pause
exit

:Error.InstallFailed
echo == ERROR 3 : Installer refused to launch ===
echo The installation failed. That's all we know!
echo.
pause
exit
