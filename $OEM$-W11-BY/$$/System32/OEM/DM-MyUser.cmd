; $OEM$-W11-BY\$1\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\my new user file

 Color 8F
@echo off
mode con cols=130 lines=30
title 					WELCOME new user! 
cls

@echo.
@echo.
@echo * Windows 11: New user config
@echo.
@echo * NEW User  - Optimizing   Pls WAIT...
@echo.
;regedit /s %WINDIR%\System32\OEM\DM-IE11.reg
regedit /s %WINDIR%\System32\OEM\MyUser.reg
@echo * TWIAKS - Done!
timeout /t 1 > nul

@echo.
@echo.
@echo * THEME
;regedit /s %WINDIR%\System32\OEM\DM-ThemeL.reg
timeout /t 1 > nul
%WINDIR%\Resources\Themes\OWNER-L.theme
%WINDIR%\System32\rundll32.exe desk.cpl,InstallScreenSaver %WINDIR%\SysWOW64\Panerai Luminor Marina.scr
timeout /t 1 > nul

@echo.
@echo.
@echo * Mouse Settings - Done!
timeout /t 1 > nul

@echo.
@echo.
@echo.	*** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
@echo.  	*** OneDrive has been removed. Windows Explorer needs to be restarted.
timeout /t 1 > nul

powercfg -change -monitor-timeout-ac 30
powercfg -change -monitor-timeout-dc 5
powercfg -change -disk-timeout-ac 30
powercfg -change -disk-timeout-dc 15
powercfg -change -standby-timeout-ac 60
powercfg -change -standby-timeout-dc 20
powercfg -change -hibernate-timeout-ac 0
powercfg -change -hibernate-timeout-dc 0
;powercfg /h off

@echo.  SLEEP timeouts  Done.
@echo.-----------------------------------
timeout /t 3 > nul

@echo.
@echo.
rem choice /C YN /M "New User LOGOUT"
DEL /s /f /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.cmd"

@echo.
@echo.
@echo * Done! Please Login again.
timeout /t 1 > nul
rem shutdown /f /l