@echo off

set a=0
set b=0

taskkill /f /im javaw.exe > NUL 2>&1
taskkill /f /im erabuddy.exe > NUL 2>&1

timeout /t 1 > NUL 2>&1 

if exist "%appdata%\EraExplorer" (
    rd /s/q "%appdata%\EraExplorer" > NUL 2>&1
    set /a b=%a% + 1
)

if exist "%localappdata%\EraExplorer" (
    rd /s/q "%localappdata%\EraExplorer" > NUL 2>&1
    set /a b=%a% + 1
)

if exist "%temp%" (
    del /s /q  "%temp%\*.*" > NUL 2>&1
    timeout /t 1 > NUL 2>&1
    FOR /D %%p IN ("%temp%\*.*") DO rmdir "%%p" /s /q > NUL 2>&1
    set /a b=%a% + 1
)

if %b% == 0 (
    echo Failed
    pause & exit
)
if %b% NEQ 0 (
    echo ERA Fixed
    echo Press any key to RESTART . . . 
    pause > NUL 2>&1
    shutdown /r /t 0
)

