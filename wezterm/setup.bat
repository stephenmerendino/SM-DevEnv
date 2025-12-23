@echo off

ECHO [Wezterm Setup] Setting up wezterm config

mklink %USERPROFILE%\.wezterm.lua %~dp0.wezterm.lua

ECHO [Wezterm Setup] Setup complete!
