@echo off
pushd "Python Utils"
    python randomer.py
    pushd py
        for /L %%f in (1, 1, 5) do ( echo count >> counter.txt )
        start "" /B python motivator.py
    popd
popd