@echo off
title CleanYourDisk

set /p driveletter="Indicate the letter of the drive you want to clean: "

cleanmgr /d %driveletter% /verylowdisk /sagerun:5
