@echo off
title Pinger

echo === PingeR 1.0.0 - (c) 2026 devffin ===
echo.

:Exec
set /p link="DNS or IP adress: "
set /p nb="Number of pings (default: 4): "
set /p mode="Mode (normal/pong): "
echo.

if "%link%"=="" set link=8.8.8.8
if "%nb%"=="" set nb=4
if "%mode%"=="" set mode=Normal

if /i "%mode%"="Normal" (
  ping -n %nb% %link%
  echo.
  set /p continue="Do you want to continue pinging? (Y/N): "
  if "%continue%"=="" set continue=N
  if /i "%continue%"=="N" exit
  echo.
  goto Exec
)

if /i "%mode%"="Normal" (
  ping -n %nb% %link% > nul
  if errorlevel 1 (
    echo Lost.
  ) else (
    echo Pong.
  )
  echo.
  set /p continue="Do you want to continue pinging? (Y/N): "
  if "%continue%"=="" set continue=N
  if /i "%continue%"=="N" exit
  echo.
  goto Exec
)

echo.
goto Exec
