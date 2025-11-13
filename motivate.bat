@echo off
pushd "Python Utils"
    python randomer.py
    pushd py
        start "" /B python motivator.py
    popd
popd