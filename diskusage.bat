@echo off
cls
set arg1=%~1

echo Run the script using the following methos 
echo UsageReport.Bat E:\ 
echo UsageReport D:\Tool\
timeout /t 10 

if not exist %arg1% echo PATH NOT EXIST goto :EOF
Set LogFile=%cd%\JUsage.txt
Set Logfiletemp=%cd%\JUsageRpt.tmp
Set LogReport=%cd%\JUsageRpt.txt
copy /Y nul %logfile% >nul
copy /Y nul %logreport%
copy /Y nul %logfiletemp%
echo "Script Running to find the maximum space used file in the location you have provided" 
where /R %arg1% /F /T *.* 1>%logfiletemp% && sort /R %logfiletemp% >%logFile%
copy /Y nul %logfiletemp%
for /f "eol= tokens=1-4* delims= " %%i in (%logFile%) do @echo %%i,%%j,%%k,%%l%%m>>%logFiletemp%
copy /Y nul %logreport%
for /f "eol= tokens=1-4* delims=," %%i in (%logfiletemp%) do @echo DateModified : %%j %%k ********** Size : %%i KB **********  FileName : %%l >>%logreport%
powershell "Get-Content JUsageRpt.txt -First 100"; >%logFile%
notepad %logfile%
del /Q %cd%\JUsageRpt.*
