@echo off
title PowerShell 7 Installer

echo INFO: PowerShell 7 installer will not uninstall PS Classic for compatibility reasons.
echo.

:Wget.Install
echo Trying to install with winget...

where winget > nul
if errorlevel 0 (
    winget install Microsoft.PowerShell
    if errorlevel 1 goto Wget.InstallFailed
    goto End
)
echo Winget not found.
goto MSIX.Install

:MSI.Install
echo Trying with MSI... (version 7.6.6 is the last version to come with it)

cd %temp%
curl -o ps7i.msi https://github.com/PowerShell/PowerShell/releases/download/v7.6.6/PowerShell-7.6.6-win-x64.msi
msiexec /package ps7i.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
if errorlevel 1 goto MSI.InstallFailed
del ps7i.msi
goto End

:End
echo.
echo =====================================================================
echo = PowerShell 7 was installed sucessfully.                           =
echo = Please note that for compatibility reasons, you have to keep PS   =
echo = Classic (the one preinstalled on your PC).                        =
echo =                                                                   =
echo = Press any key to exit.                                            =
echo =====================================================================
pause > nul
exit

:Wget.InstallFailed
echo.
echo =====================================================================
echo = The installation via winget failed.                           (!) =
echo = You can retry or install with MSIX.                               =
echo =                                                                   =
echo = [R]ETRY                                       [I]NSTALL WITH MSIX =
echo =====================================================================
set /p choice=

if /i "%choice%"=="R" goto Wget.Install
if /i "%choice%"=="I" goto MSI.Install
goto Wget.InstallFailed

:MSI.InstallFailed
echo.
echo =====================================================================
echo = The installation via MSIX failed.                             (!) =
echo = You can retry or exit.                                            =
echo =                                                                   =
echo = [R]ETRY                                                    [E]XIT =
echo =====================================================================
set /p choice=

if /i "%choice%"=="R" goto MSIX.Install
if /i "%choice%"=="E" exit
goto MSIX.InstallFailed
