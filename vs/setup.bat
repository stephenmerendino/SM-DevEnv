@echo off

REM for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

ECHO [VsVim Setup] Setting up development environment for VsVim in Visual Studio

Set TargetVimrcLocation=%userprofile%\_vimrc

IF EXIST %TargetVimrcLocation% (
    ECHO [VsVim Setup]   _vimrc already linked to target file %TargetVimrcLocation%
) ELSE (
    ECHO [VsVim Setup]   Linking _vimrc to target file %TargetVimrcLocation%
    mklink %TargetVimrcLocation% %~dp0_vimrc
)

REM ECHO %ESC%[32m[neovim] Setup complete!%ESC%[0m
ECHO [VsVim Setup] Setup complete!
