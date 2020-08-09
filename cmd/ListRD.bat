

@echo off
REM When this script is called with "/?" all lines with "REM(space)#" will be displayed as help.
IF /I "%~1" EQU "/?" (
  FOR /F "tokens=1* delims=#" %%a IN ('FIND /I "REM #" %~nx0 ^| FIND /V "FOR /F"') DO ECHO.%%b
  GOTO :eof
)
rem #Lists all the RD Logged in 
rem #
rem #ListRD.bat localhost 
rem #


@echo off
setlocal
set SVR=%1%

IF "%SVR%" == "" set /p SVR=enter server name:&set pause=Y

@echo qwinsta /server:%SVR%
qwinsta /server:%SVR%

:END
if "%pause%" == "Y" echo.&pause
endlocal
