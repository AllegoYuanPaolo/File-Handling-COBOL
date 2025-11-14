@echo off

setlocal

echo count >> "Python Utils\py\counter.txt"
pushd "Python Utils\py"
start /B "" pythonw "motivator.py"
popd

set file="Original src\%~n1.cbl"
set "exe=%~1"


if not exist "temp" (
    md temp
)

cobc -x %file% -o "temp\test.exe"
if errorlevel 1 (
    echo    ^> ERROR: Could not make exe
    exit /b
)

pushd temp
start ""  /wait cmd /c "test.exe & pause"
echo ^> done
popd

rmdir /s /q temp
