@echo off

set appName=Komorebi

echo [%appName%] Setting up development environment

set fileName=komorebi.json
set targetConfigFile="%USERPROFILE%\%fileName%"
IF EXIST %targetConfigFile% DEL %targetConfigFile%
mklink %targetConfigFile% %~dp0%fileName%

set fileName=komorebi_applications.json
set targetConfigFile="%USERPROFILE%\%fileName%"
IF EXIST %targetConfigFile% DEL %targetConfigFile%
mklink %targetConfigFile% %~dp0%fileName%

echo [%appName%] Setup complete!
