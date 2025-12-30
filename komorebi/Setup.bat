@echo off

set appName=Komorebi
set fileName=komorebi.json

echo [%appName%] Setting up development environment

set targetConfigFile="%USERPROFILE%\%fileName%"
IF EXIST %targetConfigFile% DEL %targetConfigFile%
mklink %targetConfigFile% %~dp0%fileName%

echo [%appName%] Setup complete!
