@echo off

set a=0
set b=0

taskkill /f /im javaw.exe
taskkill /f /im erabuddy.exe

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
    set /a b=%a% + 1
)


if %b% == 0 echo Failed
if %b% NEQ 0 (
    echo ERA Fixed
    shutdown /r /t 10
)
pause & exit
