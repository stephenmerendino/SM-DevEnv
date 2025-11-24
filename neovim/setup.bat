@echo off

REM for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

ECHO [neovim] Setting up development environment

REM Install plug
powershell -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni \"$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim\" -Force"

SET TargetNvimDirectory=%userprofile%\APPDATA\Local\nvim

IF EXIST TargetNvimDirectory (
    ECHO [neovim]   nvim directory already linked to target dir %TargetNvimDirectory%
) ELSE (
    ECHO [neovim]   Linking nvim directory to target dir %TargetNvimDirectory%
    mklink /d %TargetNvimDirectory% %~dp0nvim\
)

REM ECHO %ESC%[32m[neovim] Setup complete!%ESC%[0m
ECHO [neovim] Setup complete!
