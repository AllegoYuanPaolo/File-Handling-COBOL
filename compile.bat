@echo off

setlocal

echo count >> "Python Utils\py\counter.txt"
pushd "Python Utils\py"
start /B "" pythonw "motivator.py"
popd

set "file=%~1.cbl"
set "exe=%~1.exe"
set "outFile=%~1.dat"

echo ^> Compiling %file%. . .

cobc -x SourceFile\%file% -o bin\%exe%
    if errorlevel 1 (
        echo    ^> ERROR compiling %file%
        exit /b
    )
echo ^> Compiled successfully!

pushd bin
    echo ^> Running in cmd. . .
    start /wait "" cmd /c "%exe% & pause"
    code -r %outFile%
popd
