@echo off
title DefragTool

echo /--------------------------------------------------\
echo |  WARNING: Do not defragment an SSD of any type!  |
echo \--------------------------------------------------/
echo.

set /p driveletter="Indicate the letter of your disk you want to defragment: "

defrag %driveletter% /a /u
defrag %driveletter% /u
