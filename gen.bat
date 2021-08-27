@echo off
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


:repeat
color 02
cls
echo.
set /a p=%robos%/%repeat%

set /a p=100/%p%


echo %repeat%/%robos% images generated. %p% percent.
echo.
echo %repeat%>repeat.txt
set /a repeat=%repeat%+1

:LOOPr
set NUM=%random:~-1,1%
if %NUM% GTR 2 (
goto LOOPr )
if %NUM% LSS 1 (
goto LOOPr )

powershell -Command "Invoke-WebRequest https://robohash.org/%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%/set_set4/bgset_bg%NUM% -Outfile %repeat%.png"
::set /p pause=pause?

git add %repeat%.png
git commit -a -m "New robohash cat by gen.bat - ID: %repeat%"

if not %repeat%==%robos% goto repeat

cd..
powershell -Command "Compress-Archive assets assets"
cd assets