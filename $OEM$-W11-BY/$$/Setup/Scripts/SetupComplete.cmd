Label %cdrive% w11sysRU
bcdedit /set description "Win 11 Optimum"
bcdedit /timeout 8


for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\1_Progs\DM* set cdrom=%%i:

regedit /s %cdrom%\1_Progs\DM-win11RU22.reg
regedit /s %cdrom%\1_Progs\DM-Theme.reg
regedit /s %cdrom%\1_Progs\DM-FontRU.reg
regedit /s %cdrom%\1_Progs\DM-Time-Minsk.reg
rem ;regedit /s %cdrom%\1_Progs\DM-UAC-ON.reg
rem ;%cdrom%\1_Progs\DM-Tweaks.cmd

::::rem =============================================================== RunOnceEx-1

:rem SET PP=%SystemDrive%"%systemroot%\sources\$OEM$\$$\SETUP\SCRIPTS"
SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
REG ADD %KEY% /V TITLE /D "WIn11 RunOnce 2022" /f


REG ADD %KEY%\105 /VE /D "K-Lite_Codec_Pack_Mega" /f
REG ADD %KEY%\105 /V 1 /D "%cdrom%\1_Progs\klcp_mega_unattended.cmd" /f

REG ADD %KEY%\110 /VE /D "7ZIP x64" /f
REG ADD %KEY%\110 /V 1 /D "%cdrom%\1_Progs\7z1900-x64.exe /S" /f

REG ADD %KEY%\120 /VE /D "WinRAR x64" /f
REG ADD %KEY%\120 /V 1 /D "%cdrom%\1_Progs\winrar-x64-611ru.exe /S" /f

REG ADD %KEY%\130 /VE /D "Notepad++" /f
REG ADD %KEY%\130 /V 1 /D "%cdrom%\1_Progs\npp.8.3.1.Installer.x64.exe /S" /f

;REG ADD %KEY%\200 /VE /D "Настройки" /f
;REG ADD %KEY%\200 /V 1 /D "%windir%\setup\scripts\post2.cmd" /f

REG ADD %KEY%\260 /VE /D "Службы и Сервисы" /f
REG ADD %KEY%\260 /V 1 /D "%cdrom%\1_Progs\DM-Tweaks.cmd" /f
REG ADD %KEY%\265 /V 1 /D "%cdrom%\1_Progs\DM-Cursors.cmd" /f
REG ADD %KEY%\267 /V 1 /D "%cdrom%\1_Progs\DM-PS-APPS.PS1" /f

REG ADD %KEY%\300 /VE /D "Уборка" /f
REG ADD %KEY%\300 /V 1 /D "%cdrom%\1_Progs\DM-Cleanup.cmd" /f

REG ADD %KEY%\800 /VE /D "Завершение работы" /f
REG ADD %KEY%\800 /V 99 /D "shutdown /r /t 15 /c \"setup Complete REBOOT in 13\"" /f

;REM shutdown /r /t 15
;REM exit
