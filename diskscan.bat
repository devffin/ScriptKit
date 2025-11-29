@echo off
title devffin ScriptKit v1

echo ===============================
echo     DiskScan - ScriptKit v1
echo ===============================
echo.
echo Verifying your disk ...
sfc /scannow
chkdsk C: /f /r
DISM /Online /Cleanup-Image /ScanHealth > %temp%\ds01.txt
findstr /i "component store is repairable" "%temp%\ds01.txt" >nul
if %errorlevel%==0 (
    echo -----------------------------------------------
    echo DiskScan has detected corruption in the system.
    echo Starting automatic repair...
    echo -----------------------------------------------
    echo.
    dism /online /cleanup-image /restorehealth
    echo.
    echo Repair completed.
) else (
    echo --------------------------------------------
    echo No corruption detected. System is healthy.
    echo --------------------------------------------
)
pause
