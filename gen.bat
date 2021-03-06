@echo off
title Kitty Generator
set persentage=0
cd assets
cls
echo.
echo How much robos?
echo.
set /p robos=-

echo.
echo (1) Continue or (2) Restart?
set /p choice=-

cd..
if %choice%==2 del /q assets
cd assets

set repeat=0

if exist repeat.txt FOR /F "tokens=* delims=" %%x in (repeat.txt) DO set repeat=%%x

set comrep=0

:repeat

set /a comrep=%comrep%+1
color 02
cls
echo.
set /a p=%robos%/%repeat%

set /a p=100/%p%


echo %repeat%/%robos% images generated. %p% percent.
echo.
echo %repeat%>repeat.txt
echo.
echo New commit will be created in %comrep%/25
set /a repeat=%repeat%+1

:LOOPr
set NUM=%random:~-1,1%
if %NUM% GTR 2 (
goto LOOPr )
if %NUM% LSS 1 (
goto LOOPr )
set genKey=%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%
powershell -Command "Invoke-WebRequest https://robohash.org/%genKey%/set_set4/bgset_bg%NUM% -Outfile %repeat%.png"
::set /p pause=pause?

git add %repeat%.png
git add repeat.txt
set /a comrep2=%comrep%/25
if %comrep%==25 git add log.txt
if %comrep%==25 git commit -m "Cat group %repeat%" -m "This commit was automaticaly generated by gen.bat" -m "This commit changes the repeat.txt file and adds kittens :D" -m "Aaaand the log file."
echo %date%  %time% New cat - ID: %repeat% - Gen Key: %genKey%>>log.txt
if %comrep%==25 set comrep=0

if not %repeat%==%robos% goto repeat
git add log.txt
if not %comrep%==25 git commit -m "Ending cat group" -m "This commit was automaticaly generated by gen.bat and" -m "it was generated to finish creating %robos% cats."
cd..
powershell -Command "Compress-Archive assets assets"
cd assets