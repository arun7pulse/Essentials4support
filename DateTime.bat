REM Author - ArunSanthoshKumar. 

@ECHO ON 

for /f "tokens=2-4 delims=.:/-, " %%u in ('date /t') do (
  for /f "skip=1 tokens=2-4 delims=/-,()." %%x in ('echo.^|date') do (
    set %%x=%%u
    set %%y=%%v
    set %%z=%%w))

for /f "tokens=5-8 delims=:. " %%a in ('echo.^|time') do (
    set hour=%%a
    set min=%%b
    set sec=%%c
    set msec=%%d)

SET DATEV  = %yy%%mm%%dd
SET TIMEV = %%hour%%min%%sec%
SET DATETIME=%DATEV%%TIMEV%
