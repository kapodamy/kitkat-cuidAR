chcp 1252
echo off
cls

IF EXIST "%cd%\dist\ar.gob.coronavirus.apk" (
    del /q /f "%cd%\dist\ar.gob.coronavirus.apk"
)

java -Xmx1024m -jar "C:\Program Files (x86)\apkstudio\apktool.jar" b "%cd%" --use-aapt2 2>build.log
IF %ERRORLEVEL% NEQ 0 (
    goto :error
)

title success
pause
exit

:error
title error
echo.
echo.
echo.
echo Errors found, see build.log file
pause
exit
