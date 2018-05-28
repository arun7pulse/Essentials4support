
echo off
copy /y nul temp.tmp
set ftype=*.%~1

FOR /F "usebackq tokens=1-4 delims== " %%i IN (`forfiles /p %cd% /s /m *.bat  /c "cmd /c echo @file "`) DO @echo %%i >>temp.tmp
copy /y nul Output.txt

for /f "tokens=1* delims= " %%i in (temp.tmp) do (
	echo.  >>output.txt
	echo =========================================================================================================    >>output.txt
	echo ==                       START OF THE PROGRAM %%i                       ==     >>output.txt
	echo =========================================================================================================    >>output.txt
	echo.  >>output.txt
	type %%i >>output.txt
	echo.  >>output.txt
	echo ****************************************************************************************************************************************  >>output.txt
	echo **                        END OF THE PROGRAM %%i                          **  >>output.txt
	echo ****************************************************************************************************************************************  >>output.txt
	echo.  >>output.txt
	echo.  >>output.txt
	
)

notepad temp.tmp
notepad output.txt

del /q temp.tmp

