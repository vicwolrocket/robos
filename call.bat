@echo off
cls
echo.
echo What is your name?
echo.
set /p name=-
powershell -Command "Invoke-WebRequest https://robohash.org/%name%?set=set1 -Outfile face.png"
start face.png
