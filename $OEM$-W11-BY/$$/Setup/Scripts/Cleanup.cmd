Color 1F
@echo off
mode con cols=90 lines=30
title 					CLEANUP @ DM 2022
cls


@echo.
@echo	* Windows WINDIR%\IME\ folder
cmd.exe /c takeown /f "%WINDIR%\IME\IMEJP\*.*" && icacls "%WINDIR%\IME\IMEJP\*.*" /grant administrators:F
cmd.exe /c takeown /f "%WINDIR%\IME\IMEKR\*.*" && icacls "%WINDIR%\IME\IMEKR\*.*" /grant administrators:F
cmd.exe /c takeown /f "%WINDIR%\IME\IMETC\*.*" && icacls "%WINDIR%\IME\IMETC\*.*" /grant administrators:F
RMDIR /q /s "%WINDIR%\IME\IMEJP\" >nul
RMDIR /q /s "%WINDIR%\IME\IMEKR" >nul
RMDIR /q /s "%WINDIR%\IME\IMETC\" >nul
@echo  Done.
timeout /t 2 > nul

@echo.
@echo	* Windows SoftwareDistribution\Download\ folder
RMDIR /s /q "%WINDIR%\SoftwareDistribution\Download\" >nul
MKDIR "%WINDIR%\SoftwareDistribution\Download"
@echo  Done.
timeout /t 2 > nul

@echo.
@echo	* Windows \Installer\ folder
cmd.exe /c takeown /f "%WINDIR%\Installer\*.*" && icacls "%WINDIR%\Installer\*.*" /grant administrators:F
RMDIR /q /s "%WINDIR%\Installer\"
MKDIR "%WINDIR%\Installer"
@echo  Done.
timeout /t 2 > nul

@echo.
@echo	* Windows WinSxS\backup folder
cmd.exe /c takeown /f "%WINDIR%\WinSxS\backup" && icacls "%WINDIR%\WinSxS\backup" /grant administrators:F
DEL /s /f /q "%WINDIR%\WinSxS\backup\*.*"
REM RMDIR /q /s "%WINDIR%\WinSxS\backup\" >nul
@echo  Done.
timeout /t 2 > nul

@echo.
@echo	* Windows WLSetup folder
DEL /s /f /q "\ProgramData\Microsoft\WLSetup\*.*"
@echo  Done.
timeout /t 2 > nul

@echo.
@echo	* Windows User TEMP folder
RMDIR /s /q "%WINDIR%\Temp\" >nul
MKDIR "%WINDIR%\Temp"
DEL /s /f /q "%WINDIR%\Temp\*.*"
DEL /F /S /Q %TEMP%
@echo  Done.
timeout /t 2 > nul

for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\1_Progs\DM* set cdrom=%%i:
@echo.
@echo	* REGEDIT
regedit /s "%cdrom%\1_Progs\DM-win11RU22.reg"
@echo  Done.
timeout /t 2 > nul

@echo.
@echo	* CCLEANER
rem START "CCleaner" /d "%ProgramFiles%\CCleaner" /I /B /wait "%ProgramFiles%\CCleaner\CCleaner64.exe" /AUTO
rem START /d "%ProgramFiles%\CCleaner\" /i /wait CCleaner64.exe /AUTO
%ProgramFiles%\CCleaner\CCleaner64.exe /AUTO
@echo  Done.
timeout /t 5 > nul


@echo.
@echo	* Windows Cleaner MGR
regedit /s "%cdrom%\1_Progs\DM-VolumeCaches1358.reg
IF EXIST %SystemRoot%\SYSTEM32\cleanmgr.exe START /WAIT cleanmgr /sagerun:1358
@echo  Done.

;======================================================================
@echo.
@echo	* Windows \Setup\Scripts Folder
RMDIR /S /Q "%WINDIR%\Setup\Scripts" >nul
@echo  Done.

msg * /time:5 "ОЧИСТКА ЗАКОНЧЕНА :)"
; DM_MSG_DONE.vbs
exit