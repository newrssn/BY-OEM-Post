Color F2
@echo off
mode con cols=100 lines=30
title 					K-Lite Mega Codec Pack @ 2020
cls

for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\1_Progs\DM* set cdrom=%%i:

@echo.
@echo.
@echo  				$ $ $ K-Lite_Codec_Pack_Mega $ $ $
@echo.
@echo.
@echo.
@echo.
@echo Installing: K-Lite Mega Codec Pack............. WAIT
@%cdrom%\1_Progs\K-Lite_Codec_Pack_1687_Mega.exe /verysilent /norestart /LoadInf="%cdrom%\1_Progs\klcp.ini"
@echo.
@echo.
echo.
@echo.
@echo.
@echo.
@echo  					$ $ $   DONE  $ $ $
@echo off
timeout /t 3 > nul
