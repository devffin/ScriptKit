@echo off
title App Updater

where winget > nul
if errorlevel 1 goto Error.WgetNotFound

winget update --all
if errorlevel 1 goto Error.WgetFailed

goto End

:End
echo.
echo All apps are now updated! Press any key to exit.
pause > nul
exit

:Error.WgetNotFound
echo === ERROR 3 : Component not found ===
echo The component "winget" is missing. Please install it for the script to work.
echo.
pause
exit

:Error.WgetFailed
echo === ERROR 5 : Component failed ===
echo The updates failed at some point. Please verify:
echo - What app causes this
echo - Why
echo.
echo Tips:
echo - Execute with admin privileges
echo.
pause
exit