@echo off

REM for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

ECHO [neovim] Setting up development environment

SET TargetNvimDirectory=%userprofile%\APPDATA\Local\nvim

IF EXIST TargetNvimDirectory (
    ECHO [neovim]   nvim directory already linked to target dir %TargetNvimDirectory%
) ELSE (
    ECHO [neovim]   Linking nvim directory to target dir %TargetNvimDirectory%
    mklink /d %TargetNvimDirectory% %~dp0nvim\
)

REM ECHO %ESC%[32m[neovim] Setup complete!%ESC%[0m
ECHO [neovim] Setup complete!
