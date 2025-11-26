@echo off

set BaseFilename=test
set MainDir=%~dp0
set BuildDir=%MainDir%Build\

mkdir %BuildDir% >nul 2>&1

set ExeOutput=%BuildDir%%BaseFilename%.exe
set PdbOutput=%BuildDir%%BaseFilename%.pdb
set ObjOutput=%BuildDir%%BaseFilename%.obj

cl /nologo /Zi /Od %MainDir%test.cpp /Fe%ExeOutput% /Fd%PdbOutput% /Fo%ObjOutput%
