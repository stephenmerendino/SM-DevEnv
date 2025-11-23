@echo off

REM for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

ECHO [neovim-vs] Setting up development environment for VsVim in Visual Studio

Set TargetVimrcLocation=%userprofile%\_vimrc

IF EXIST %TargetVimrcLocation% (
    ECHO [neovim-vs]   _vimrc already linked to target file %TargetVimrcLocation%
) ELSE (
    ECHO [neovim-vs]   Linking _vimrc to target file %TargetVimrcLocation%
    mklink %TargetVimrcLocation% %~dp0_vimrc
)

REM ECHO %ESC%[32m[neovim] Setup complete!%ESC%[0m
ECHO [neovim-vs] Setup complete!
