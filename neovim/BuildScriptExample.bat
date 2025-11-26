@echo off

SETLOCAL

set BaseFilename=Main
set MainDir=%~dp0
set SrcDir=%MainDir%Sir\
set BuildDir=%MainDir%Build\

mkdir %BuildDir% >nul 2>&1

set ExeOutput=%BuildDir%%BaseFilename%.exe
set PdbOutput=%BuildDir%%BaseFilename%.pdb
set ObjOutput=%BuildDir%%BaseFilename%.obj

set FilesToCompile=%SrcDir%%BaseFilename%.cpp
REM set FilesToCompile=%FilesToCompile%" "%SrcDir%SomeNewFile.cpp

REM set Libs=user32.lib

cl /nologo /Zi /Od %FilesToCompile% /Fe%ExeOutput% /Fd%PdbOutput% /Fo%ObjOutput%
