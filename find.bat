@echo off
setlocal

REM Check if an argument is provided
if "%~1"=="" (
    echo Usage: %0 {file OR directory OR folder}
    goto :eof
)

REM Search for the file using the provided argument
set "searchResult="
for /r %%i in ("%~1") do (
    if exist "%%~fi" (
        set "searchResult=%%~fi"
        goto :found
    )
)

REM File not found
echo File not found: %~1
goto :exit

:found
REM File found, print success message without quotes
echo File found at: %searchResult:"=%

:exit
endlocal
