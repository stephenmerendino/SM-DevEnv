@echo off

set appName=yasb

echo [%appName%] Setting up development environment

set fileName=config.yaml
set targetFile="%USERPROFILE%\.config\yasb\%fileName%"
IF EXIST %targetFile% DEL %targetFile%
mklink %targetFile% %~dp0%fileName%

set fileName=styles.css
set targetFile="%USERPROFILE%\.config\yasb\%fileName%"
IF EXIST %targetFile% DEL %targetFile%
mklink %targetFile% %~dp0%fileName%

echo [%appName%] Setup complete!
