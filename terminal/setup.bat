@echo off

REM for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

ECHO [windows terminal setup] Setting up development environment

winget install JanDeDobbeleer.OhMyPosh --source winget

mkdir "%USERPROFILE%\Documents\WindowsPowerShell\"
SET TargetPs1File="%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
IF EXIST %TargetPs1File% DEL %TargetPs1File%
mklink %TargetPs1File% %~dp0MainProfile.ps1

REM ECHO %ESC%[32m[neovim] Setup complete!%ESC%[0m
ECHO [neovim] Setup complete!
