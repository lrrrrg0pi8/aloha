:: Multi-day-grind-V13.0.1
@echo off
cd /D D:\BOOTDRV\Aloha\BIN

set /p startDate=Enter start date (YYYYMMDD): 
set /p endDate=Enter end date (YYYYMMDD): 

set currentDate=%startDate%

:loop
echo Processing %currentDate%
grind /date %currentDate%

if "%currentDate%"=="%endDate%" goto end

:: Simple increment - just add 1 to the last two digits (day)
:: Remove leading zero to avoid octal interpretation
set day=%currentDate:~6,2%
if "%day:~0,1%"=="0" set day=%day:~1,1%
set /a day=%day% + 1
if %day% LSS 10 (
    set currentDate=%currentDate:~0,6%0%day%
) else (
    set currentDate=%currentDate:~0,6%%day%
)

goto loop

:end
echo Done!
pause