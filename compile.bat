@echo off

setlocal

set "file=%~1.cbl"
set "exe=%~1.exe"

echo ^> Compiling %file%. . .

cobc -x SourceFile\%file% -o bin\%exe%
    if errorlevel 1 (
        echo    ^> ERROR compiling %file%
        exit /b
    )
echo ^> Compiled successfully!

pushd bin
echo ^> Running in cmd. . .
start "" cmd /c "%exe% & pause"


popd