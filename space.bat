@ECHO OFF
:: Display the disk space in MB used by the subdirectories
:: of the directory represented by %1, plus a grand total
PUSHD "%~1"
SETLOCAL ENABLEDELAYEDEXPANSION
SET Total=0

FOR /D %%A IN (*) DO (
	SET DirSize=0
	FOR /F "tokens=1,3" %%B IN ('DIR /A-D /-C /S "%%~A"') DO (
		IF %%B NEQ 0 SET DirSize=%%C
	)
	IF !DirSize! GTR 0 (
		FOR /F %%B IN ('powershell !Total! + !DirSize!') DO SET Total=%%B
		FOR /F %%B IN ('powershell !DirSize! / 1073741824') DO SET DirSize=%%B
		FOR /F "tokens=1* delims=,." %%B IN ("!DirSize!") DO (
			SET Whole=%%B
			SET Fraction=%%C
			SET DirSize=!Whole!.!Fraction:~0,2!
		)
	)
	SET DirSize=            !DirSize!
	SET DirSize=!DirSize:~-12!
	ECHO !DirSize! GB    %%~fA
)

FOR /F %%A IN ('powershell %Total% / 1073741824') DO SET Total=%%A
FOR /F "tokens=1* delims=,." %%B IN ("!Total!") DO (
	SET Whole=%%B
	SET Fraction=%%C
	SET Total=!Whole!.!Fraction:~0,2!
)
ECHO.
SET Total=            %Total%
SET Total=%Total:~-12%
ECHO.%Total% GB    Total
ENDLOCAL
POPD
