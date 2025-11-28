@echo off
title devffin ScripKit v1

echo Deleting temp files ...
del /f /s %temp%\*

if exist "%temp%\*" (
  echo Not complete.
) else (
  echo Complete.
)

pause
