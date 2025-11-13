@echo off
setlocal

echo count >> "Python Utils\py\counter.txt"

echo ^> Python Tools:
echo    ^> ["back" to exit]
    for %%f in ("Python Utils\*.py") do (
        if /I not "%%~f"  == "__pycache__" (
            echo %%~nxf
        )
    )

pushd ".\Python Utils"

    set /p "tool=Use: "
        if /I "%tool%"=="back" (
            echo ^> Exiting program
            exit /b
        )

        if not exist "%tool%.py"  (
            echo    ^> Tool not found
            exit /b
        )
    start /wait "Python Tools" cmd /c "python %tool%.py & pause"

popd

pushd "Python Utils\py"
start /B "" pythonw "motivator.py"
popd

endlocal