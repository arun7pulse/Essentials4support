echo on 
for /f "tokens=1-4* delims=/ " %%i in ('date /t') do (
	set yyyy=%%l
	set mm=%%k
	set dd=%%j
)
set mdate=%yyyy%%mm%%dd%

for /f "tokens=1-4* delims=/: " %%i in ('time /t') do set ctime=%%i%%j%%k

python stk-live-ma.py 1>stk-live-ma-%mdate%%ctime%.log 2>stk-live-ma-%mdate%%ctime%.err
