@echo off
title devffin ScriptKit v1

echo ===============================
echo     ViruScan - ScriptKit v1
echo ===============================
echo.
echo Updating the antivirus ...
PowerShell -Command "Update-MpSignature"
echo Scanning ...
PowerShell -Command "Start-MpScan -ScanType QuickScan"
echo Finished!
PowerShell -Command "Get-MpThreatDetection"

pause
