
for /f "tokens=2-4 delims=.:/-, " %%u in ('date /t') do (
  for /f "skip=1 tokens=2-4 delims=/-,()." %%x in ('echo.^|date') do (
    set %%x=%%u
    set %%y=%%v
    set %%z=%%w))

set fdate=%yy%%mm%%dd%
