REM AUTHOR - ArunSanthoshKumar

@ECHO ON
for /f "tokens=1-2 delims=.:/-, " %%i in ('forfiles /m %~1 /c "cmd /c echo @fsize"') do (
set Size=%%i
)

SET GetFile.Size=%Size%
@echo %GetFile.Size% KB
