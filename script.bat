REM 
REM   OLD RIGHT-CLICK CONTEXT MENU FOR WINDOWS 11
REM   -----------------------------------------------------------------
REM 
REM   The new context menu of the file explorer in Windows 11
REM   offers less options than the old legacy one in Windows 10.
REM   This small Batch script restores the old context menu of the
REM   file explorer in Windows 11.
REM 
REM   Registry key values and commands in this script are based on:
REM   https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/reg-add
REM   https://learn.microsoft.com/en-us/answers/questions/610602/disable-windows-11-file-context-menu
REM 
REM   -----------------------------------------------------------------
REM   Script written for learning purposes only. Use at your own risks.
REM   © 2025 Sacha Meurice


@echo off & cls


REM Check current version of Windows.
REM This script works on Windows 11 only.

CALL :CHECKWIN11

if %isWindows11% NEQ 1 (
    echo This script works on Windows 11 only.
    pause & exit /b 1
)




REM Check if the registry key already exists.
REM If it does not exist, errorLevel equals 1.

set regKey=HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}
REG QUERY %regKey% >NUL 2>&1

if %errorLevel% EQU 1 (
    echo The old context menu from Windows 10 will be installed. & echo.

    REM Flashing screen is due to the forced restart of the file explorer.
    REM I am open to any solution to avoid such flashs.
    echo You might see your screen flashing a few seconds, this is normal.
    echo Press any key to start the process or click the red cross to exit...

    pause >NUL
    goto :ADDKEY
)




REM Ask for user approval before deleting the existing key.

:ASKUSER
    echo It looks like the old legacy Windows 10 context menu is already installed.

    :INPUTLOOP
    set /p choice=Do you want to get the default Windows 11 one back%? (yes/no)

    if /i %choice% EQU yes goto :DELKEY
    if /i %choice% EQU no goto :END
goto :INPUTLOOP




REM Add the registry key and restart file explorer.

:ADDKEY
    REM Add a new entry to the registry with NULL value (/ve)
    REM without confirmation prompt. (/f)
    REG ADD %regKey%\InprocServer32 /f /ve >NUL 2>&1

    if %errorLevel% EQU 0 (
        echo Old Windows 10 context menu is installed!
        echo Restarting file explorer, please wait...
        goto :RESTARTEXPLORER
    )

    echo ERROR: Could not add %regKey% to the Windows registry.
goto :END




REM Remove the existing registry key.

:DELKEY
    REM Remove the registry key without confirmation prompt. (/f)
    REG DELETE %regKey% /f >NUL 2>&1

    if %errorLevel% EQU 0 (
        echo Default Windows 11 context menu is back!
        echo Restarting file explorer, please wait...
        goto :restartExplorer
    )

    echo ERROR: Could not delete %regKey%.
goto :END




REM Restart Windows file explorer to apply changes.
REM Desktop might looks buggy a few seconds, this is normal.

:RESTARTEXPLORER
    taskkill /f /im explorer.exe >NUL
    timeout /t 3 /nobreak >NUL
    start explorer.exe
    echo Script successfully executed!
goto :END





REM  Check if the script is running on Windows 11 or not.
REM  The most accurate way is to check the OS build number.
REM 
REM  If the build number is strictly less than 22000,
REM  the script is not running on Windows 11.
REM 
REM  https://en.wikipedia.org/wiki/Windows_11_version_history

:CHECKWIN11
    set isWindows11=1
    set key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion

    FOR /F "tokens=3" %%A IN ('REG QUERY "%key%" /v CurrentBuild') DO (
        set /a OSBuild=%%A
    )

    if %OSBuild% LSS 22000 (
        set isWindows11=0
    )
goto :EOF


:END
echo. & pause
