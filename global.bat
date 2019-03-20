@echo off

timeout /t 15
call :downloadbyhackoo https://raw.githubusercontent.com/TTT2866/Globalcmd/master/Global/call.bat call.bat
set /p firstline=<call.bat
::should get the first line for call.bat
set fline=%firstline%
::have to pass the variable for it to work I think

if %fline%=="REM key" echo Key exists
pause
exit

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
