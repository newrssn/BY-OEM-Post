; $OEM$-W11-BY\$1\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\my new user file

 Color 8F
@echo off
mode con cols=100 lines=30
title 					 » Добро Пожаловать «
cls
@ECHO OFF
rem color 0B
rem mode con:cols=100 lines=15
@cls

echo "                                    ";
echo "##### ####  #   # ####  ##### ##### ";
echo "#   # #   # #  ## #   # #       #   ";
echo "#   # ####  # # # ####  ####    #   ";
echo "#   # #     ##  # #   # #       #   ";
echo "#   # #     #   # ####  #####   #   ";
echo "                                    ";
echo "                                    ";
echo "                                    ";
                                           

@echo off


CHOICE /C дн /M "Можно установить свои настройки? д/н По умолчанию ДА через 3 минуты " /t 180 /D д
IF %ERRORLEVEL% EQU 1 goto YES
IF %ERRORLEVEL% EQU 2 goto NO

:YES
@echo.
@echo.
@echo * Windows 11: Оптимизируем установки нового пользователя * 
@echo.
@echo * РЕГИСТРЫ... *
@echo.
regedit /s %WINDIR%\System32\OEM\MyUser.reg
@echo * Установлены!
timeout /t 1 > nul
@echo.
@echo.
@echo * Курсор
:timeout /t 1 > nul
@echo.
@echo 	* HUD-Evolution-Turquoise-EZEvolution Install
rem InfDefaultInstall.exe "%SystemRoot%\Cursors\HUD-Evolution-Turquoise-EZEvolution\install.inf"
@echo.
@echo 	* MAC Mouse
rem InfDefaultInstall.exe "%SystemRoot%\Cursors\MAC\install.inf"
@echo  Done.
timeout /t 1 > nul

@echo.
@echo.
@echo * ТЕМА - Светлая
REM :regedit /s %WINDIR%\System32\OEM\DM-ThemeL.reg
timeout /t 1 > nul
%WINDIR%\Resources\Themes\МИНСК22-День.theme
@echo * Заставка - Часы 
%WINDIR%\System32\rundll32.exe desk.cpl,InstallScreenSaver %WINDIR%\SysWOW64\Panerai Luminor Marina.scr
timeout /t 1 > nul



@echo.
@echo.
@echo * Формат Времени вс 24.04.22
regedit /s %WINDIR%\System32\OEM\DM-Time-Minsk.reg
@echo.------------------------------------------------
timeout /t 1 > nul

powercfg -change -monitor-timeout-ac 30
powercfg -change -monitor-timeout-dc 5
powercfg -change -disk-timeout-ac 30
powercfg -change -disk-timeout-dc 15
powercfg -change -standby-timeout-ac 60
powercfg -change -standby-timeout-dc 20
powercfg -change -hibernate-timeout-ac 0
powercfg -change -hibernate-timeout-dc 0
powercfg /h off
@echo.
@echo.
@echo.------------------------------------------------
@echo. »»» Внесены изменения в режимы питания «««.
@echo.------------------------------------------------
timeout /t 3 > nul

@echo.
@echo.
@echo.------------------------------------
@echo.	*** Меняю настройки панели СТАРТ 
REM :PowerShell C:\> Import-StartLayout -LayoutPath "%WINDIR%\System32\OEM\DM-LayoutMod.json"
REM :PowerShell Import-StartLayout -LayoutPath %WINDIR%\System32\OEM\DM-LayoutMod.json
REM :PowerShell Import-StartLayout -LayoutPath "C:\Windows\System32\OEM\DM-LayoutMod.json"
@echo.
@echo.timeout /t 1 > nul 

@echo.
@echo.
@echo.------------------------------------
@echo.	*** Меняю настройки меню Правого клика
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
 @echo.   ***Сделано меню как на 7ке ***
@echo.------------------------------------
@echo.
@echo.timeout /t 1 > nul

@echo.
@echo.
@echo.------------------------------------
@echo.	*** Удаляем  OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
@echo.   *** OneDrive УДАЛЁН ***
@echo.------------------------------------
@echo.
@echo.timeout /t 1 > nul 
@echo.
@echo.
rem choice /C YN /M "New User LOGOUT"
DEL /s /f /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.cmd"


@echo.

echo "                                                        ";
echo "####  #####   #   #####  ###  #####    #   ####  #  ##  ";
echo " #     #  #  # #  #   # #   #  #  #   # #  #   # # #  # ";
echo " ####  #  # ##### #     #   #  #  #  ##### ####  ###  # ";
echo " #  #  #  # #   # #     #   #  ####  #   # #     # #  # ";
echo "##### #   # #   # #      ###  #    # #   # #     #  ##  ";
echo "                                                        ";

@echo * Рекомендую пере-Загрузиться  *
PAUSE >nul
exit

:NO
@echo.
@echo * А Зря ... тогда Все настройки по умолчанию *
rem InfDefaultInstall.exe "%SystemRoot%\Cursors\HUD-Evolution-Turquoise-EZEvolution\install.inf"
rem InfDefaultInstall.exe "%SystemRoot%\Cursors\MAC\install.inf"
DEL /s /f /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.cmd"
@echo.
timeout /t 3 > nul