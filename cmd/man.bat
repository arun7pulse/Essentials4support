@ECHO OFF
SETLOCAL
REM # Description:
REM #   Display all lines with "REM(space)#" in file as help.
IF /I '%~1' EQU '' SET FIN=%~nx0
IF /I '%~1' EQU '/?' SET FIN=%~nx0
IF /I '%~1' NEQ '' (
  IF "%~x1" EQU "" (
    SET FIN=%~n1.*
  ) ELSE (
    SET FIN=%~nx1
  )
)
:HELP
FOR /F "tokens=1* delims=#" %%a IN ('FIND /I "REM #" %FIN% ^| FIND /V "FOR /F"') DO @ECHO. %%b
GOTO :EOF
ENDLOCAL
