REM AUTHOR - ArunSanthoshKumar

@ECHO ON
for /f "tokens=1-8 delims=.:/-, " %%i in ('forfiles /m %~1 /c "cmd /c echo @fdate @ftime"') do (
set YYYY=%%k
set MM=%%i
set DD=%%j
set HH=%%l
set MI=%%m
set SS=%%n
set ZONE=%%o

)

if %MM% LEQ 9 SET MM=0%MM%
if %DD% LEQ 9 SET DD=0%DD%
if %zone% == AM SET HH=0%HH%
if %zone% == PM SET /a HH=%HH%+12

SET GetFile.Modified=%YYYY%%MM%%DD%%HH%%MI%%SS%
@echo %GetFileInfo.Modified%

