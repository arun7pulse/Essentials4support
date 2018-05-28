if not exist d:\log\%~n0.log echo .LOG>d:\LOG\%~n0.log

echo Program Begins %cd%\%~nx0 :: %date% %time% >>d:\Log\%~n0.log
echo ==============================================>>d:\LOG\%~n0.log
DEL /S /Y /F C:\Windows\Prefetch\* >>d:\LOG\%~n0.log

echo Program Ends %cd%\%~nx0 :: %date% %time% >>d:\LOG\%~n0.log
echo ************************************************************>>d:\LOG\%~n0.log
echo. >>d:\LOG\%~n0.log
