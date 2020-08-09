REM Author - ArunSanthoshKumar

@echo off
call %1 %2 %3 %4 %5 > ..\log\%1.log 2>&1
call notepad ..\log\%1.log
