@echo off
:LOOP
set NUM=%random:~-1,1%
if %NUM% GTR 2 (
goto LOOP )
if %NUM% LSS 1 (
goto LOOP )


echo %NUM%
pause