@echo off

set appName=whkd

echo [%appName%] Setting up development environment

set fileName=whkdrc
set targetFile="%USERPROFILE%\.config\%fileName%"
IF EXIST %targetFile% DEL %targetFile%
mklink %targetFile% %~dp0%fileName%

echo [%appName%] Setup complete!

